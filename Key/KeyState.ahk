﻿Class KeyState{
	static rep:={"<":"L",">":"R","#":"(LWin|RWin)&","!":"Alt&","^":"Ctrl&","+":"Shift&","*":"","~":""}
	static keyState:=new KeyState().Sugar()
	__New(E:=""){
		this.Set(E)
	}
	_Replace(e){
		if(e=="")
			return e
		for k,v in this.rep
			e:=StrReplace(e,k,v)
		return e
		
	}
	Get(e:=""){
		return this.GetStatus(e?this._Replace(e):this._e)
	}
	Set(e){
		this.E:=E,this._e:=this._Replace(E)
		return this
	}
	Call(){
		return this.GetStatus(this._e)
	}
	GetStatus(e){
		if(rIndex:=InStr(e,")")){
			prev:=SubStr(e,1,rIndex-1),lIndex:=InStr(prev,"(",,0)
			mid:=this.GetStatus(SubStr(prev,lIndex+1))?"":"_"
			return this.GetStatus(SubStr(prev,1,lIndex-1) . mid . SubStr(e,rIndex+1))
		}
		return this._GetState(e)
	}
	GetState(e){
		t:=InStr(e,"@") ? "T": InStr(e,"$")? "P":"",e:=Trim(StrReplace(StrReplace(e,"@"),"$"))
		return e==""?1:GetKeyState(e,t)
	}
	_GetState(e){
		if(InStr(e,"|")){
			for k, v in StrSplit(e,"|")
				if(this._GetState(v))
					return 1
			return 0
		}
		for k,v in StrSplit(e,"&")
			if(!this.GetState(StrReplace(v,"_",,count))^(Mod(count,2)))
				return 0
		return 1
	}
	Sugar(){
		"".base.GetStatus:=KeyState.Get.Bind(this)
		"".base.GetState:=KeyState._GetState.Bind(this)
		return this
	}
}
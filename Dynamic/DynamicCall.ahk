class DynamicCall{
  __New(E){
    this.Initial(E)
  }

  Initial(E){
    arr:=StrSplit(E, ",")
    this.targets:=StrSplit(arr.RemoveAt(1), ".")
    this.params:=arr
  }

  Call(){
    if(this.targets.Length()==0){
      return 0
    }
    target:=this.targets.RemoveAt(1)
    if(IsFunc(target)){
      target:=Func(target)
    }else{
      target:=%target%
    }
    for key,value in this.targets {
      target:=target[value]
    }
    return target.Call(this.params*)
  }
}
DynamicCall(E){
  arr:=StrSplit(E, ",")
  targets:=StrSplit(arr.RemoveAt(1), ".")
  params:=arr
  if(targets.Length()==0){
    return 0
  }
  target:=targets.RemoveAt(1)
  if(IsFunc(target)){
    target:=Func(target)
  }else{
    target:=%target%
  }
  for key,value in targets {
    target:=target[value]
  }
  return target.Call(params*)
}

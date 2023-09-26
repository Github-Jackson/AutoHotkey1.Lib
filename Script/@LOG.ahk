class @LOG{
  static LOG:=""
  __New(filename:="log.txt",encoding:=""){
    this.filename := filename
    this.encoding :=encoding
    @LOG.LOG:= this
    this.Open()
  }

  Open(){
    this.logfile:=FileOpen(this.filename, "a", encoding)
  }

  Write(text){
    return this.logfile.Write(text)
  }
  WriteLine(text){
    return this.logfile.WriteLine(text)
  }
  Flush(){
    return this.logfile.Read(0)
  }
  Close(){
    return this.logfile.Close()
  }
  Call(text){
    this.Write(text)
  }
}
@LOG(text){
  @LOG.LOG.Open()
  @LOG.LOG.Write(text)
  @LOG.LOG.Close()
}
@LOGN(text:=""){
  @LOG.LOG.Open()
  @LOG.LOG.WriteLine(text)
  @LOG.LOG.Close()
}
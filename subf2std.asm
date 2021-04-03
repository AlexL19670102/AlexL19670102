;-------------- subf2std.asm ------------
.686
.MODEL flat
  public _fres
.DATA
  _fres DD 0
.CODE
  
 _subf2  PROC ;cdecl
  push  EBP
  mov   EBP, ESP
 ;
  finit
  fld   DWORD PTR [EBP+8]  ;загрузить число f1 в ST(0)
  fsub  DWORD PTR [EBP+12] ; вычесть из f1 число f2
  lea   ESI, _fres
  fst   DWORD PTR [ESI]
  fwait
  pop   EBP
  ;mov   EAX, offset _fres
  ret   
 _subf2 ENDP
 
 _add100@4 PROC     
  push EBP
  mov  EBP, ESP
  mov  EAX, DWORD PTR [EBP+8]
  add  EAX, 100
  pop  EBP
  ret  4
 _add100@4 ENDP
 
END
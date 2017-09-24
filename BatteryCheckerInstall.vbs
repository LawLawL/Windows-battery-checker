msgbox "Hi, this is gonna install a battery checker, hope you'll enjoy it! "
' Dim Code

Code = "Set oShell = CreateObject (""WScript.Shell"")" & vbCrLf &_
"strComputer = "".""" & vbCrLf &_
"Do While 1" & vbCrLf &_ 
"	On Error Resume Next"& vbCrLf &_ 
"	Set objWMIService = GetObject(""winmgmts:\\"" & strComputer & ""\root\cimv2"")"& vbCrLf &_
"	Set colItems = objWMIService.ExecQuery(""Select * from Win32_Battery"",,48)"& vbCrLf &_ 
"	For Each objItem in colItems"& vbCrLf &_
"		If objItem.EstimatedChargeRemaining = ""98"" Then" & vbCrLf &_ 
"			msgbox ""Battery charged"",0,""Battery checker"""& vbCrLf &_
"			oShell.AppActivate ""Battery checker"""& vbCrLf &_
"		End If"& vbCrLf &_
"	Next"& vbCrLf &_
"	WScript.Sleep 120000" & vbCrLf &_
"Loop"

Set Shell0=CreateObject("Scripting.FileSystemObject")

outFile="BatteryChecker.vbs"
Set objFile = Shell0.CreateTextFile(outFile,True)
objFile.Write Code & vbCrLf
objFile.Close

Set Shell1 = WScript.CreateObject("WScript.Shell")
nameUser = Shell1.ExpandEnvironmentStrings( "%userprofile%" )

dim Dossier
Dossier = Shell0.GetAbsolutePathName(".")

Dim Shell2, DesktopPath, INK
Set Shell2 = CreateObject("WScript.Shell")
Set Ink = Shell2.CreateShortcut(nameUser & "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\BatteryChecker.lnk")
Ink.TargetPath = Dossier & "\BatteryChecker.vbs"
Ink.Save

Shell2.Run "BatteryChecker.vbs"
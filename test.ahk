#singleinstance
#singleinstance force
#NoTrayIcon
SetControlDelay, -1
SetDefaultMouseSpeed,0
SetWinDelay,-1
SetKeyDelay,-1
SetMouseDelay,-1
SetBatchLines,-1

Gui, Font, s10, 돋음
gui,color,col,Yellow
gui,color,0xc0c0c0
Menu, mFile, add, test1, message1
Menu, mFile, add, test2, message1
menu, Mymenubar, Add, File, :mFile
Gui, Menu, MyMenuBar

Gui, Add, Text, x10 y3 w500 h30, Enter String:
Gui, Add, Edit, x10 y20 w500 h20 vEdit1,

Gui, Add, Text, x10 y45 w500 h30, Enter String:
Gui, Add, Edit, x10 y60 w500 h20 vEdit2,

gui,submit,nohide
Gui, Show, h500 w1080, This is an test
gosub, load
return

F5:: PAUSE

F1::
gui,submit,nohide
clipboard = %Edit1%
send,{ctrl down}{v}
sleep,80
send,{ctrl up}
return

F2::
gui,submit,nohide
clipboard = %Edit2%
send,{ctrl down}{v}
sleep,80
send,{ctrl up}
return

F12::
gui,submit,nohide
gosub, save
RELOAD
return


message1:
msgbox,,notice, This is a test
return

Guiclose:
gosub, save
gui,submit,nohide
exitapp

save:
gui,submit,nohide
IniWrite,%Edit1%, save.ini, Messages, String
IniWrite,%Edit2%, save.ini, Messages, String2
return

load:
IniRead, 12, save.ini, Messages, String
IniRead, 13, save.ini, Messages, String2
GuiControl,,Edit1, %12%
GuiControl,,Edit2, %13%
return
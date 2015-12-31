#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ###
$Form1 = GUICreate("Mifare BCC", 210, 114)
$Input1 = GUICtrlCreateInput("12345678", 24, 40, 129, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_UPPERCASE))
$Input2 = GUICtrlCreateInput("", 160, 40, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_UPPERCASE,$ES_READONLY))
$Button1 = GUICtrlCreateButton("Calculate", 64, 72, 75, 25, $BS_DEFPUSHBUTTON)
$Label1 = GUICtrlCreateLabel("4 byte UID", 24, 16, 158, 17, $SS_CENTER)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
$nMsg = GUIGetMsg()
Switch $nMsg
Case $GUI_EVENT_CLOSE
Exit

Case $Button1
$Serial = GUICtrlRead($Input1);
Dim $b[5]
For $i = 0 to 3 Step 1
$b[$i] = Binary("0x" & StringMid($Serial, $i*2+1, 2))
$b[4] = BinaryMid(BitXOR($b[4],$b[$i]),1,1)
Next
GUICtrlSetData($Input1, StringLeft($Serial,8))
GUICtrlSetData($Input2, Hex($b[4]))
;или так GUICtrlSetData($Input2, Hex(BinaryMid(BitXOR($b[0],$b[1],$b[2],$b[3]),1,1)))

EndSwitch
WEnd

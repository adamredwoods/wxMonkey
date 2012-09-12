'
'wxMessageDialog

Import wxmonkey

Extern

Global	wxOK	="wxOK"
Global	wxCANCEL	="wxCANCEL"
Global	wxYES_NO	="wxYES_NO"
Global	wxYES_DEFAULT	="wxYES_DEFAULT"
Global	wxNO_DEFAULT	="wxNO_DEFAULT"
Global	wxICON_EXCLAMATION	="wxICON_EXCLAMATION"
Global	wxICON_HAND	="wxICON_HAND"
Global	wxICON_ERROR	="wxICON_ERROR"
Global	wxICON_QUESTION	="wxICON_QUESTION"
Global	wxICON_INFORMATION	="wxICON_INFORMATION"
Global	wxSTAY_ON_TOP	="wxSTAY_ON_TOP"


Class wxMessageDialog Extends wxDialog = "wxMonkeyMessageDialog"
	
	''special handler for non-conventions
	Method Create:Bool(parent:wxWindow, message:wxMString, caption:wxMString = wxString("Message box"),
			style:Int = wxOK | wxCANCEL, pos:wxPoint = wxDefaultPosition) '= "Create_" ''trans compiler crashes???

	
End

Public
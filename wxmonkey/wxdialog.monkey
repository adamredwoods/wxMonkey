''
''wxdialog

''NOTES:
'' dialogs are destroyed by GC during modal

Import wxmonkey

Extern

Global	wxCAPTION	="wxCAPTION"
Global	wxDEFAULT_DIALOG_STYLE	="wxDEFAULT_DIALOG_STYLE"
Global	wxRESIZE_BORDER	="wxRESIZE_BORDER"
Global	wxSYSTEM_MENU	="wxSYSTEM_MENU"
Global	wxCLOSE_BOX	="wxCLOSE_BOX"
Global	wxMAXIMIZE_BOX	="wxMAXIMIZE_BOX"
Global	wxMINIMIZE_BOX	="wxMINIMIZE_BOX"
Global	wxTHICK_FRAME	="wxTHICK_FRAME"
Global	wxSTAY_ON_TOP	="wxSTAY_ON_TOP"
Global	wxNO_3D	="wxNO_3D"
Global	wxDIALOG_NO_PARENT	="wxDIALOG_NO_PARENT"
Global	wxDIALOG_EX_CONTEXTHELP	="wxDIALOG_EX_CONTEXTHELP"
Global	wxDIALOG_EX_METAL	="wxDIALOG_EX_METAL"


Class wxDialog Extends wxWindow ="wxMonkeyDialog"
'Class wxDialog ="wxMonkeyDialog"

	Method Create:Bool(parent:wxWindow, id:Int, title:wxMString, pos:wxPoint = wxDefaultPosition,
			 size:wxSize = wxDefaultSize, style:Int = wxDEFAULT_DIALOG_STYLE, name:wxMString = wxString("dialogBox")) '="new wxDialog"
	
	''for wxmessagedialog
	Method Create:Bool(parent:wxWindow, message:wxMString, caption:wxMString = wxString("Message box"),
			style:Int = wxOK | wxCANCEL, pos:wxPoint = wxDefaultPosition)
	
	''for filedialog
	Method Create:Bool( parent:wxWindow, message:wxMString = wxString("Choose a file"), defaultDir:wxMString = wxEmptyString,
			 defaultFile:wxMString = wxEmptyString, wildcard:wxMString = wxString("*.*"), style:Int = wxFD_DEFAULT_STYLE,
			 pos:wxPoint = wxDefaultPosition, sz:wxSize = wxDefaultSize, name:wxMString = wxString("filedlg"))
	
	
			
	Method Centre:Void(direction:Int = wxBOTH)
	Method Center:Void(direction:Int = wxBOTH)
	'wxSizer* CreateButtonSizer(long flags)
	'wxStdDialogButtonSizer* CreateStdDialogButtonSizer(long flags)
	Method EndModal:Void(retCode:Int)
	Method GetAffirmativeId:Int()
	Method GetEscapeId:Int()
	Method GetReturnCode:Int()
	Method IsModal:Bool()
	
	Method SetAffirmativeId:Void(id:Int)
	Method SetEscapeId:Void(id:Int)
	Method SetReturnCode:Void(retCode:Int)
	Method Show:Bool(show:Bool)
	Method ShowModal:Int()
	
	Method Destroy:Bool()
	Method Close:Bool(force:Bool = False)
End

Public

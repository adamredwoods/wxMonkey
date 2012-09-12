''
''wxwindow

Import wxmonkey

Extern

Global	wxFD_DEFAULT_STYLE	="wxFD_DEFAULT_STYLE"
Global	wxFD_OPEN	="wxFD_OPEN"
Global	wxFD_SAVE	="wxFD_SAVE"
Global	wxFD_OVERWRITE_PROMPT	="wxFD_OVERWRITE_PROMPT"
Global	wxFD_FILE_MUST_EXIST	="wxFD_FILE_MUST_EXIST"
Global	wxFD_MULTIPLE	="wxFD_MULTIPLE"
Global	wxFD_CHANGE_DIR	="wxFD_CHANGE_DIR"
Global	wxFD_PREVIEW	="wxFD_PREVIEW"


Class wxFileDialog Extends wxDialog ="wxMonkeyFileDialog"

	Method Create:Bool( parent:wxWindow, message:wxMString = wxString("Choose a file"), defaultDir:wxMString = wxEmptyString,
			 defaultFile:wxMString = wxEmptyString, wildcard:wxMString = wxString("*.*"), style:Int = wxFD_DEFAULT_STYLE,
			 pos:wxPoint = wxDefaultPosition, sz:wxSize = wxDefaultSize, name:wxMString = wxString("filedlg")) '= "Create"

	Method GetDirectory:wxMString()
	Method GetFilename:wxMString()
	'Method Void GetFilenames(wxArrayString& filenames) Const ''needs conversion method
	Method GetFilterIndex:Int()
	Method GetMessage:wxMString()
	Method GetPath:wxMString() 
	'Method Void GetPaths(wxArrayString& paths) Const
	Method GetWildcard:wxMString()
	Method SetDirectory:Void(directory:wxMString)
	Method SetFilename:Void(setfilename:wxMString)
	Method SetFilterIndex:Void(filterIndex:Int)
	Method SetMessage:Void(message:wxMString)
	Method SetPath:Void(pat:wxMStringh)
	Method SetWildcard:Void(wildCard:wxMString)
	Method ShowModal:Int()
	
	
End

Public

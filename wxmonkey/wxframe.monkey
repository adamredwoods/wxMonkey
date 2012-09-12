''
''wxframe

''-- frame style take longs

Import wxmonkey

Extern

Global	wxDEFAULT_FRAME_STYLE:Int	="wxDEFAULT_FRAME_STYLE"
Global	wxICONIZE	="wxICONIZE"
Global	wxCAPTION	="wxCAPTION"
Global	wxMINIMIZE	="wxMINIMIZE"
Global	wxMINIMIZE_BOX	="wxMINIMIZE_BOX"
Global	wxMAXIMIZE	="wxMAXIMIZE"
Global	wxMAXIMIZE_BOX	="wxMAXIMIZE_BOX"
Global	wxCLOSE_BOX	="wxCLOSE_BOX"
Global	wxSTAY_ON_TOP	="wxSTAY_ON_TOP"
Global	wxSYSTEM_MENU	="wxSYSTEM_MENU"
Global	wxRESIZE_BORDER	="wxRESIZE_BORDER"
Global	wxFRAME_TOOL_WINDOW	="wxFRAME_TOOL_WINDOW"
Global	wxFRAME_NO_TASKBAR	="wxFRAME_NO_TASKBAR"
Global	wxFRAME_FLOAT_ON_PARENT	="wxFRAME_FLOAT_ON_PARENT"
Global	wxFRAME_EX_CONTEXTHELP	="wxFRAME_EX_CONTEXTHELP"
Global	wxFRAME_SHAPED	="wxFRAME_SHAPED"
Global	wxFRAME_EX_METAL	="wxFRAME_EX_METAL"



Class wxFrame Extends wxWindow ="wxMonkeyFrame"
		
	'Method Create:Bool(parent:wxWindow=Null, id:Int=wxID_ANY, title:wxMString=wxString("wxMonkey")) '= "wxMonkeyFrame::Create_"
	Method Create:Bool(parent:wxWindow=Null, id:Int=wxID_ANY, title:wxMString=wxString("wxMonkey"), pos:wxPoint = wxDefaultPosition,
			size:wxSize = wxDefaultSize, style:Int = wxDEFAULT_FRAME_STYLE, name:wxMString = wxString("wxMonkey"))
	
	Method CreateStatusBar:wxStatusBar(number:Int = 1, style:Int = wxST_SIZEGRIP | wxFULL_REPAINT_ON_RESIZE,
			id:Int = 0, name:wxMString = wxString("statusBar") )
	
	Method CreateToolBar:wxToolBar(style:Int = wxNO_BORDER | wxTB_HORIZONTAL, id:Int = -1, name:wxMString = wxString("toolBar"))

	Method GetClientAreaOrigin:wxPoint() 
	Method GetMenuBar:wxMenubar() 
	Method GetStatusBar:wxStatusBar() 
	Method GetStatusBarPane:Int()
	Method GetToolBar:wxToolBar() 

	Method OnCreateStatusBar:wxStatusBar(number:Int, style:Int, id:Int, name:wxMString) Abstract
	Method OnCreateToolBar:wxToolBar(style:wxLong, id:Int, name:wxMString) Abstract

	Method ProcessCommand:Void(id:Int)
	Method SendSizeEvent:Void()
	Method SetMenuBar:Void(m:wxMenuBar)
	Method SetStatusBar:Void(statusBar:wxStatusBar)
	Method SetStatusBarPane:Void(n:Int)
	Method SetStatusText:Void(text:wxMString, number:Int = 0)
	Method SetStatusWidths:Void(n:Int, widths:Int)
	Method SetToolBar:Void(toolBar:wxToolBar)
	
	Method Show:Int(i:Bool)
	Method Maximize:Void()
    Method Iconize:Void(i:Bool)
	Method SetTitle:Void(s:wxMString)
	

End


Public

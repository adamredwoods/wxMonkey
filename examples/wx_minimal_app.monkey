
Import wxmonkey

Global app:MyApp = New MyApp

Function Main()

	wxMonkeyStart(app)
	
End


Class MyFrame Extends wxFrame
	
	Global MINIMAL_ABOUT:=wxID_ABOUT
	
	Field fileMenu:wxMenu
	Field menuBar:wxMenuBar


	
	Global DYNAMIC_ABOUT:Int = wxID_ABOUT

	
	Method CreateMenu()
		fileMenu= New wxMenu
		fileMenu.Append(MINIMAL_ABOUT, wxString("&About...F1"), wxString("Show about dialog"))
		
		menuBar= New wxMenuBar()
		menuBar.Append(fileMenu, wxString("&File"))
		
		SetMenuBar(menuBar)
		
		Connect(DYNAMIC_ABOUT, wxID_ANY, wxEVT_COMMAND_MENU_SELECTED, wxCommandFunc(wxFuncPtr(ShowAbout() )) )

	End
	

	
	Method ShowAbout:Void(e:wxCommandEvent=Null)
		Local dialog:wxMessageDialog = New wxMessageDialog
		dialog.Create(Self, wxString("This demonstrates dynamic event handling"),
        	wxString("About Dynamic"), wxYES_NO|wxCANCEL)

    	dialog.ShowModal()
		dialog.Close()
	End
	

	
End




Class MyApp Extends wxApp
	
	Global frame:MyFrame

	

	
	Method OnInit:Bool()

		If ( Not wxApp.wxInit() )Then Return False

		
	    '' create the main application window
		frame = New MyFrame
		frame.Create(Null, wxID_ANY, wxString("xxx") )
		frame.SetTitle(wxString("Minimal wxWidgets App"))

		If frame = Null Then Print "frame null" ; Return False
		
		frame.CreateMenu()
				
	    '' show it (the frames, unlike simple controls, are Not shown when created initially)
		SetTopWindow(frame)
	    frame.Show(True)
	
		Return True
		
	End
	
	
End


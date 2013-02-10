
Import wxmonkey

Global app:MyApp = New MyApp

Function Main()

	wxMonkeyStart(app)
	
End



Class tester
	Field i:Float = 999.0
	Method set(j:Float)
		i=j
	End
End

Class MyFrame Extends wxFrame
	
	Global MINIMAL_ABOUT:=wxID_ABOUT
	
	Field fileMenu:wxMenu
	Field menuBar:wxMenuBar
	Field button1:wxButton, button2:wxButton

	Field paintpanel:PaintPanel
	Field panel2:wxPanel
	
	
	Field text_control:wxTextCtrl
	
	Global DYNAMIC_ABOUT:Int = wxID_ABOUT
	Global FILELOAD:Int = 1
	Global FILECLEAR:Int = 2
	Global PAINTEVENT:Int = wxID_ANY
	'Field show_about:MyCommandEvent = New MyCommandEvent
	
	'Field file_dialog:wxFileDialog
	
	Method New()
		Local jj:Int=0
	End
	
	Method CreateMenu()
		fileMenu= New wxMenu
		fileMenu.Append(MINIMAL_ABOUT, wxString("&About...F1"), wxString("Show about dialog"))
		
		menuBar= New wxMenuBar()
		menuBar.Append(fileMenu, wxString("&File"))
		
		SetMenuBar(menuBar)
		
		Connect(DYNAMIC_ABOUT, wxID_ANY, wxEVT_COMMAND_MENU_SELECTED, wxCommandFunc(FuncPtr(ShowAbout() )) )

		
		
		Print 400
	End
	
	Method CreateButtons()
		
		'paintpanel = PaintPanel(wxPanel.Create(Self))
		paintpanel = New PaintPanel
		paintpanel.Create(Self)
		paintpanel.SetSize(0,50,300,250)
		
		'frame.panel2 = New wxPanel
		'frame.panel2.Create(frame)
		'frame.panel2.SetSize(0,0,100,45,0)
		
		button1 = New wxButton
		button1.Create(Self, FILELOAD, wxString("file dialog"), wxCreatePoint(0,0), wxCreateSize(95,40))
		Connect(FILELOAD, wxID_ANY, wxEVT_COMMAND_BUTTON_CLICKED, wxCommandFunc(FuncPtr(ShowFileChooser() )) )
		
		button2 = New wxButton
		button2.Create(Self, FILECLEAR, wxString("clear image"), wxCreatePoint(120,0), wxCreateSize(95,40))
		Connect(FILECLEAR, wxEVT_COMMAND_BUTTON_CLICKED, wxCommandFunc(FuncPtr(paintpanel.ClearImage() )),Null, paintpanel )
		
		paintpanel.Connect( PAINTEVENT, wxEVT_PAINT, wxPaintFunc(FuncPtr(paintpanel.OnPaint() ) ) )
		
		text_control = New wxTextCtrl
		text_control.Create(Self, 1, wxString("type here"), wxCreatePoint(250,10), wxCreateSize(200,25),wxTE_PROCESS_TAB|wxTE_PROCESS_ENTER)
		
		''instant update
		'Connect( wxID_ANY, wxEVT_COMMAND_TEXT_UPDATED, wxCommandFunc(wxFuncPtr(UpdateText())))
		''need to hit enter
		Connect( wxID_ANY, wxEVT_COMMAND_TEXT_ENTER, wxCommandFunc(FuncPtr(UpdateText())))
		
	End
	
	Method UpdateText:Void(e:wxCommandEvent=Null)
		Print wxString(e.GetString())
	End
	
	Method ShowAbout:Void(e:wxCommandEvent=Null)
		Local dialog:wxMessageDialog = New wxMessageDialog
		dialog.Create(Self, wxString("This demonstrates dynamic event handling"),
        	wxString("About Dynamic"), wxYES_NO|wxCANCEL)

    	dialog.ShowModal()
		dialog.Close()
	End
	
	Method ShowFileChooser:Void(e:wxCommandEvent=Null)
		Local file_dialog:wxFileDialog = New wxFileDialog
		
		'Local test:tester = New tester
		'test.set(10.0)
		
		'file_dialog = New wxFileDialog
		file_dialog.Create(Self, wxString("choose a file"), wxEmptyString, wxEmptyString, wxString("*.*"),wxFD_OPEN)
		'file_dialog.Create(Self, teststring, wxEmptyString, wxEmptyString, teststring,wxFD_OPEN, wxDefaultPosition, wxDefaultSize, teststring)
		Local fd_val:Int = file_dialog.ShowModal()
		
		If fd_val
			Print wxString(file_dialog.GetPath())
			'paintpanel.LoadImage("H:\_work\software_dev\_monkey\wxMonkey\183.jpg")
			paintpanel.LoadImage(wxString(file_dialog.GetPath()))
		Endif
		
		'test.set(9.0)
		'Print test.i
		
		file_dialog.Close()
	End
	

	
End



Class PaintPanel Extends wxPanel
	
	Field img:wxBitmap '= New wxBitmap
	'Field dc:wxClientDC = New wxClientDC
	Field tt:tester
	
	
	Method LoadImage:Bool(f$)

		If Not f Then Return

		img = New wxBitmap
		img.LoadFile(wxString(f),wxBITMAP_TYPE_JPEG)
		
		Local dc:wxClientDC = wxCreateClientDC(Self)
		If img
			
			dc.DrawBitmap(img, 0,0)

		Endif
	End
	
	''redraw, not initial draw
	Method OnPaint:Void(e:wxPaintEvent=Null)
	
		Local dc:wxPaintDC = wxCreatePaintDC(Self)
	
		If Not img Then Return	
		
		dc.DrawBitmap(img, 0,0)
		'dc.DrawCircle(0,0,40)

		Return
	End
	
	Method ClearImage:Void(e:wxCommandEvent=Null)
		

		If Not img Then Return
		'img = Null
		Local dc:wxClientDC = wxCreateClientDC(Self)
		dc.Clear()
		img = Null
		
		Print "clear"
		'gcfree(img)
		
	
	
	End
	
End


Class MyTimer Extends wxTimer
	
	Method Notify:Void()
		Print "one second"
	End
	
End



Class MyApp Extends wxApp
	
	Global frame:MyFrame
	Field timer:MyTimer, timer2:MyTimer2
	
	Field name:String
	
	Method OnInit:Int()
		

		'If ( Not wxApp.wxInit() )Then Return False
		If ( Not wxAppBaseInit() )Then Return False

		
		'wxInitAllImageHandlers
		wxAddJPEGHandler()
		
	    '' create the main application window
		name = "Minimal wxWidgets App"
		frame = New MyFrame
		frame.Create(Null, wxID_ANY, wxString("xxx"), wxDefaultPosition )
		frame.SetTitle(wxString(name))
		frame.SetSize(600,500)

		If frame = Null Then Print "frame null" ; Return False
		
		frame.CreateMenu()
				
	    '' And show it (the frames, unlike simple controls, are Not shown when
	    '' created initially)
		
		'frame.Maximize()
		'frame.Iconize(False)
		Print 235
		
		frame.CreateButtons()
		
		SetTopWindow(frame)
	    frame.Show(True)
		
		timer = New MyTimer()
		If Not timer.Start(1000) Print "no timer"

		
		Return True
		
	End
	
	
End


''
''wxglcontext



Import wxmonkey

Extern

''glcanvas attribs
Global	WX_GL_RGBA	="WX_GL_RGBA"
Global	WX_GL_BUFFER_SIZE	="WX_GL_BUFFER_SIZE"
Global	WX_GL_LEVEL	="WX_GL_LEVEL"
Global	WX_GL_DOUBLEBUFFER	="WX_GL_DOUBLEBUFFER"
Global	WX_GL_STEREO	="WX_GL_STEREO"
Global	WX_GL_AUX_BUFFERS	="WX_GL_AUX_BUFFERS"
Global	WX_GL_MIN_RED	="WX_GL_MIN_RED"
Global	WX_GL_MIN_GREEN	="WX_GL_MIN_GREEN"
Global	WX_GL_MIN_BLUE	="WX_GL_MIN_BLUE"
Global	WX_GL_MIN_ALPHA	="WX_GL_MIN_ALPHA"
Global	WX_GL_DEPTH_SIZE	="WX_GL_DEPTH_SIZE"
Global	WX_GL_STENCIL_SIZE	="WX_GL_STENCIL_SIZE"
Global	WX_GL_MIN_ACCUM_RED	="WX_GL_MIN_ACCUM_RED"
Global	WX_GL_MIN_ACCUM_GREEN	="WX_GL_MIN_ACCUM_GREEN"
Global	WX_GL_MIN_ACCUM_BLUE	="WX_GL_MIN_ACCUM_BLUE"
Global	WX_GL_MIN_ACCUM_ALPHA	="WX_GL_MIN_ACCUM_ALPHA"


Class wxGLContext = "wxMonkeyGLContext"
	
	Method Create:Void( win:wxGLCanvas, other_shared:wxGLContext=Null ) = "Create_"

	Method SetCurrent:Void(win:wxGLCanvas)= "SetCurrent2"
	
End


Class wxGLCanvas Extends wxWindow = "wxMonkeyGLCanvas"
	
	Method Create:Void(parent:wxWindow, id:Int = wxID_ANY,  pos:wxPoint = wxDefaultPosition, 
		size:wxSize = wxDefaultSize, style:Int=0, name:wxMString=wxString("GLCanvas"), attribList:Int = 0, palette:wxPalette = wxNullPalette) ="Create_"
	
	Function Create2:wxGLCanvas(parent:wxWindow) = "wxMonkeyGLCanvas::Create2"
	
	Method SetCurrent:Void( RC:wxGLContext ) = "SetCurrent_"
	Method SetCurrent:Void() = "SetCurrent"
	
	Method SwapBuffers:Void() = "wxGLCanvas::SwapBuffers"
	Method Show:Void(b:Bool)
	

End

Function BeginMojo:Void() = "app->GraphicsDevice()->BeginRender"
Function EndMojo:Void() = "app->GraphicsDevice()->Flush"
Function SetMojoWidth:Void(w:Int) = "app->GraphicsDevice()->width="
Function SetMojoHeight:Void(h:Int) = "app->GraphicsDevice()->height="

Function FakeDebugInfo:Void() = "DBG_INFO(~qwxMonkey<FAKE>~q);//"

Public
'
'wxDC
'wxPaintDC

Import wxmonkey

Extern


	'Function wxtest2:Void(b:wxMonkeyDeref, x:Int, y:Int, t:Bool=False) = "wxdc->DrawBitmap"


Class wxDC Extends Null = "wxMonkeyDC"
	
	Function CreatePaintDC:wxPaintDC(window:wxWindow) = "CreatePaintDC"
	Function CreateClientDC:wxClientDC(window:wxWindow) = "CreateClientDC"
	
	Method Clear:Void() = "Clear"
	Method DrawBitmap:Void(bitmap:Pointer, x:Int, y:Int, transparent:Bool=False) ="DrawBitmap"
	Method DrawCircle:Void(x:Int, y:Int, radius:Int) ="DrawCircle"
	Method DrawIcon:Void(icon:wxIcon, x:Int, y:Int) ="DrawIcon"
	Method DrawRectangle:Void(x:Int, y:Int, width:Int, height:Int) ="DrawRectangle"
	Method DrawText:Void(text:wxMString, x:Int, y:Int) ="DrawText"
	Method EndDoc:Void() ="EndDoc"
	Method EndPage:Void() ="EndPage"
	Method StartDoc:Bool(message:wxMString) ="StartDoc"
	Method StartPage:Bool() ="StartPage"

	
End

Class wxPaintDC Extends wxDC = "wxPaintDC"
	
	'Function  Create:wxPaintDC_(window:wxWindow) = "new wxPaintDC"
	
End

Class wxClientDC Extends wxDC = "wxClientDC"
	
	'Function Create:wxClientDC(window:wxWindow) = "new wxClientDC"

End



Public

Function wxCreatePaintDC:wxPaintDC(win:wxWindow)
	Return wxPaintDC.CreatePaintDC(win)
End

Function wxCreateClientDC:wxClientDC(win:wxWindow)
	Return wxClientDC.CreateClientDC(win)
End





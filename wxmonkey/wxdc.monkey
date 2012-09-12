'
'wxDC
'wxPaintDC

Import wxmonkey

Extern


	'Function wxtest2:Void(b:wxMonkeyDeref, x:Int, y:Int, t:Bool=False) = "wxdc->DrawBitmap"


Class wxDC Extends Null = "wxMonkeyDC"
	
	Function wxPaintDC:Void(window:wxWindow) = "wxPaintDC wxdc"
	Function wxClientDC:Void(window:wxWindow) = "wxClientDC wxdc"
	
	Function Clear:Void() = "wxdc.Clear"
	Function DrawBitmap:Void(bitmap:wxMonkeyDeref, x:Int, y:Int, transparent:Bool=False) ="wxdc.DrawBitmap"
	Function DrawCircle:Void(x:Int, y:Int, radius:Int) ="wxdc.DrawCircle"
	Function DrawIcon:Void(icon:wxIcon, x:Int, y:Int) ="wxdc.DrawIcon"
	Function DrawRectangle:Void(x:Int, y:Int, width:Int, height:Int) ="wxdc.DrawRectangle"
	Function DrawText:Void(text:wxMString, x:Int, y:Int) ="wxdc.DrawText"
	Function EndDoc:Void() ="wxdc.EndDoc"
	Function EndPage:Void() ="wxdc.EndPage"
	Function StartDoc:Bool(message:wxMString) ="wxdc.StartDoc"
	Function StartPage:Bool() ="wxdc.StartPage"

	
End

Class wxPaintDC_ Extends wxDC = "wxPaintDC"
	
	Function Create:wxPaintDC_(window:wxWindow) = "new wxPaintDC"
	
End

Class wxClientDC_ Extends wxDC = "wxClientDC"
	
	Function Create:wxClientDC(window:wxWindow) = "new wxClientDC"

End



Public



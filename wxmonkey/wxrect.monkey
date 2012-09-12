'
'wxrect

Import wxmonkey

Extern


Function wxCreateRect:wxRect(x:Int, y:Int, w:Int, h:Int) = "wxRect"

Class wxRect

	Function Create:wxRect(x:Int, y:Int, w:Int, h:Int) = "new wxRect"
	

	Method GetWidth:Int() 
	Method GetHeight:Int() 
	Method GetX:Int()
	Method GetY:Int()
	
	Method SetHeight:Void(height:Int)
	Method SetWidth:Void(width:Int)
	Method SetX:Void(x:Int)
	Method SetY:Void(y:Int)

End

Public

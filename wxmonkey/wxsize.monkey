'
'wxsize

Import wxmonkey

Extern

Global wxDefaultSize:wxSize = "wxDefaultSize"

Function wxCreateSize:wxSize(w:Int, h:Int) = "wxSize"

Class wxSize
	
	Field width:Int
	Field height:int
	
	Function Create:wxSize(w:Int, h:Int) = "new wxSize"
	
	
	Method DecBy:Void(size:wxSize)

	Method DecBy:Void(dx:Int, dy:Int)
	
	Method DecBy:Void(d:Int)
	
	Method DecTo:Void(size:wxSize)
	Method IsFullySpecified:Bool() 
	Method GetWidth:Int() 
	Method GetHeight:Int() 
	Method IncBy:Void(size:wxSize)
	
	Method IncBy:Void(dx:Int, dy:Int)
	
	Method IncBy:Void(d:Int)
	
	Method IncTo:Void(size:wxSize)
	Method Scale:wxSize(xscale:Float, yscale:Float)
	
	Method Set:Void(width:Int, height:Int)
	
	Method SetDefaults:Void(sizeDefault:wxSize)
	
	Method SetHeight:Void(height:Int)
	Method SetWidth:Void(width:Int)


End

Public

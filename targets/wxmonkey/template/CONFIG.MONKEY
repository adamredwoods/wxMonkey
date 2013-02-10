#WXMONKEY=1


#if HOST="winnt"

'#CPP_INCREMENTAL_GC=1


#CC_OPTS0=  " -I~qC:\Monkey\modules\wxmonkey\wxMSW-2.8.12\include~q -L~qc:/mingw/lib~q -L~qC:\Monkey\modules\wxmonkey\wxMSW-2.8.12\lib\gcc_lib~q"
#CC_OPTS1= " -I~qglfw/include~q -I~qstb~q -I~qopenal/include~q -L~qglfw/lib/win32~q -L~qopenal/libs/win32~q"
#CC_OPTS2= " -static -lwxregex -lwxexpat -lwxmsw28_core -lwxbase28 -lwxmsw28_gl -lwxjpeg -lwxpng -lwxtiff -Wl,--subsystem,windows -mwindows -D__WXRELEASE__ -D__WXMSW__ "
#CC_OPTS3= " -lstdc++ -lkernel32 -luser32 -lgdi32 -lcomdlg32 -lwinspool -lwinmm -lshell32 -lcomctl32 -lole32 -loleaut32 -luuid -lrpcrt4 -ladvapi32 -lwsock32 -lodbc32 -lopengl32"
'' for mojo
#CC_OPTS4 = ""
'#CC_OPTS4 = "stb/stb_image.c stb/stb_vorbis.c -lglfw -lopenal32"

#CC_OPTS=CC_OPTS0+CC_OPTS1+CC_OPTS2+CC_OPTS3+CC_OPTS4



#elseif HOST="osx"

'#CPP_INCREMENTAL_GC=1
#CC_OPTS0 = " HEADER_SEARCH_PATHS=~q/Monkey/modules/wxmonkey/wxMac-2.8.12/include~q LIBRARY_SEARCH_PATHS=~q/Monkey/modules/wxmonkey/wxMac-2.8.12/lib~q "+
#CC_OPTS1 = " OTHER_CFLAGS=~q-D__WXRELEASE__ -D__WXMAC__ ~q"+
#CC_OPTS2 = " OTHER_LDFLAGS=~q -lwx_base_carbon-2.8  -lwx_mac_core-2.8 -lwxjpeg-2.8 -lwxpng-2.8 -lwxtiff-2.8~q"
'' for mojo
#CC_OPTS4 = ""
'#CC_OPTS4 = " OTHER_LDFLAGS=~q  -lglfw -lopenal32~q"

#CC_OPTS=CC_OPTS0+CC_OPTS1+CC_OPTS2+CC_OPTS4

#endif

''gets rid of mojo errors
#CPP_DOUBLE_PRECISION_FLOATS=false

#GLFW_WINDOW_WIDTH=640
#GLFW_WINDOW_HEIGHT=480
'#GLFW_WINDOW_RESIZABLE=1
'#GLFW_WINDOW_FULLSCREEN=0
'#GLFW_WINDOW_TITLE="wxMonkey"
#OPENGL_GLES20_ENABLED=False
#MOJO_IMAGE_FILTERING_ENABLED=False
#MOJO_AUTO_SUSPEND_ENABLED=False

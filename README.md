wxMonkey v0.12 -- updated for MonkeyV67  
wxMonkey v0.1 -- initial push (wxWidgets version 2.8.12)

This is a binding of wxWidgets to the programming language Monkey.
This is highly experimental, and there is no guarantee.

..WINDOWS..  
To install, you must be able to create a new target comfortably:  
1. download and build wxwidgets (2.8.12) as a static library (recommend non-monolithic + opengl + non-debug switches)  
2. remember location of build and include files  
3. copy targets/wxmonkey folder to your local monkey/targets folder  
4. copy transcc/builders/wxmonkey.monkey to your local src/transcc/builders/ folder  
5. rebuild src/transcc, and copy to monkey/bin folder (use the C++_STD TOOL)  
6. edit CONFIG.TXT, make sure the paths in CONFIG point to wxWidgets paths for include, mingw (or compiler stdlibs), and wx static libs  
7. compile minimal example  

..OSX (10.6+)..  
1. download and build wxwidgets (2.8.12) as a static library (recommend non-monolithic + opengl + non-debug switches, arch i386 no x64)  
2. remember location of build and include files  
3. copy targets/wxmonkey folder to your local monkey/targets folder 
3b. copy xcode folder to monkey/targets/wxmonkey folder  
4. copy transcc/builders/wxmonkey.monkey to your local src/transcc/builders/ folder  
5. rebuild src/transcc, and copy to monkey/bin folder (use the C++_STD TOOL)  
6. rebuild src/trans, and copy to monkey/bin folder  
7. edit CONFIG.TXT, make sure the paths in CONFIG point to wxWidgets paths for include, and wx static libs  
8. compile minimal example again  


Monkey version (c) Adam Piette

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely.
wxMonkey v0.1 -- initial push (wxWidgets version 2.8.12)

This is a port of wxWidgets to the programming language Monkey.
This is highly experimental, and there is no guarantee.

..WINDOWS..
To install, you must be able to create a new target comfortably:
1. download and build wxwidgets (2.8.12) as a static library (recommend non-monolithic + opengl + non-debug switches)
2. remember location of build and include files
3. copy targets/stdcpp.monkey to your local monkey src/trans/targets folder
4. rebuild src/trans, and copy to monkey/bin folder
5. build the minimal app example... it will fail
6. go inside the .build folder and edit CONFIG.TXT. add the new CC_OPTS from the provided CONFIG_WIN.TXT file.
7. make sure the paths in CONFIG point to wxWidgets paths for include, mingw (or compiler stdlibs), and wx static libs
8. compile minimal example again, and should be successful

..OSX (10.6+)..
1. download and build wxwidgets (2.8.12) as a static library (recommend non-monolithic + opengl + non-debug switches, arch i386 no x64)
2. remember location of build and include files
3. copy targets/stdcpp.monkey to your local monkey/src/trans/targets folder
4. copy xcode folder to monkey/targets/stdcpp folder
5. rebuild src/trans, and copy to monkey/bin folder
6. build the minimal app example... it will fail
7. go inside the .build folder and edit CONFIG.TXT. add the new CC_OPTS from the provided CONFIG_OSX.TXT file.
8. make sure the paths in CONFIG point to wxWidgets paths for include, and wx static libs
9. compile minimal example again, and should be successful


Monkey version (c) Adam Piette

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely.
@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"ruby.exe" "C:/Documents and Settings/IF00126/My Documents/Aptana Studio 3 Workspace/sample_app/sqlite3/ruby/1.9.1/bin/annotate" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"ruby.exe" "%~dpn0" %*

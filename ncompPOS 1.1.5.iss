; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppId={{23C6972E-3959-431D-A2A7-CBBAE6C262C8}
AppName=NCompPOS
AppVerName=NCompPOS ver 1
AppPublisher=ncomp.co.za
AppPublisherURL=http://www.ncomp.co.za/
AppSupportURL=http://www.ncomp.co.za
AppUpdatesURL=http://www.ncomp.co.za
DefaultDirName={pf}\NCompPOS
DefaultGroupName=NCompPOS
; uncomment the following line if you want your installation to run on NT 3.51 too.
; MinVersion=4,3.51

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4
Name: "quicklaunchicon"; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4; Flags: unchecked

[Files]
Source: "{app}\ncompPOS.ini"; DestDir: "{userappdata}\NCompPOS"; CopyMode: onlyifdoesntexist; Flags: external skipifsourcedoesntexist uninsneveruninstall
Source: "{app}\client.txt"; DestDir: "{commonappdata}\NCompPOS"; CopyMode: onlyifdoesntexist; Flags: external skipifsourcedoesntexist uninsneveruninstall
Source: "{app}\footer.txt"; DestDir: "{commonappdata}\NCompPOS"; CopyMode: onlyifdoesntexist; Flags: external skipifsourcedoesntexist uninsneveruninstall
Source: "{app}\logo.bmp"; DestDir: "{commonappdata}\NCompPOS"; CopyMode: onlyifdoesntexist; Flags: external skipifsourcedoesntexist uninsneveruninstall
Source: "u:\bron\ncomp POS\Main Program v T 1.1.5\ncompPOS.exe"; DestDir: "{app}"; CopyMode: alwaysskipifsameorolder
Source: "u:\bron\ncomp POS\InstallFiles\client.txt"; DestDir: "{commonappdata}\NCompPOS"; CopyMode: onlyifdoesntexist; Permissions: users-full
Source: "u:\bron\ncomp POS\InstallFiles\footer.txt"; DestDir: "{commonappdata}\NCompPOS"; CopyMode: onlyifdoesntexist; Permissions: users-full
Source: "u:\bron\ncomp POS\InstallFiles\ncompPOS.ini"; DestDir: "{commonappdata}\NCompPOS"; CopyMode: onlyifdoesntexist; Permissions: users-full
Source: "u:\bron\ncomp POS\Main Program v T 1.1.5\libmysql.dll"; DestDir: "{app}"; CopyMode: alwaysskipifsameorolder
Source: "u:\bron\ncomp POS\Main Program v T 1.1.5\mysql.exe"; DestDir: "{app}"; CopyMode: alwaysskipifsameorolder
Source: "u:\bron\ncomp POS\Main Program v T 1.1.5\mysqldump.exe"; DestDir: "{app}"; CopyMode: alwaysskipifsameorolder
Source: "u:\bron\ncomp POS\InstallFiles\Barcode.rav"; DestDir: "{app}"; CopyMode: onlyifdoesntexist
Source: "u:\bron\ncomp POS\InstallFiles\BarcodeSingle.rav"; DestDir: "{app}"; CopyMode: onlyifdoesntexist
Source: "u:\bron\ncomp POS\InstallFiles\Blank.bmp"; DestName: "logo.bmp"; DestDir: "{commonappdata}\NCompPOS"; CopyMode: onlyifdoesntexist; Permissions: users-full
Source: "u:\bron\ncomp POS\SQL Install 1.1.3\SQLInstall.exe"; DestDir: "{app}"; CopyMode: alwaysoverwrite; Flags: deleteafterinstall
; Source: "u:\bron\RiskfinBegrafnis\CDContent\ODBCSetup.exe"; DestDir: "{tmp}"; CopyMode: alwaysoverwrite; Flags: deleteafterinstall
Source: "u:\bron\ncomp POS\InstallFiles\Purchase Order example import file.csv"; DestDir: "{app}"; CopyMode: alwaysskipifsameorolder

[Icons]
Name: "{group}\NCompPOS"; Filename: "{app}\ncompPOS.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\NCompPOS"; Filename: "{app}\ncompPOS.exe"; MinVersion: 4,4; Tasks: desktopicon; WorkingDir: "{app}"
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\NCompPOS"; Filename: "{app}\ncompPOS.exe"; MinVersion: 4,4; Tasks: quicklaunchicon; WorkingDir: "{app}"
Name: "{group}\NCompPOS Data Files - expert only"; Filename: "{commonappdata}\NCompPOS"

[Run]
; Filename: "{tmp}\ODBCSetup.exe"; Description: "MyODBC, Uncheck if this is a update"; Flags: postinstall
Filename: "{app}\SQLInstall.exe"; Description: "Check to connect NCompPOS with MySQL Server"; Flags: postinstall


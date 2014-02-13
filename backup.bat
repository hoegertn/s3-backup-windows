rem Install 7zip, GnuPG, AWSCLI

@echo off
set Datum=%date:~6,4%%date:~3,2%%date:~0,2%
set Folder=C:\backup
set ZIPFILE=%Folder%\backup-%Datum%.zip
set SrcFolder=C:\<path>\<to>\<data>
set Passphrase=<qwertzuiopasdfghjkl>
set BUCKET=<bucketname>
@echo on

cd %Folder%

del %ZIPFILE%
del %ZIPFILE%.gpg

"c:\Program Files\7-Zip\7z.exe" a %ZIPFILE% "%SrcFolder%"

@gpg --batch --passphrase %Passphrase% -c %ZIPFILE%

aws s3 cp %ZIPFILE%.gpg s3://%BUCKET%/

del %ZIPFILE%
del %ZIPFILE%.gpg

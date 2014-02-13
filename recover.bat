@echo off
set Passphrase=<qwertzuiopasdfghjkl>
set BUCKET=<bucketname>
@echo on

aws s3 ls s3://%BUCKET%/

set /p datum=Bitte Datum eingeben [yyyyMMdd]:

aws s3 cp s3://%BUCKET%/backup-%datum%.zip.gpg .

@gpg --batch --passphrase %Passphrase% -o backup-%datum%.zip -d backup-%datum%.zip.gpg

pause

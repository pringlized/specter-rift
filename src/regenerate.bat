@echo off
REM Run ANTLR to generate the files
java -jar C:\Users\pring\.bin\JavaLib\antlr-4.13.2-complete.jar -Dlanguage=Python3 Grit.g4

REM Convert generated files to Unix-style line endings using Python script
python convert_to_unix.py

REM Print completion message
echo Grit ANTLR src files regenerated with Unix-style line endings..

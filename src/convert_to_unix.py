import os

def convert_to_unix(file_path):
    with open(file_path, 'rb') as file:
        content = file.read()

    content = content.replace(b'\r\n', b'\n')

    with open(file_path, 'wb') as file:
        file.write(content)

files_to_convert = ['GritLexer.py', 'GritParser.py', 'GritListener.py']
for file in files_to_convert:
    convert_to_unix(file)
    print(f'Converted {file} to Unix-style line endings.')

print('All files converted to Unix-style line endings.')

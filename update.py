import os
import subprocess

repos = [
    i for i in os.listdir(".") if os.path.isdir(i)
]


for folder in repos:
    if (not os.path.isdir(f'{folder}/.git')):
        print(f'{folder} - not a git repository')
        continue

    process = subprocess.Popen(f"cd {folder} && git pull", shell=True, stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
    output = process.stdout.read()

    if output == b'Already up to date.\n':
        print(f'{folder} - Already up to date!')
    elif b'file changed' in output:
        print(f'{folder} - Updated!')
    else:
        print(f'{folder} - Something Failed!')

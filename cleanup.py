import extract as e
import os

def cleanup_file():
    print('start cleaning')
    file = e.path_extracter()
    os.remove(file)
    print('end cleaning')

cleanup_file()
import extract as e
import os

def cleanup_file():
    print('start cleaning up file')
    file = e.path_extracter()
    os.remove(file)
    print('end cleanup')

cleanup_file()
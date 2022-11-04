import pathlib

def path_extracter():
    for csv_path in pathlib.Path('/Users/quincytromp/Downloads').glob('*.csv'):
        return csv_path
    
    
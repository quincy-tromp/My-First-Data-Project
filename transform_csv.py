import pandas as pd
import pathlib

def path_finder(path):
    for csv_path in pathlib.Path(path).glob('*.csv'):
        return csv_path

def transform_data(path_finder, path):
    '''Transforms dates from numbers to date-type
    '''
    print('start running')
    csv_path = path_finder(path)

    df = pd.read_csv(csv_path)
    df['Transactiedatum'] = df['Transactiedatum'].apply(lambda row: pd.to_datetime(row, format='%Y%m%d'))
    df.to_csv(csv_path, index=False)

    print('end running')

transform_data(path_finder, '/Users/quincytromp/Downloads')

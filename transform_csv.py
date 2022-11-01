import pandas as pd

CSV_FILE = '/Users/quincytromp/Downloads/Sep-2022.csv'

def transform_data(filename):
    '''Transforms date-column data type from numbers to date.'''
    df = pd.read_csv(filename)
    df['Transactiedatum'] = df['Transactiedatum'].apply(lambda row: pd.to_datetime(row, format='%Y%m%d'))
    df.to_csv(filename, index=False)

if __name__ == '__main__':
    transform_data(CSV_FILE)

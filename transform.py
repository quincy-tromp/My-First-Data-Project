import pandas as pd
import extract as e

def transform_data(extracter):
    '''From date column, transform numbers to dates
    '''
    print('start transforming data')
    data = extracter()

    df = pd.read_csv(data)
    df['Transactiedatum'] = df['Transactiedatum'].apply(lambda row: pd.to_datetime(row, format='%Y%m%d'))
    df.to_csv(data, index=False)

    print('end transform')

transform_data(e.path_extracter)

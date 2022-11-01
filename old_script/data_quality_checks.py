import pandas as pd

def check_labels(cursor, data):
    ''' Checks if labels in the data exist in the database, and returns ValueError if it's not '''

    cursor.execute("select label from labels")

    result = cursor.fetchall()
    labels = []

    for item in result:
        (label,) = item
        labels.append(label.replace(',', ''))

    wrong_label_indexes = []
    for index, row in data.iterrows():
        if row['label'] not in labels:
            wrong_label_indexes.append(index)
    if wrong_label_indexes:
        print("Label does not exist. Index:", wrong_label_indexes)
        # raise Exception
        return f'wrong label at index: {wrong_label_indexes}'
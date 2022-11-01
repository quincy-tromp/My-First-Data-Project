import pandas as pd
import pymysql
import old_script.data_quality_checks as dq


# EXTRACT 
# SHEET_ID = '1DrALHjYwXp7TLjvCo8F1JHwtUdR3tWYxO_ze'

# data = pd.read_csv(f"https://docs.google.com/spreadsheets/d/{SHEET_ID}/export?format=csv")
data = pd.read_csv('XLS221101055627 - Sheet0.csv')

# TRANSFROM 
# data.drop(columns=['accountNumber', 'mutationcode', 'valuedate', 'startsaldo', 'endsaldo'], inplace=True)
data.rename(columns={'Transactiedatum':'date_cd', 'Transactiebedrag':'transact_amount'}, inplace=True)
data['date_cd'] = data['date_cd'].apply(lambda row: pd.to_datetime(row, format='%Y%m%d'))


# LOAD 
try:
    mydb = pymysql.connect(
    host="localhost",
    user="Quincy",
    password="quincy151193",
    database="PF_DB"
    )

    print ('Connected to MySQL database.')

    mycursor = mydb.cursor()

    print('Checking labels.')
    data_quality_check = dq.check_labels(cursor=mycursor, data=data)
    print(data_quality_check)

    print('Start inserting.')
    # sql = "INSERT INTO transactions (transact_dt, transact_amount, label) VALUES (%s, %s, %s)"

    # row_inserted = 0
    # for index, row in data.iterrows():
    #     mycursor.execute(sql, tuple(row))
    #     row_inserted += 1

    # mycursor.close()
    # mydb.commit()
    
    # print(f"\n{row_inserted} of {index+1} row(s) inserted.\n")

except:
    print("Process Failed.")

finally:
    mydb.close()

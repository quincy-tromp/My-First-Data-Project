import extract as e
import pymysql
import os

data = e.path_extracter()

load_query = f"LOAD DATA LOCAL INFILE '{data}' INTO TABLE transactions \
            FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' \
            (@Transactiedatum,@Transactiebedrag,@Label) \
            set transaction_dt=@Transactiedatum,amount=@Transactiebedrag,label=@Label;"

try:
    mydb = pymysql.connect(
    host='localhost',
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_USER_PASSWORD'),
    database='PF_DB',
    local_infile=True
    )
    mycursor = mydb.cursor()

except:
    print('db connection failed')

else:
    print('start loading data')
    try:
        mycursor.execute(load_query)
        mycursor.close()
        mydb.commit()
        mydb.close()
        print('end load')
    except:
        print('loading failed') 
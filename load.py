import extract as e
import pymysql

data = e.path_extracter()

print('start loading')
try:
    mydb = pymysql.connect(
    host='localhost',
    user='quincytromp',
    password='je7z*B196A1LmGU',
    database='PF_DB',
    local_infile=True
    )
    mycursor = mydb.cursor()

    data_load = f"LOAD DATA LOCAL INFILE '{data}' INTO TABLE transactions \
            FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' \
            (@Transactiedatum,@Transactiebedrag,@Label) \
            set transaction_dt=@Transactiedatum,amount=@Transactiebedrag,label=@Label;"


    mycursor.execute(data_load)
    mycursor.close()
    mydb.commit()
    
    print('end loading')

except:
    print('loading failed')

finally:
    mydb.close()

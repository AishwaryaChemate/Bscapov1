
# import pymysql

# db = pymysql.connect(host='localhost',
#                      user='root',
#                      password='',
#                      database='bscapov1',
#                      cursorclass=pymysql.cursors.DictCursor)
# print(db)


import pymysql

def get_db_connection():
    return pymysql.connect(
        host='localhost',
        user='root',
        password='',
        database='bscapov1',
        cursorclass=pymysql.cursors.DictCursor
)


'''

import mysql.connector

db = mysql.connector.connect(
  host="localhost",
  user="root",
  password="tiger",
  database="crm"
)

# Print connection properties
print("MySQL Connection Properties:")
print("Host:", db.server_host)
print("User:", db.user)
print("Database:", db.database)
print("Connection ID:", db.connection_id)


# Check connection status
if db.is_connected():
    print("Connection status: Connected")
else:
    print("Connection status: Not connected")

# Close the connection
db.close()

'''

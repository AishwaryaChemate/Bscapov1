from flask import Flask

import os
from flask import Flask, jsonify, request, send_file, abort
from flask_jwt_extended import JWTManager, jwt_required, create_access_token, get_jwt_identity, get_jwt,unset_jwt_cookies,decode_token
from flask_cors import CORS
from datetime import timedelta
from datetime import date, timedelta,datetime
import calendar
from Connection import get_db_connection # Import the connection function 
import subprocess
import logging
import json
import pandas as pd
from werkzeug.utils import secure_filename

logging.basicConfig(level=logging.DEBUG)
# Create an instance of the Flask class
app = Flask(__name__)
CORS(app)
 

# Configuration for Flask JWT Extended
app.config["JWT_SECRET_KEY"] = "super-secret"  # Change this!
jwt = JWTManager(app)
 
UPLOAD_FOLDER = 'D:\\bscglobal\\BSCAPO\\bscerp2025v1\\backend\\UploadFiles'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Maintain a list of blacklisted tokens
blacklisted_tokens = set()
 
 
# Check if a token is blacklisted
@jwt.token_in_blocklist_loader
def check_if_token_in_blacklist(jwt_header, jwt_payload):
    jti = jwt_payload['jti']
    return jti in blacklisted_tokens

# Define a route that will be used to test the backend
@app.route('/')
def home():
    return {"message": "Sorry 404 "}

 
# Create a route to authenticate users and return JWTs
@app.route("/login", methods=["POST"])
def login():
    username = request.json.get("username", None)
    password = request.json.get("password", None)
 
    # Get cursor for MySQL connection
    # cursor = db.cursor()
    connection = get_db_connection()
    cursor = connection.cursor()
 
    # Execute MySQL query to check user credentials
    cursor.execute("SELECT * FROM user_master WHERE user_name=%s AND password=%s", (username, password))
    user = cursor.fetchone()
    cursor.close()
 
    # If user exists, generate access token
    if user:
        access_token = create_access_token(identity=username)
        return jsonify(access_token=access_token, status=1)
    else:
        return jsonify({"status": "0"}), 401


@app.route('/logout', methods=['POST'])
@jwt_required()
def logout():
    response = jsonify({"message": "Logout successful"})
    unset_jwt_cookies(response)
    return response


@app.route('/verify_token', methods=['POST'])
def verify_token():
    token = request.headers.get('Authorization').split(' ')[1]
    print(f"Received token: {token}")  # Debug statement
    try:
        decoded_token = decode_token(token)
        print("Token is valid")  # Debug statement
        return jsonify({"valid": True})
    except Exception as e:
        print(f"Token verification failed: {e}")  # Debug statement
        return jsonify({"valid": False}), 401
    

@app.route('/plantnameList', methods=['GET']) 
def plant_List(): 
   # cursor = db.cursor() 
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT  product_plant_master.plant_code, product_plant_master.product_code,product_master.base_uom FROM product_plant_master JOIN product_master ON product_plant_master.product_code = product_master.product_code");
  
    results = cursor.fetchall()
    return jsonify(results)    

#added 14-01




# @app.route('/submitdata', methods=['POST']) 
# def submit_data(): 
#     plant_code = request.args.get('plantCode') 
#     product_code = request.args.get('productCode')
#     payload = request.json  # Updated to get the entire payload

#     data = payload.get('data')  # Extract data
#     dates = payload.get('dates')  # Extract dates

#     forecast_data = data.get('forecast') 
#     sales_order_data = data.get('salesOrder') 
#     str_demand_data = data.get('strDemand') 
#     sto_demand_data=data.get('stoDemand')
#     total_demand_data=data.get('totalDemand')
#     str_receipt_data = data.get('strReceipt') 
#     sto_receipt_data = data.get('stoReceipt') 
#     planned_order_data = data.get('plannedOrder') 
#     production_order_data = data.get('productionOrder') 
#     stock_data = data.get('stock') 
#     total_receipt_data=data.get('totalReceipt')
#     days_supply_data = data.get('daysSupply') 
#     projected_balance_data=data.get('projectedBalance')

#     # Convert dates from DD-MM-YYYY to YYYY-MM-DD
#     def convert_date(date_str):
#         return datetime.strptime(date_str, "%d-%m-%Y").strftime("%Y-%m-%d")

#     dates = [convert_date(date) for date in dates]

#     try: 
#         connection = get_db_connection()
#         cursor = connection.cursor()
#         connection.begin()

#         # Function to insert data with respective dates, ignoring zero values
#         def insert_data(data_list, query):
#             if data_list is not None:
#                 data_values = [(qty, dates[idx], plant_code, product_code) for idx, qty in enumerate(data_list) if idx < len(dates) and qty != 0]
#                 logging.debug(f"Data values for query {query}: {data_values}")
#                 if data_values:
#                     cursor.executemany(query, data_values)

#         # Insert data for each category
#         insert_data(forecast_data, "INSERT INTO forecast (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(sales_order_data, "INSERT INTO sales_order (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(str_demand_data, "INSERT INTO str_demand (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(sto_demand_data, "INSERT INTO sto_demand (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(total_demand_data, "INSERT INTO total_demand (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")

#         insert_data(str_receipt_data, "INSERT INTO str_receipt (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(sto_receipt_data, "INSERT INTO sto_receipt (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(planned_order_data, "INSERT INTO planned_order (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(production_order_data, "INSERT INTO production_order (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(stock_data, "INSERT INTO stock (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(total_receipt_data, "INSERT INTO total_receipt (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")


#         insert_data(days_supply_data, "INSERT INTO days_supply (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")
#         insert_data(projected_balance_data, "INSERT INTO projected_balance (qty, date_submitted, product, plant) VALUES (%s, %s, %s, %s)")

#         connection.commit() 
#         return jsonify({"valid": True}), 201 
#     except Exception as e: 
#         connection.rollback() 
#         logging.error(f"Error occurred: {e}")
#         return jsonify({"error": str(e)}), 500 
#     finally: 
#         cursor.close() 
#         connection.close()


@app.route('/submitdata', methods=['POST']) 
def submit_data():
    plant_code = request.args.get('plantCode')
    product_code = request.args.get('productCode')
    payload = request.json  # Updated to get the entire payload

    data = payload.get('data')  # Extract data
    dates = payload.get('dates')  # Extract dates

    forecast_data = data.get('forecast')
    sales_order_data = data.get('sales_order')
    str_demand_data = data.get('str_demand')
    sto_demand_data = data.get('sto_demand')
    total_demand_data = data.get('totalDemand')
    str_receipt_data = data.get('str_receipt')
    sto_receipt_data = data.get('sto_receipt')
    planned_order_data = data.get('planned_order')
    production_order_data = data.get('production_order')
    stock_data = data.get('stock')
    total_receipt_data = data.get('totalReceipt')
    days_supply_data = data.get('daysSupply')
    projected_balance_data = data.get('projectedBalance')

    # Convert dates from DD-MM-YYYY to YYYY-MM-DD
    def convert_date(date_str):
        return datetime.strptime(date_str, "%d-%m-%Y").strftime("%Y-%m-%d")

    dates = [convert_date(date) for date in dates]

    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        connection.begin()

        # Function to insert or update data
        def insert_data(data_list, query):
            if data_list is not None:
                data_values = [(qty, dates[idx],product_code,plant_code) for idx, qty in enumerate(data_list) if idx < len(dates) and qty != 0]
                logging.debug(f"Data values for query {query}: {data_values}")
                if data_values:
                    cursor.executemany(query, data_values)

        # Queries with ON DUPLICATE KEY UPDATE
        forecast_query = """
        INSERT INTO forecast (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        sales_order_query = """
        INSERT INTO sales_order (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        str_demand_query = """
        INSERT INTO str_demand (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        sto_demand_query = """
        INSERT INTO sto_demand (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        total_demand_query = """
        INSERT INTO total_demand (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        str_receipt_query = """
        INSERT INTO str_receipt (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        sto_receipt_query = """
        INSERT INTO sto_receipt (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        planned_order_query = """
        INSERT INTO planned_order (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        production_order_query = """
        INSERT INTO production_order (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        stock_query = """
        INSERT INTO stock (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        total_receipt_query = """
        INSERT INTO total_receipt (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        days_supply_query = """
        INSERT INTO days_supply (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """
        projected_balance_query = """
        INSERT INTO projected_balance (qty, date_submitted, product, plant)
        VALUES (%s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE qty = VALUES(qty)
        """

        # Insert or update data for each category
        insert_data(forecast_data, forecast_query)
        insert_data(sales_order_data, sales_order_query)
        insert_data(str_demand_data, str_demand_query)
        insert_data(sto_demand_data, sto_demand_query)
        insert_data(total_demand_data, total_demand_query)
        insert_data(str_receipt_data, str_receipt_query)
        insert_data(sto_receipt_data, sto_receipt_query)
        insert_data(planned_order_data, planned_order_query)
        insert_data(production_order_data, production_order_query)
        insert_data(stock_data, stock_query)
        insert_data(total_receipt_data, total_receipt_query)
        insert_data(days_supply_data, days_supply_query)
        insert_data(projected_balance_data, projected_balance_query)

        connection.commit()
        return jsonify({"valid": True}), 201
    except Exception as e:
        connection.rollback()
        logging.error(f"Error occurred: {e}")
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()
        connection.close()



# @app.route('/previous-data-sum', methods=['GET'])
# def previous_data_sum():
#     plant_code = request.args.get('plant_code')
#     product_code = request.args.get('product_code')
#     current_date = datetime.now()

# # Calculate the start of the week (Monday)
#     start_of_week = current_date - timedelta(days=current_date.weekday())

# # Convert to a string in the desired format
#     start_of_week_str = start_of_week.strftime("%Y-%m-%d")
    

#     print("Start of the week (Monday):", start_of_week_str)

#     # Log the received parameters
#     logging.debug(f"Received plant_code: {plant_code}, product_code: {product_code}")

#     tables = ['forecast', 'sales_order', 'str_demand', 'sto_demand', 'total_demand', 'str_receipt',
#               'sto_receipt', 'planned_order', 'production_order', 'stock', 'total_receipt', 'days_supply', 'projected_balance']

#     results = {}
#     try:
#         connection = get_db_connection()
#         with connection.cursor() as cursor:
#             for table in tables:
#                 query = f"SELECT SUM(qty) as total FROM {table} WHERE date_submitted < %s AND product = %s AND plant= %s"
#                 logging.debug(f"Executing query: {query} with params: {start_of_week_str}, {plant_code}, {product_code}")
#                 cursor.execute(query, (start_of_week_str, plant_code, product_code))
#                 result = cursor.fetchone()
#                 logging.debug(f"Result for table {table}: {result}")
#                 results[table] = result['total'] if result['total'] is not None else 0

#         return jsonify(results), 200
#     except Exception as e:
#         logging.error(f"Error occurred: {e}")
#         return jsonify({"error": str(e)}), 500
#     finally:
#         connection.close()

@app.route('/previous-data-sum', methods=['GET'])
def previous_data_sum():
    product_code = request.args.get('product_code', '').strip()
    plant_code = request.args.get('plant_code', '').strip()
    
    current_date = datetime.now()

    # Calculate the start of the week (Monday)
    start_of_week = current_date - timedelta(days=current_date.weekday())
    start_of_week_str = start_of_week.strftime("%Y-%m-%d")

    logging.debug(f"Start of the week (Monday): {start_of_week_str}")
    logging.debug(f"Received plant_code: {plant_code}, product_code: {product_code}")

    tables = ['forecast', 'sales_order', 'str_demand', 'sto_demand', 'total_demand', 
              'str_receipt', 'sto_receipt', 'planned_order', 'production_order', 
              'stock', 'total_receipt', 'days_supply', 'projected_balance']

    results = {}
    try:
        connection = get_db_connection()
        with connection.cursor() as cursor:
            for table in tables:
                query = f"SELECT SUM(qty) as total FROM {table} WHERE date_submitted < %s AND product = %s AND plant = %s"
                # logging.debug(f"Executing query: {query} with params: {start_of_week_str}, {product_code},{plant_code} ")
                cursor.execute(query, (start_of_week_str, product_code, plant_code))
                result = cursor.fetchone()
                # logging.debug(f"Result for table {table}: {result}")
                results[table] = result['total'] if result and result['total'] is not None else 0

        return jsonify(results), 200
    except Exception as e:
        logging.error(f"Error occurred: {e}")
        return jsonify({"error": str(e)}), 500
    finally:
        if connection:
            connection.close()




@app.route('/fetchExistingData', methods=['GET'])
def fetch_existing_data():
    plant_code = request.args.get('plant_code')
    product_code = request.args.get('product_code')
    dates = request.args.get('dates')
    dates = json.loads(dates)  # Convert dates from JSON string to list
    dates = [datetime.strptime(date, "%d-%m-%Y").strftime("%y-%m-%d") for date in dates]

    print("here the:",dates)
    tables = ['forecast', 'sales_order', 'str_demand', 'sto_demand', 'total_demand', 'str_receipt',
              'sto_receipt', 'planned_order', 'production_order', 'stock', 'total_receipt', 'days_supply', 'projected_balance']
    result = {}

    try:
        connection = get_db_connection()
        with connection.cursor() as cursor:
            for table in tables:
                for date in dates:
                    query = f"SELECT qty FROM {table} WHERE product  = %s AND plant = %s AND date_submitted = %s"
                    cursor.execute(query, (product_code, plant_code,date))
                    rows = cursor.fetchall()
                    result[table] = result.get(table, []) + [row['qty'] if rows else 0 for row in rows]

        return jsonify(result), 200
    except Exception as e:
        logging.error(f"Error occurred: {e}")
        return jsonify({"error": str(e)}), 500
    finally:
        connection.close()



@app.route('/plannerrun', methods=['GET'])
def fetch_planner_record():
    plant_code = request.args.get('selectedPlantCode')
    product_code = request.args.get('selectedProductCode')
    print("selected plant code",plant_code)
    print("selected product code for planner run",product_code)
    result = {}
    try:
        connection = get_db_connection()
        with connection.cursor() as cursor:
            query = ("SELECT manufacturing_type FROM product_plant_master "
                     "WHERE plant_code = %s AND product_code = %s")
            cursor.execute(query, (plant_code, product_code))
            # result = cursor.fetchone()
            # print("here is the result",result)
            fetched_result = cursor.fetchone()
            if fetched_result:
                result = {"manufacturing_type": fetched_result['manufacturing_type']}
            else:
                result = {"error": "No matching records found"}
    except Exception as e:
        result = {"error": str(e)}
    finally:
        connection.close()
    
    return jsonify(result)



@app.route('/uploadfile', methods=['POST'])
def insert_csv_record():
    if 'file' not in request.files:
        return jsonify({"error": "No file part"}), 400
 
    file = request.files['file']
 
    if file.filename == '':
        return jsonify({"error": "No file selected"}), 400
 
    if not file.filename.endswith('.xlsx'):
        return jsonify({"error": "Invalid file format. Please upload an Excel file."}), 400
 
    # Save the uploaded file
    filename = secure_filename(file.filename)
    filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    file.save(filepath)
 
    try:
        # Read Excel file
        data = pd.read_excel(filepath)
 
        # Connect to the database and insert the records
        connection = get_db_connection()
        with connection.cursor() as cursor:
            for _, row in data.iterrows():
                sql = "INSERT INTO initial_data (material_code, qty) VALUES (%s, %s)"
                cursor.execute(sql, (row['material_code'], row['qty']))
            connection.commit()
 
        connection.close()
 
    except Exception as e:
        return jsonify({"error": str(e)}), 500
 
    return jsonify({"message": "Data inserted successfully"}), 200




@app.route('/getdata', methods=['GET'])
def get_data():
    try:
        # Connect to the database
        connection = get_db_connection()
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM initial_data")
            results = cursor.fetchall()

        # Close the connection
        connection.close()

        # Convert results to a list of dictionaries
        data = [{'material_code': row['material_code'], 'qty': row['qty']} for row in results]

        return jsonify(data), 200
    except Exception as e:
        logging.error(f'Error retrieving data: {e}')
        return jsonify({"error": "Failed to retrieve data"}), 500
    



# Set the expiration time for JWT tokens to 15 minutes
app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(minutes=120)
 

# Run the app if this file is executed directly
if __name__ == '__main__':
    if not os.path.exists(app.config['UPLOAD_FOLDER']):
        os.makedirs(app.config['UPLOAD_FOLDER'])
    app.run(debug=True)

from flask import Flask, render_template, request,redirect,url_for,session,send_file
from weasyprint import HTML
from io import BytesIO
from datetime import datetime,date

import mysql.connector
app = Flask(__name__)
app.secret_key = 'zaheer786'  # Ensure you use a secure and random secret key
# Database configuration
db_config = {
    'user': 'root',
    'password': 'zaheer786',
    'host': 'localhost',
    'database': 'pharmacydata3'  # Update with your database name
}

def get_db_connection():
    return mysql.connector.connect(**db_config)
# Route for home page
@app.route('/')
def home():
    return render_template('home.html')

# Route for view options
@app.route('/view-options')
def view_options():
    return render_template('view_options.html')

# Routes for specific view options
@app.route('/view-customers')
def view_customers():
    search_name = request.args.get('search_name', '')
    search_id = request.args.get('search_id', '')

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    if search_name and search_id:
        cursor.execute('SELECT * FROM Customer WHERE name LIKE %s AND customer_id = %s', ('%' + search_name + '%', search_id))
    elif search_name:
        cursor.execute('SELECT * FROM Customer WHERE name LIKE %s', ('%' + search_name + '%',))
    elif search_id:
        cursor.execute('SELECT * FROM Customer WHERE customer_id = %s', (search_id,))
    else:
        cursor.execute('SELECT * FROM Customer')

    customers = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('view_customers.html', customers=customers)

@app.route('/view-medicines', methods=['GET'])
def view_medicines():
    search_name = request.args.get('search_name', '')
    search_id = request.args.get('search_id', '')

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    if search_name and search_id:
        cursor.execute('SELECT * FROM Medicine WHERE name LIKE %s AND medicine_id = %s', ('%' + search_name + '%', search_id))
    elif search_name:
        cursor.execute('SELECT * FROM Medicine WHERE name LIKE %s', ('%' + search_name + '%',))
    elif search_id:
        cursor.execute('SELECT * FROM Medicine WHERE medicine_id = %s', (search_id,))
    else:
        cursor.execute('SELECT * FROM Medicine')

    medicines = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('view_medicines.html', medicines=medicines)

@app.route('/view-suppliers')
def view_suppliers():
    # Code to fetch and display suppliers data
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute('SELECT * FROM supplier')
    suppliers = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('view_suppliers.html', suppliers=suppliers)

@app.route('/view-orders')
def view_orders():
    search_name = request.args.get('search_name', '')
    search_date = request.args.get('search_date', '')

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    if search_name and search_date:
        query = '''
            SELECT Orders.order_id, Customer.name, Medicine.name AS med_name, Medicine.sale_price, Orders.order_date
            FROM Orders
            JOIN Customer ON Orders.customer_id = Customer.customer_id
            JOIN Medicine ON Orders.medicine_id = Medicine.medicine_id
            WHERE Customer.name LIKE %s AND Orders.order_date = %s
        '''
        cursor.execute(query, ('%' + search_name + '%', search_date))
    elif search_name:
        query = '''
            SELECT Orders.order_id, Customer.name, Medicine.name AS med_name, Medicine.sale_price, Orders.order_date
            FROM Orders
            JOIN Customer ON Orders.customer_id = Customer.customer_id
            JOIN Medicine ON Orders.medicine_id = Medicine.medicine_id
            WHERE Customer.name LIKE %s
        '''
        cursor.execute(query, ('%' + search_name + '%',))
    elif search_date:
        query = '''
            SELECT Orders.order_id, Customer.name, Medicine.name AS med_name, Medicine.sale_price, Orders.order_date
            FROM Orders
            JOIN Customer ON Orders.customer_id = Customer.customer_id
            JOIN Medicine ON Orders.medicine_id = Medicine.medicine_id
            WHERE Orders.order_date = %s
        '''
        cursor.execute(query, (search_date,))
    else:
        query = '''
            SELECT Orders.order_id, Customer.name, Medicine.name AS med_name, Medicine.sale_price, Orders.order_date
            FROM Orders
            JOIN Customer ON Orders.customer_id = Customer.customer_id
            JOIN Medicine ON Orders.medicine_id = Medicine.medicine_id
            order by orders.order_id
        '''
        cursor.execute(query)

    orders = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('view_orders.html', orders=orders)



@app.route('/insert-options')
def insert_options():
    return render_template('insert_options.html')
@app.route('/add-new-customer', methods=['GET', 'POST'])
def add_new_customer():
    if request.method == 'POST':
        name = request.form['name']
        phone = request.form['phone']
        email = request.form['email']
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        query = f"""INSERT INTO customer (name, phone, email) VALUES ('{name}', '{phone}', '{email}')"""
        cursor.execute(query)
        query = f"""SELECT customer_id FROM customer WHERE name = '{name}'"""
        cursor.execute(query)
        result=cursor.fetchone()
        session['customer_id'] = result['customer_id'] if result else None
        connection.commit()
        cursor.close()
        connection.close()
        return redirect('/select-medicine')
    return render_template('add_new_customer.html')
@app.route('/select-medicine', methods=['GET', 'POST'])
def select_medicine():
    medicines = []
    if request.method == 'POST':
        if 'search' in request.form:
            medicine_id = request.form.get('medicine_id')
            medicine_name = request.form.get('medicine_name')

            connection = get_db_connection()
            cursor = connection.cursor(dictionary=True)

            if medicine_id:
                query = f"SELECT * FROM medicine WHERE medicine_id = '{medicine_id}'"
            elif medicine_name:
                query = f"SELECT * FROM medicine WHERE name LIKE '%{medicine_name}%'"
            else:
                return "Please provide either Medicine ID or Medicine Name."

            cursor.execute(query)
            medicines = cursor.fetchall()
            cursor.close()
            connection.close()

        elif 'selected_medicine' in request.form:
            selected_medicine = request.form.get('selected_medicine')
            session['selected_medicine'] = selected_medicine
            return redirect(url_for('medicine_selected'))


    return render_template('select_medicine.html', medicines=medicines)

@app.route('/medicine-selected')
def medicine_selected():
    if 'selected_medicine' in session:
        selected_medicine = session['selected_medicine']
        return redirect('/fill-order')
    else:
        return "No medicine selected."



@app.route('/fill-order', methods=['GET','POST'])
def fill_order():
    if request.method=='GET':
        selected_medicine_id = session.get('selected_medicine')
        # customer_id = session.get('customer_id')
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        # Discount is always 2%
        discount = '2%'
        # Current date and time
        order_date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        customer_id=session.get('customer_id')
        # Insert into orders table

        insert_query = f"""INSERT INTO orders (customer_id, medicine_id, discount, order_date) VALUES ({customer_id},{selected_medicine_id},'{discount}','{order_date}')"""
        cursor.execute(insert_query)
        connection.commit()
        cursor.close()
        return redirect('/order-or-bill')  # Redirect to the new page
        # Store selected medicine ID in session
        # return ("okay") # Redirect to refresh the page or show success message
    return render_template('select_medicine.html')  # Render the template if GET request



@app.route('/generate-bill', methods=['GET'])
def generate_bill():
    if 'customer_id' not in session:
        return redirect(url_for('home'))

    customer_id = session['customer_id']
    
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    # Fetch customer details
    cursor.execute("SELECT * FROM Customer WHERE customer_id = %s", (customer_id,))
    customer = cursor.fetchone()

    if not customer:
        return "Customer not found.", 404
    today = date.today()  # Get today's date in YYYY-MM-DD format as a string

# Fetch order details with parameterized query
    query = """
    SELECT Orders.order_id, Medicine.name AS medicine_name, Medicine.sale_price, DATE(Orders.order_date) AS order_date
    FROM Orders
    JOIN Medicine ON Orders.medicine_id = Medicine.medicine_id
    WHERE Orders.customer_id = %s AND DATE(Orders.order_date) = %s
"""
    cursor.execute(query, (customer_id, today))

    # cursor.execute(query)


    orders = cursor.fetchall()

    if not orders:
        return "No orders found for this customer.", 404

    # Calculate total prices
    total_price = sum(order['sale_price'] for order in orders)
    discounted_price = total_price * 0.98  # Applying 2% discount
    # Insert into Billing table
    cursor.execute("""
        INSERT INTO Billing (customer_id, discounted_price, actual_price) 
        VALUES (%s, %s, %s)
    """, (customer_id, discounted_price, total_price))
    connection.commit()

    # Fetch the generated bill id
    cursor.execute("SELECT LAST_INSERT_ID() AS bill_id")
    bill_id = cursor.fetchone()['bill_id']

    cursor.close()
    connection.close()

    printed_date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    html_content = render_template('generate_bill.html', 
                                   bill_id=bill_id, 
                                   customer=customer, 
                                   printed_date=printed_date,
                                   orders=orders, 
                                   total_price=total_price, 
                                   discounted_price=int(discounted_price))
     # Convert HTML to PDF
    pdf_file = BytesIO()
    HTML(string=html_content).write_pdf(pdf_file)
    pdf_file.seek(0)
    # Send the PDF file to the client

    return send_file(pdf_file, as_attachment=True, download_name=f'bill_{bill_id}.pdf')


@app.route('/order-or-bill')
def order_or_bill():
    return render_template('order_or_bill.html')
@app.route('/select-customer', methods=['GET', 'POST'])
def select_customer():
    customers = []
    if request.method == 'POST':
        if 'search' in request.form:
            customer_id = request.form.get('customer_id')
            customer_name = request.form.get('customer_name')

            connection = get_db_connection()
            cursor = connection.cursor(dictionary=True)

            if customer_id:
                query = f"SELECT * FROM customer WHERE customer_id = '{customer_id}'"
            elif customer_name:
                query = f"SELECT * FROM customer WHERE name LIKE '%{customer_name}%'"
            else:
                return "Please provide either Medicine ID or Medicine Name."

            cursor.execute(query)
            customers = cursor.fetchall()
            cursor.close()
            connection.close()

        elif 'selected_customer' in request.form:
            selected_customer = request.form.get('selected_customer')
            session['customer_id'] = selected_customer
            return redirect(url_for('customer_selected'))
            # return ("customer selected : " ,selected_customer)

    return render_template('select_customer.html', customers=customers)
@app.route('/customer-selected')
def customer_selected():
    if 'customer_id' in session:
        selected_customer = session['customer_id']
        return redirect('/select-medicine')
    else:
        return "No medicine selected."

if __name__ == '__main__':
    app.run(debug=True)

# 🏥 Pharmacy Management System

## 📌 Overview
This project is a web-based **Pharmacy Management System** developed using **Python (Flask)** and **MySQL**. It simulates the core functionalities required to manage a pharmacy's operations, including customer records, medicine inventory, orders, and billing. The system provides a web interface for interaction and can generate PDF bills for customer orders.

**🚀 Live Demo:** You can access the deployed project here: [https://zaheerabbas.pythonanywhere.com/](https://zaheerabbas.pythonanywhere.com/)

## 🎯 Features Implemented
- 👤 **Customer Management:** Add new customers, view existing customer details, search customers by name or ID.
- 💊 **Medicine Management:** View medicine details (price, pack size, quantity), search medicines by name or ID.
- 🚚 **Supplier Management:** View supplier details.
- 🛒 **Order Management:** View order history, search orders by customer name or date.
- ✅ **Order Processing:** Select existing customers or add new ones, select medicines, and place orders.
- 🧾 **Billing & PDF Generation:** Automatically calculate total and discounted prices (fixed 2% discount) for daily orders and generate downloadable PDF bills using WeasyPrint.
- 🗃️ **Database Interaction:** Uses MySQL to store and retrieve data persistently for customers, medicines, suppliers, orders, billing, and shipments.
- 🌐 **Web Interface:** Basic HTML frontend rendered using Flask's Jinja2 templating engine.

## 👨‍💻 Skills Applied
- **Web Development (Backend):** Flask framework for routing, request handling, and session management.
- **Database Management:** MySQL for database design (schema creation) and data manipulation (CRUD operations).
- **Python Programming:** Implementing application logic, database interaction, and integrating libraries.
- **Frontend Development (Basic):** HTML and Jinja2 templating for creating the user interface.
- **PDF Generation:** Using the WeasyPrint library to convert HTML content into PDF documents.
- **Environment Setup:** Managing dependencies and setting up a development environment (virtual environment recommended).
- **Problem Solving:** Designing the application flow and debugging issues during development.

## 📚 What I Learned
- Building a full-stack web application from scratch using Flask.
- Designing a relational database schema (MySQL) to model real-world entities (customers, medicines, orders).
- Integrating a Python backend with a MySQL database using `mysql-connector-python`.
- Implementing core web application features like user input handling (forms), data display, and searching/filtering.
- Dynamically generating web pages using HTML templates (Jinja2).
- Programmatically generating PDF documents from web content using WeasyPrint.
- Managing application state across requests using Flask sessions.
- Understanding the workflow of a pharmacy management system.

## 📁 Project Structure
```
pharmacy-management-system/  # Your project root directory
├── app.py                  # Main Flask application file
├── fulldatabase.sql        # MySQL database dump (schema + data)
├── templates/              # Directory containing HTML templates
│   ├── add_new_customer.html
│   ├── generate_bill.html
│   ├── home.html
│   ├── insert_options.html
│   ├── order_or_bill.html
│   ├── search_customer.html # (Likely part of view_customers or select_customer)
│   ├── select_customer.html
│   ├── select_medicine.html
│   ├── user.html            # (Purpose needs clarification)
│   ├── view_customers.html
│   ├── view_medicines.html
│   ├── view_options.html
│   ├── view_orders.html
│   ├── view_suppliers.html
├── README.md               # This file
# Note: Ensure all .html files are placed inside the 'templates' directory for Flask to find them.
```

## 🛠️ How to Run the Program
1.  **Clone the repository or set up your project folder:**
    Place `app.py` and `fulldatabase.sql` in your main project directory. Create a `templates` subdirectory and move all `.html` files into it.
    ```bash
    # Example structure:
    # my_pharmacy_project/
    # ├── app.py
    # ├── fulldatabase.sql
    # └── templates/
    #     ├── home.html
    #     └── ... (all other .html files)
    cd my_pharmacy_project
    ```

2.  **Set up MySQL Database:**
    *   Ensure you have MySQL server installed and running.
    *   Create a database (the script uses `pharmacydata3` by default).
    *   Import the database schema and data:
        ```bash
        mysql -u <your_username> -p pharmacydata3 < fulldatabase.sql
        ```
        *(Replace `<your_username>` with your MySQL username. You'll be prompted for the password.)*
    *   **Crucially:** Open `app.py` and update the `db_config` dictionary with your correct MySQL username, password, host (usually `localhost`), and the database name you created.

3.  **Create a Python Virtual Environment (Recommended):**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use: venv\Scripts\activate
    ```

4.  **Install Dependencies:**
    ```bash
    pip install Flask mysql-connector-python WeasyPrint
    ```
    *   **WeasyPrint System Dependencies:** WeasyPrint requires system libraries (like Pango, Cairo, GDK-PixBuf). Please refer to the [official WeasyPrint installation guide](https://doc.courtbouillon.org/weasyprint/stable/install.html) for instructions specific to your operating system.

5.  **Run the Flask application:**
    ```bash
    python app.py
    ```
6.  Open your web browser and navigate to `http://127.0.0.1:5000/` (or the address provided in the console).

## 🧱 Future Improvements
- Implement user authentication (login/signup) for different roles (e.g., admin, pharmacist).
- Enhance the user interface (UI/UX) using CSS frameworks (like Bootstrap) or JavaScript.
- Add more robust error handling and user feedback messages.
- Implement features like stock level warnings, expiry date tracking, and more detailed reporting.
- Add unit tests and integration tests.
- Secure database credentials (e.g., using environment variables) instead of hardcoding them in `app.py`.
- Improve search and filtering capabilities with more options.

## 👤 Author
*Zaheer Abbas*

---

⭐ If you find this project useful, consider giving it a star!

from flask import Flask, request
import mysql.connector

app = Flask(__name__)

# list of client public IPs
client_ips = []

# MySQL connection parameters
db_params = {
    "host": "localhost",
    "user": "root",
    "password": "",
    "database": "mydatabase"
}

def get_db_connection():
    """
    Create a new connection to the MySQL database.
    """
    return mysql.connector.connect(**db_params)

def create_client_ip_table():
    """
    Create the client_ip table in the MySQL database.
    """
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS client_ip (
            id INT AUTO_INCREMENT PRIMARY KEY,
            ip_address VARCHAR(255) NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    """)

    conn.commit()
    cursor.close()
    conn.close()

@app.route('/client-ip', methods=['GET'])
def get_client_ip():
    # get the client's public IP address from the request
    client_ip = request.remote_addr

    # print the client's public IP address to the console
    print(f"Client IP address: {client_ip}")

    # save the client's public IP address to the database
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("INSERT INTO client_ip (ip_address) VALUES (%s)", (client_ip,))

    conn.commit()
    cursor.close()
    conn.close()

    # save the client's public IP address to the list
    client_ips.append(client_ip)

    # return a response
    return f"Your public IP address is: {client_ip}"

@app.route('/client-ip/list', methods=['GET'])
def get_client_ip_list():
    # get the list of client public IPs from the database
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("SELECT ip_address FROM client_ip ORDER BY created_at DESC")

    ip_list = ', '.join([row[0] for row in cursor.fetchall()])

    cursor.close()
    conn.close()

    # return the list of client public IPs
    return f"List of client public IP addresses: {ip_list}"

if __name__ == '__main__':
    create_client_ip_table()
    app.run(host='0.0.0.0', port=80)

from flask import Blueprint, request, jsonify, make_response
import json
from src import db


orders = Blueprint('orders', __name__)

# Get all the orders from the database
@orders.route('/orders', methods=['GET'])
def get_orders():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage FROM Orders')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get all the gift orders from the database
@orders.route('/orders', methods=['GET'])
def get_ordersGift():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage FROM Orders WHERE IsGift = 1')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Delete an order from the database
@orders.route('/orders/<int:order_id>', methods=['DELETE'])
def delete_order(order_id):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Orders WHERE OrderID = %s', (order_id,))
    db.get_db().commit()
    return jsonify({"message": "Order deleted successfully"})

# Update an order in the database
@orders.route('/orders/<int:order_id>', methods=['PUT'])
def update_order(order_id):
    data = request.json
    if 'CustomerID' not in data or 'OrderDate' not in data or 'ArrivalDate' not in data or 'CurrentLocation' not in data or 'Address' not in data or 'IsGift' not in data or 'GiftMessage' not in data:
        return jsonify({"error": "Missing required fields"}), 400

    cursor = db.get_db().cursor()
    cursor.execute('UPDATE Orders SET CustomerID=%s, OrderDate=%s, ArrivalDate=%s, CurrentLocation=%s, Address=%s, IsGift=%s, GiftMessage=%s WHERE OrderID=%s', 
                    (data['CustomerID'], data['OrderDate'], data['ArrivalDate'], data['CurrentLocation'], data['Address'], data['IsGift'], data['GiftMessage'], order_id))
    db.get_db().commit()
    return jsonify({"message": "Order updated successfully"})

# Create a new order in the database
@orders.route('/orders', methods=['POST'])
def create_order():
    data = request.json
    if 'CustomerID' not in data or 'OrderDate' not in data or 'ArrivalDate' not in data or 'CurrentLocation' not in data or 'Address' not in data or 'IsGift' not in data or 'GiftMessage' not in data:
        return jsonify({"error": "Missing required fields"}), 400

    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Orders (CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) VALUES (%s, %s, %s, %s, %s, %s, %s)', 
                    (data['CustomerID'], data['OrderDate'], data['ArrivalDate'], data['CurrentLocation'], data['Address'], data['IsGift'], data['GiftMessage']))
    db.get_db().commit()
    return jsonify({"message": "Order created successfully"})

# Get an order from the database by ID
@orders.route('/orders/<int:order_id>', methods=['GET'])
def get_order(order_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage FROM Orders WHERE OrderID = %s', (order_id,))
    column_headers = [x[0] for x in cursor.description]
    order_data = cursor.fetchone()
    if order_data:
        order_json = dict(zip(column_headers, order_data))
        return jsonify(order_json)
    else:
        return jsonify({"error": "Order not found"}), 404


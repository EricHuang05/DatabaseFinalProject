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
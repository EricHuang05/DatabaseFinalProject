from flask import Blueprint, request, jsonify, make_response
import json
from src import db


books = Blueprint('books', __name__)

# Get all the books from the database
@books.route('/books', methods=['GET'])
def get_products():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT BookID FROM Book')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)
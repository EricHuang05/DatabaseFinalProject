from flask import Blueprint, request, jsonify, make_response
import json
from src import db


authors = Blueprint('authors', __name__)

# Get all the authors from the database
@authors.route('/authors', methods=['GET'])
def get_authors():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT AuthorID, FirstName, LastName FROM Author')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)
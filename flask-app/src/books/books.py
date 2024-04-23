from flask import Blueprint, request, jsonify, make_response
import json
from src import db


books = Blueprint('books', __name__)

# Get all the books from the database
@books.route('/books', methods=['GET'])
def get_books():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock FROM Book')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get all the books from the database that are on sale
@books.route('/booksOnSale', methods=['GET'])
def get_booksOnSale():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock FROM Book WHERE IsOnSale = 1')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get all the books from the database that are trending
@books.route('/booksTrending', methods=['GET'])
def get_booksTrending():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock FROM Book WHERE IsTrending = 1')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get all the books from the database that are in stock
@books.route('/booksInStock', methods=['GET'])
def get_booksInStock():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock FROM Book WHERE NumStock >= 1')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)
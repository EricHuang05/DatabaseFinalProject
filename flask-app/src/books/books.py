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

# Get all the books from the database that are paperback
@books.route('/booksPaperback', methods=['GET'])
def get_booksPaperback():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock FROM Book WHERE BookFormat = "Paperback"')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get all the books from the database that are digital
@books.route('/booksDigital', methods=['GET'])
def get_booksDigital():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock FROM Book WHERE BookFormat = "Digital"')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Delete a certain digital book given it's ID
@books.route('/booksDigital/<int:book_id>', methods=['DELETE'])
def delete_booksDigital(book_id):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Book WHERE BookID = %s AND BookFormat = "Digital"', (book_id,))
    db.get_db().commit()
    return jsonify({'message': 'Book deleted successfully'})

# Updates a certain book
@books.route('/booksDigital/<int:book_id>', methods=['PUT'])
def update_booksDigital(book_id):
    data = request.get_json()
    title = data.get('Title')
    genre = data.get('Genre')
    isbn = data.get('ISBN')
    release_date = data.get('ReleaseDate')
    original_price = data.get('OriginalPrice')
    is_on_sale = data.get('IsOnSale')
    current_price = data.get('CurrentPrice')
    is_trending = data.get('IsTrending')
    num_stock = data.get('NumStock')

    cursor = db.get_db().cursor()
    cursor.execute('UPDATE Book SET Title = %s, Genre = %s, ISBN = %s, ReleaseDate = %s, OriginalPrice = %s, IsOnSale = %s, CurrentPrice = %s, IsTrending = %s, NumStock = %s WHERE BookID = %s AND BookFormat = "Digital"',
                   (title, genre, isbn, release_date, original_price, is_on_sale, current_price, is_trending, num_stock, book_id))
    db.get_db().commit()

    return jsonify({'message': 'Book updated successfully'})

# Creates a certain book
@books.route('/booksDigital', methods=['POST'])
def create_booksDigital():
    data = request.get_json()
    title = data.get('Title')
    genre = data.get('Genre')
    isbn = data.get('ISBN')
    release_date = data.get('ReleaseDate')
    original_price = data.get('OriginalPrice')
    is_on_sale = data.get('IsOnSale')
    current_price = data.get('CurrentPrice')
    is_trending = data.get('IsTrending')
    num_stock = data.get('NumStock')

    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Book (Title, Genre, ISBN, ReleaseDate, BookFormat, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) VALUES (%s, %s, %s, %s, "Digital", %s, %s, %s, %s, %s)',
                   (title, genre, isbn, release_date, original_price, is_on_sale, current_price, is_trending, num_stock))
    db.get_db().commit()

    return jsonify({'message': 'Book created successfully'})
import 'package:dio/dio.dart';
import 'package:e_book_bloc_app/data/data.dart';

class BooksRepository {
  Dio dio = Dio();

  static String baseURL = 'https://api.itbook.store/1.0/';
  static String newBooksURL = '${baseURL}new';
  static String requestedBookURL = '${baseURL}books/';
  static String searchedBookURL = '${baseURL}search/';

  Future<Books> getNewBooks() async {
    var result = await dio.get(newBooksURL).catchError((e) => throw (e));

    Books books;
    if (result.statusCode == 200) {
      books = Books.fromMap(result.data);
    } else {
      throw ('Error ${result.statusCode}');
    }
    return books;
  }

  Future<RequestedBook> getRequestedBook(String isbn13) async {
    var result =
        await dio.get('$requestedBookURL$isbn13').catchError((e) => throw (e));

    RequestedBook book;
    if (result.statusCode == 200) {
      book = RequestedBook.fromMap(result.data);
    } else {
      throw ('Error ${result.statusCode}');
    }
    return book;
  }

  Future<Books> searchForABook(String title) async {
    var result =
        await dio.get('$searchedBookURL$title').catchError((e) => throw (e));

    Books books;
    if (result.statusCode == 200) {
      books = Books.fromMap(result.data);
    } else {
      throw ('Error ${result.statusCode}');
    }
    return books;
  }
}

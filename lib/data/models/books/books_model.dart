import 'package:equatable/equatable.dart';

import 'package:e_book_bloc_app/data/data.dart';

class Books extends Equatable {
  final String? total;
  final List<Book>? books;

  const Books({
    required this.total,
    required this.books,
  });

  factory Books.fromMap(Map<String, dynamic> map) {
    return Books(
      total: map['total'],
      books: map['books'] != null
          ? List<Book>.from(map['books']?.map((x) => Book.fromMap(x)))
          : null,
    );
  }

  @override
  List<Object?> get props => [
        total,
        books,
      ];
}

part of 'books_bloc.dart';

class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final Books books;

  const BooksLoaded({required this.books});

  @override
  List<Object> get props => [books];
}

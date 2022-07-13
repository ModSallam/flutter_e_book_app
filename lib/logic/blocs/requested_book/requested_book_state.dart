part of 'requested_book_bloc.dart';

abstract class RequestedBookState extends Equatable {
  const RequestedBookState();

  @override
  List<Object> get props => [];
}

class RequestedBookInitial extends RequestedBookState {}

class RequestedBookLoading extends RequestedBookState {}

class RequestedBookLoaded extends RequestedBookState {
  final RequestedBook book;

  const RequestedBookLoaded({required this.book});

  @override
  List<Object> get props => [book];
}

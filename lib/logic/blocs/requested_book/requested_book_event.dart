part of 'requested_book_bloc.dart';

abstract class RequestedBookEvent extends Equatable {
  const RequestedBookEvent();

  @override
  List<Object> get props => [];
}

class GetRequestedBookEvent extends RequestedBookEvent {
  final String isbn13;

  const GetRequestedBookEvent({
    required this.isbn13,
  });

  @override
  List<Object> get props => [isbn13];
}

import 'package:bloc/bloc.dart';
import 'package:e_book_bloc_app/data/data.dart';
import 'package:equatable/equatable.dart';

part 'requested_book_event.dart';
part 'requested_book_state.dart';

class RequestedBookBloc extends Bloc<RequestedBookEvent, RequestedBookState> {
  final BooksRepository _booksRepository;

  RequestedBookBloc({required BooksRepository booksRepository})
      : _booksRepository = booksRepository,
        super(RequestedBookInitial()) {
    on<GetRequestedBookEvent>(_onGetRequestedBookEvent);
  }

  Future<void> _onGetRequestedBookEvent(
      GetRequestedBookEvent event, Emitter<RequestedBookState> emit) async {
    emit(RequestedBookLoading());
    RequestedBook book = await _booksRepository.getRequestedBook(event.isbn13);
    emit(RequestedBookLoaded(book: book));
  }
}

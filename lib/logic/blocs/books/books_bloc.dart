import 'package:bloc/bloc.dart';
import 'package:e_book_bloc_app/data/data.dart';
import 'package:equatable/equatable.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BooksRepository _booksRepository;

  BooksBloc({required BooksRepository booksRepository})
      : _booksRepository = booksRepository,
        super(BooksInitial()) {
    on<GetBooksEvent>(_onGetBooksEvent);
  }

  Future<void> _onGetBooksEvent(
      GetBooksEvent event, Emitter<BooksState> emit) async {
    emit(BooksLoading());
    Books books = await _booksRepository.getNewBooks();
    emit(BooksLoaded(books: books));
  }
}

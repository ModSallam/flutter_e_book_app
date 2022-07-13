import 'package:bloc/bloc.dart';
import 'package:e_book_bloc_app/data/data.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final BooksRepository _booksRepository;

  SearchBloc({required BooksRepository booksRepository})
      : _booksRepository = booksRepository,
        super(SearchInitial()) {
    on<GetSearchedBooksEvent>(_onGetSearchedBooksEvent);
  }

  Future<void> _onGetSearchedBooksEvent(
      GetSearchedBooksEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    Books books = await _booksRepository.searchForABook(event.title);
    emit(SearchLoaded(books: books));
  }
}

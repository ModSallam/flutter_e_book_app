part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchedBooksEvent extends SearchEvent {
  final String title;

  const GetSearchedBooksEvent({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}

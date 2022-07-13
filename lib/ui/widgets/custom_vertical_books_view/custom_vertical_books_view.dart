import 'package:e_book_bloc_app/logic/logic.dart';
import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomVerticalBooksView extends StatelessWidget {
  const CustomVerticalBooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        if (state is BooksLoading) {
          return const CustomLoadingContainer();
        } else if (state is BooksLoaded) {
          return CustomVerticalBooksViewContainer(books: state.books.books!);
        } else {
          return const CustomErrorContainer();
        }
      },
    );
  }
}

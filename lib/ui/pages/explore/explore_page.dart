import 'package:e_book_bloc_app/logic/logic.dart';
import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'EXPLORE'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => context
                  .read<SearchBloc>()
                  .add(GetSearchedBooksEvent(title: value)),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for a book...',
                // suffix: GestureDetector(
                //   onTap: () => context
                //       .read<SearchBloc>()
                //       .add(const GetSearchedBooksEvent(title: '')),
                //   child: const Icon(Icons.clear),
                // ),
              ),
              autocorrect: false,
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const CustomLoadingContainer();
                  }
                  if (state is SearchLoaded) {
                    if (state.books.books != null) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(
                                state.books.books!.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      context.read<RequestedBookBloc>().add(
                                            GetRequestedBookEvent(
                                              isbn13: state
                                                  .books.books![index].isbn13!,
                                            ),
                                          );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BookPage(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        CustomCardView(
                                          url: state.books.books![index].image!,
                                          width: 100,
                                          height: 100,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                    .books.books![index].title!,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                state
                                                    .books.books![index].price!,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Nothing to show yet!'),
                      );
                    }
                  }
                  if (state is SearchInitial) {
                    return const Center(
                      child: Text('Nothing to show yet!'),
                    );
                  } else {
                    return const CustomErrorContainer();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

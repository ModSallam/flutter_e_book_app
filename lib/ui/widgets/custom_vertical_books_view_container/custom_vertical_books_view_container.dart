import 'package:e_book_bloc_app/logic/logic.dart';
import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:e_book_bloc_app/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomVerticalBooksViewContainer extends StatelessWidget {
  final List<Book> books;

  const CustomVerticalBooksViewContainer({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recently Added',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    books.length,
                    (index) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.read<RequestedBookBloc>().add(
                              GetRequestedBookEvent(
                                isbn13: books[index].isbn13!,
                              ),
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomCardView(
                                url: books[index].image!,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    books[index].title!,
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    books[index].price!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: MyColors.myAmber,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    books[index].subtitle!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: MyColors.myGrey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
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
          ),
        ],
      ),
    );
  }
}

import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomHorizontalBooksView extends StatelessWidget {
  const CustomHorizontalBooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20.0),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: const CustomCardView(
              url: 'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
            ),
          );
        },
      ),
    );
  }
}

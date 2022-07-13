import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'FIRE E-BOOK'),
      body: Column(
        children: const [
          // Expanded(
          //   flex: 1,
          //   child: CustomHorizontalBooksView(),
          // ),
          Expanded(
            child: CustomVerticalBooksView(),
          ),
        ],
      ),
    );
  }
}

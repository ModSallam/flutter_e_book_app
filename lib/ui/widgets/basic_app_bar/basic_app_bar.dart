import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const BasicAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: MyColors.myTransparent,
      centerTitle: true,
      title: Text(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

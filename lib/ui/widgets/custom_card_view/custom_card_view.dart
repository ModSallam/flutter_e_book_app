import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const CustomCardView({
    required this.url,
    Key? key,
    this.width = 150,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 20.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: MyColors.myBlack,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Placeholder(
        child: Image(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

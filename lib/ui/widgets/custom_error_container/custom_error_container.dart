import 'package:flutter/material.dart';

class CustomErrorContainer extends StatelessWidget {
  const CustomErrorContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Oops! Something went wrong.'));
  }
}

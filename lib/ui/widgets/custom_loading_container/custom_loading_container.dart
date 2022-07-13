import 'package:flutter/material.dart';

class CustomLoadingContainer extends StatelessWidget {
  const CustomLoadingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

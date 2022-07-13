import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomSettingsItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const CustomSettingsItemCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 30.0,
                ),
                const SizedBox(width: 20.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: MyColors.myGrey.withOpacity(0.7),
        ),
      ],
    );
  }
}

import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomSettingsItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final bool clickable;
  final Function()? onTap;

  const CustomSettingsItemCard({
    Key? key,
    required this.title,
    required this.icon,
    this.trailing,
    this.clickable = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: !clickable ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                if (trailing != null) trailing!,
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

import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'SETTINGS'),
      body: Column(
        children: [
          // CustomSettingsItemCard(
          //   title: 'Favorite',
          //   icon: Icons.favorite_border,
          //   onTap: () {},
          // ),
          // CustomSettingsItemCard(
          //   title: 'Downloads',
          //   icon: Icons.download_outlined,
          //   onTap: () {},
          // ),
          CustomSettingsItemCard(
            title: 'Display',
            icon: Icons.dark_mode_outlined,
            onTap: () {},
          ),
          // CustomSettingsItemCard(
          //   title: 'Language',
          //   icon: Icons.language,
          //   onTap: () {},
          // ),
          // CustomSettingsItemCard(
          //   title: 'About',
          //   icon: Icons.info_outline,
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}

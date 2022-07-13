import 'package:e_book_bloc_app/logic/logic.dart';
import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) =>
            context.read<BottomNavigationBarCubit>().onPageChanged(index),
        children: const [
          HomePage(),
          ExplorePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) {
              pageController.jumpToPage(index);
              context.read<BottomNavigationBarCubit>().onPageChanged(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}

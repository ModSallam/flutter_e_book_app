part of 'bottom_navigation_bar_cubit.dart';

class BottomNavigationBarState extends Equatable {
  final int index;

  const BottomNavigationBarState({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}

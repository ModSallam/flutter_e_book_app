import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(const BottomNavigationBarState(index: 0));

  void onPageChanged(int currentIndex) {
    emit(BottomNavigationBarState(index: currentIndex));
  }
}

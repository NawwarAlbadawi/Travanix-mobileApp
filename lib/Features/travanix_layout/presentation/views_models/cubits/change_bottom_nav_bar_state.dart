part of 'change_bottom_nav_bar_cubit.dart';

@immutable
sealed class ChangeBottomNavBarState {}

final class ChangeBottomNavBarInitial extends ChangeBottomNavBarState {}
final class ChangeBottomNavBarIndex extends ChangeBottomNavBarState {}

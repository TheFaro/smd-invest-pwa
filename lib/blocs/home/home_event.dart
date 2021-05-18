part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// information events
class InformationEmailClick extends HomeEvent{}

class InformationPhoneClick extends HomeEvent{}

// toggle navigation drawer
class ToggleNavigationDrawer extends HomeEvent{}

// toggle search bar
class ToggleSearchBar extends HomeEvent{}




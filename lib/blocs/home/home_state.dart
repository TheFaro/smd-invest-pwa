part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// explains itself, its the initial state
class HomeInitial extends HomeState {}

// when ever something is being processed, this state is called.
class HomeLoading extends HomeState {}

// when navigator is clicked, for both opening and closing.
class NavigatorToggled extends HomeState {}

// when search icon is clicked for inputing data.
class SearchToggled extends HomeState {}

// email clicked in navigation, display dialog
class EmailDialog extends HomeState {}

// phone clicked in navigation, display dialog
class PhoneDialog extends HomeState {}
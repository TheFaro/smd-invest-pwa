import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is InformationEmailClick){
      yield* _mapEmailClickToState(event);
    }

    if(event is InformationPhoneClick){
      yield* _mapPhoneClickToState(event);
    }

    if(event is ToggleNavigationDrawer){
      yield* _mapNavigationDrawerToState(event);
    }

    if(event is ToggleSearchBar){
      yield* _mapSearchBarToState(event);
    }
  }

  Stream<HomeState> _mapEmailClickToState(InformationEmailClick event) async*{
    yield HomeLoading();
    yield EmailDialog();
  }

  Stream<HomeState> _mapPhoneClickToState(InformationPhoneClick event) async*{
    yield HomeLoading();
    yield PhoneDialog();
  }

  Stream<HomeState> _mapNavigationDrawerToState(ToggleNavigationDrawer event) async*{
    yield HomeLoading();
    yield NavigatorToggled();
  }

  Stream<HomeState> _mapSearchBarToState(ToggleSearchBar) async* {
    yield HomeLoading();
    yield SearchToggled();
  }
}

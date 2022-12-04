import 'package:flutter/foundation.dart';

@immutable
abstract class HomeState {
  bool isListenable() => false;
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {}

class HomeFormSuccessState extends HomeState {}

class HomeFormErrorState extends HomeState {}
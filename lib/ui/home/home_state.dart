import 'package:flutter/foundation.dart';
import 'package:wedding_page/domain/model/error_type.dart';

@immutable
abstract class HomeState {
  bool isListenable() => false;
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {}

@immutable
abstract class HomeListenableState extends HomeState {
  @override
  bool isListenable() => true;
}

class HomeFormSuccessState extends HomeListenableState {}

class HomeFormErrorState extends HomeListenableState {
  final ErrorType errorType;

  HomeFormErrorState(this.errorType);
}
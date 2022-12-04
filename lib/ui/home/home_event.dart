import 'package:wedding_page/domain/model/registration_data.dart';

abstract class HomeEvent {}

class HomeCreated extends HomeEvent {}

class HomeFormSubmitted extends HomeEvent {
  final RegistrationData data;

  HomeFormSubmitted(this.data);
}
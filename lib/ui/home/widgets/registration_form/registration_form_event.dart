import 'package:wedding_page/domain/model/error_type.dart';

abstract class RegistrationFormEvent {}

class RegistrationCreatedEvent extends RegistrationFormEvent {}

class RegistrationLoadingEvent extends RegistrationFormEvent {}

class RegistrationSuccessEvent extends RegistrationFormEvent {}

class RegistrationErrorEvent extends RegistrationFormEvent {
  final ErrorType errorType;

  RegistrationErrorEvent(this.errorType);
}
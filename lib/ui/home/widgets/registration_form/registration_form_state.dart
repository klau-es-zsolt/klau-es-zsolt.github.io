import 'package:flutter/foundation.dart';
import 'package:wedding_page/domain/model/error_type.dart';
import 'package:wedding_page/domain/model/registration_data.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_result.dart';

@immutable
abstract class RegistrationFormState {
  bool isListenable() => false;
}

class RegistrationFormInitialState extends RegistrationFormState {}

class RegistrationFormWidgetState extends RegistrationFormState {
  final bool isLoading;
  final RegistrationResult registrationResult;
  final ErrorType? errorType;

  RegistrationFormWidgetState({
    required this.isLoading,
    required this.registrationResult,
    required this.errorType,
  });

  RegistrationFormWidgetState.empty()  : isLoading = false,
        errorType = null,
        registrationResult = RegistrationResult.inProgress;

  RegistrationFormWidgetState.loading()  : isLoading = true,
        errorType = null,
        registrationResult = RegistrationResult.inProgress;

  RegistrationFormWidgetState.success()  : isLoading = false,
        registrationResult = RegistrationResult.success,
        errorType = null;

  RegistrationFormWidgetState.error({
    required this.errorType,
  })  : isLoading = false,
        registrationResult = RegistrationResult.error;
}

abstract class RegistrationFormListenableState extends RegistrationFormState {
  @override
  bool isListenable() => true;
}

class RegistrationFormClearFields extends RegistrationFormListenableState {}

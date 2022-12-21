import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_event.dart';
import 'package:wedding_page/ui/home/widgets/registration_form/registration_form_state.dart';

@injectable
class RegistrationFormBloc
    extends Bloc<RegistrationFormEvent, RegistrationFormState> {
  RegistrationFormBloc() : super(RegistrationFormInitialState()) {
    on<RegistrationCreatedEvent>(_handleRegistrationCreated);
    on<RegistrationLoadingEvent>(_handleRegistrationLoading);
    on<RegistrationResultClosed>(_handleRegistrationResultClosed);
    on<RegistrationSuccessEvent>(_handleRegistrationSuccess);
    on<RegistrationErrorEvent>(_handleRegistrationError);
  }

  Future<void> _handleRegistrationCreated(RegistrationCreatedEvent event,
      Emitter<RegistrationFormState> emit) async {
    emit(RegistrationFormWidgetState.empty());
  }

  Future<void> _handleRegistrationLoading(RegistrationLoadingEvent event,
      Emitter<RegistrationFormState> emit) async {
    emit(RegistrationFormWidgetState.loading());
  }

  Future<void> _handleRegistrationResultClosed(RegistrationResultClosed event,
      Emitter<RegistrationFormState> emit) async {
    emit(RegistrationFormWidgetState.empty());
  }

  Future<void> _handleRegistrationSuccess(RegistrationSuccessEvent event,
      Emitter<RegistrationFormState> emit) async {
    emit(RegistrationFormClearFields());
    emit(RegistrationFormWidgetState.success());
  }

  Future<void> _handleRegistrationError(
      RegistrationErrorEvent event, Emitter<RegistrationFormState> emit) async {
    emit(RegistrationFormWidgetState.error(
      errorType: event.errorType,
    ));
  }
}

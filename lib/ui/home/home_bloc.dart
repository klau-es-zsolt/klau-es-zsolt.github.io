import 'package:injectable/injectable.dart';
import 'package:wedding_page/domain/model/error_type.dart';
import 'package:wedding_page/domain/usecase/register_usecase.dart';
import 'package:wedding_page/ui/home/home_event.dart';
import 'package:wedding_page/ui/home/home_state.dart';
import 'package:bloc/bloc.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RegisterUseCase _registerUseCase;
  ErrorType? _lastErrorType;

  HomeBloc(this._registerUseCase) : super(HomeInitialState()) {
    on<HomeCreated>(_handleHomeCreated);
    on<HomeFormSubmitted>(_handleHomeOnRegisterSubmitted);
  }

  Future<void> _handleHomeCreated(
      HomeCreated event, Emitter<HomeState> emit) async {
    emit(HomeLoadedState());
  }

  Future<void> _handleHomeOnRegisterSubmitted(
      HomeFormSubmitted event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await _registerUseCase.execute(event.data);
    // todo emit success / error
  }

  Future<void> _handleHomeOnFormModified(
      HomeEvent event, Emitter<HomeState> emit) async {
    _lastErrorType = null;
    emit(HomeLoadedState());
  }
}

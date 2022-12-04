import 'package:injectable/injectable.dart';
import 'package:wedding_page/data/network/network_data_source.dart';
import 'package:wedding_page/domain/model/base/domain_response.dart';
import 'package:wedding_page/domain/model/registration_data.dart';

@injectable
class RegisterUseCase {
  final NetworkDataSource _networkDataSource;

  RegisterUseCase(this._networkDataSource);

  Future<DomainResponse> execute(RegistrationData registrationData) async {
    return _networkDataSource.postRegistration(registrationData);
  }
}
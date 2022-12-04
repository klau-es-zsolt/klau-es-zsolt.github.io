import 'dart:convert';

import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:injectable/injectable.dart';
import 'package:wedding_page/data/network/logging_interceptor.dart';
import 'package:wedding_page/data/network/model/api_response.dart';
import 'package:wedding_page/domain/model/base/domain_response.dart';
import 'package:wedding_page/domain/model/error_type.dart';
import 'package:wedding_page/domain/model/registration_data.dart';

@singleton
class NetworkDataSource {
  final _url = "https://script.google.com/macros/s/AKfycbyJqeMN78hse-iDCwjwgdmim3pELmpp_wTJ1hPBlTU1ILJvjQiLG4iDxT9T_IlTqFSz2A/exec";
  final _client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Future<DomainResponse> postRegistration(RegistrationData registrationData) async {
    try {
      final postData = registrationData.toJson();
      final response = await _client.post(
        Uri.parse(_url),
        body: postData,
      );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, Object?>;
      final decoded = ApiResponse.fromJson(decodedResponse);
      return decoded.toNetworkResponse();
    } catch (e) {
      return DomainError(ErrorType.other);
    }
  }
}
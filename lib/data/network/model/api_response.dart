import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wedding_page/data/network/model/result_type.dart';
import 'package:wedding_page/domain/model/base/domain_response.dart';
import 'package:wedding_page/domain/model/error_type.dart';
import 'package:wedding_page/domain/model/registration_data.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required ResultType result,
    ErrorType? reason,
    String? data,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, Object?> json)
  => _$ApiResponseFromJson(json);
}

extension ApiResponseExtensions on ApiResponse {
  DomainResponse toNetworkResponse() {
    switch(result) {
      case ResultType.success:
        return DomainResult(data != null ? RegistrationData.fromJson(json.decode(data!)) : null);
      case ResultType.error:
        return DomainError(reason ?? ErrorType.other);
    }
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum ErrorType {
  @JsonValue("invalid_invite_code")
  invalidInviteCode,
  @JsonValue("internal_server_error")
  internalServerError,
  @JsonValue("other")
  other,
}
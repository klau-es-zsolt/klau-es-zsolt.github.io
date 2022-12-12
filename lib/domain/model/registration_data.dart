import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_data.freezed.dart';

part 'registration_data.g.dart';

@freezed
class RegistrationData with _$RegistrationData {
  const factory RegistrationData({
    required String inviteCode,
    required DateTime timestamp,
    required String name,
    required String adults,
    required String children,
    required String needsRoom,
    required String bringsCookie,
    required String foodAllergies,
    String? email,
    String? phone,
    String? otherComments,
  }) = _RegistrationData;

  factory RegistrationData.fromJson(Map<String, Object?> json) =>
      _$RegistrationDataFromJson(json);

  factory RegistrationData.empty() {
    return RegistrationData(
      inviteCode: "",
      timestamp: DateTime.now(),
      name: "",
      adults: "",
      children: "",
      needsRoom: "",
      bringsCookie: "",
      foodAllergies: "",
    );
  }
}

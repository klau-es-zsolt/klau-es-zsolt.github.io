import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_point.freezed.dart';

@freezed
class ProgramPoint with _$ProgramPoint {
  const factory ProgramPoint({
    DateTime? time,
    required String name,
    String? description,
  }) = _ProgramPoint;
}

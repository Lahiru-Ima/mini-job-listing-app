import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_entity.freezed.dart';

part 'job_entity.g.dart';

@freezed
abstract class JobEntity with _$JobEntity {
  const factory JobEntity({
    required String id,
    required String title,
    required String companyName,
    required String location,
    required String description,
    required int salary,
    required String jobType,
    required int postDate,
    required int expireyDate,
  }) = _JobEntity;

  factory JobEntity.fromJson(Map<String, Object?> json) => _$JobEntityFromJson(json);
}



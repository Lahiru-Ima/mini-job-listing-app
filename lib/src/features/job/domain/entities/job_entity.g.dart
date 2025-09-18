// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobEntity _$JobEntityFromJson(Map<String, dynamic> json) => _JobEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  companyName: json['companyName'] as String,
  location: json['location'] as String,
  description: json['description'] as String,
  salary: (json['salary'] as num).toInt(),
  jobType: json['jobType'] as String,
  postDate: (json['postDate'] as num).toInt(),
  expireyDate: (json['expireyDate'] as num).toInt(),
);

Map<String, dynamic> _$JobEntityToJson(_JobEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'companyName': instance.companyName,
      'location': instance.location,
      'description': instance.description,
      'salary': instance.salary,
      'jobType': instance.jobType,
      'postDate': instance.postDate,
      'expireyDate': instance.expireyDate,
    };

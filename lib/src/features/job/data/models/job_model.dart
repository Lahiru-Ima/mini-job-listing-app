import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:job_listing_app/src/features/job/domain/entities/job_entity.dart';

List<JobModel> jobModelFromJson(String str) => List<JobModel>.from(json.decode(str).map((x) => JobModel.fromJson(x)));

String jobModelToJson(List<JobModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobModel extends Equatable {
  final String? title;
  final String? companyName;
  final String? location;
  final String? description;
  final int? salary;
  final String? jobType;
  final int? postDate;
  final int? expireyDate;
  final String? id;

  const JobModel({this.title, this.companyName, this.location, this.description, this.salary, this.jobType, this.postDate, this.expireyDate, this.id});

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    title: json["title"],
    companyName: json["companyName"],
    location: json["location"],
    description: json["description"],
    salary: json["salary"],
    jobType: json["jobType"],
    postDate: json["postDate"],
    expireyDate: json["expireyDate"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "companyName": companyName,
    "location": location,
    "description": description,
    "salary": salary,
    "jobType": jobType,
    "postDate": postDate,
    "expireyDate": expireyDate,
    "id": id,
  };

  @override
  List<Object?> get props => [title, companyName, location, description, salary, jobType, postDate, expireyDate, id];

  JobEntity toEntity() {
    return JobEntity(
      id: id ?? '',
      title: title ?? '',
      companyName: companyName ?? '',
      location: location ?? '',
      description: description ?? '',
      salary: salary ?? 0,
      jobType: jobType ?? '',
      postDate: postDate ?? 0,
      expireyDate: expireyDate ?? 0,
    );
  }
}

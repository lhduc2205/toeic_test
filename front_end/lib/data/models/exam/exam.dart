import 'dart:ui';

import 'package:front_end/data/models/question/question.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam.g.dart';

@JsonSerializable(explicitToJson: true)
class Exam {
  Exam ({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.time,
    // required this.questions,
    this.tag,
    this.color,
    this.isFavorite = false,
  });

  final int? id;
  final String title;
  final String description;
  final String image;
  final int time;
  // final List<Question> questions;
  final String? tag;
  final Color? color;
  final bool? isFavorite;

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);


}

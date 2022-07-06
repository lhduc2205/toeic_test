// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      time: json['time'] as int,
      // questions: (json['questions'] as List<dynamic>)
      //     .map((e) => Question.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      questionQuantity: json['questionQuantity'] as int,
      tag: json['tag'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'time': instance.time,
      'questionQuantity': instance.questionQuantity,
      // 'questions': instance.questions.map((e) => e.toJson()).toList(),
      'tag': instance.tag,
      'isFavorite': instance.isFavorite,
    };

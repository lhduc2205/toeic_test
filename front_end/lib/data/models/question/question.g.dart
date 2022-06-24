// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      question: json['question'] as String,
      answer: (json['answer'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      rightAnswer: json['rightAnswer'] as int,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'rightAnswer': instance.rightAnswer,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      json['id'] as int?,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
    };

import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';
@JsonSerializable()

class Question {
  Question({required this.question, required this.answer, required this.rightAnswer});

  final String question;
  final List<Answer> answer;
  final int rightAnswer;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Answer {
  Answer(this.id, {required this.answer});

  final int? id;
  final String answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
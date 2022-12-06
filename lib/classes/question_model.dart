import 'package:json_annotation/json_annotation.dart';


part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  String name;
  @JsonKey(name: 'examples')
  List<String>? exampleQuestionList;

  String answer;
  QuestionModel(this.name, this.answer, this.exampleQuestionList);

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

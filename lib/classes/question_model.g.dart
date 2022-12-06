// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      json['name'] as String,
      json['answer'] as String,
      (json['examples'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'examples': instance.exampleQuestionList,
      'answer': instance.answer,
    };

import 'package:admin_panel_for_bot/classes/question_model.dart';
import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;
  final String baseUrl;
  DioClient(this.baseUrl) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<List<QuestionModel>?> getListQuestions() async {
    final response = await _dio.get('/get_intent/');
    List<QuestionModel>? listQuestions;
    if (response.statusCode == 200) {
      final data = response.data['intent_objects'] as List<dynamic>;
      listQuestions = data
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return listQuestions;
    }

    return null;
  }

  Future changeQuestion(QuestionModel question) async {
    final response = await _dio.put('/update_intent/', data: question.toJson());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future deleteQuestion(QuestionModel question) async {
    final response = await _dio
        .delete('/delete_intent/', queryParameters: {'name': question.name});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future addQuestion(QuestionModel question) async {
    final response = await _dio.post('/add_intent/', data: question.toJson());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future rasaTrain() async {
    final response = await _dio.get('/train/');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

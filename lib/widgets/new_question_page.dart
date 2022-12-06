import 'package:admin_panel_for_bot/api_client/dio_client.dart';
import 'package:admin_panel_for_bot/classes/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

class NewQuestionPage extends ConsumerStatefulWidget {
  const NewQuestionPage({super.key});

  @override
  ConsumerState<NewQuestionPage> createState() => _NewQuestionPageState();
}

class _NewQuestionPageState extends ConsumerState<NewQuestionPage> {
  final List<String> listQuestions = [];
  final _nameController = TextEditingController();
  final _exampleQuestionController = TextEditingController();
  final _answerController = TextEditingController();
  late final DioClient dio;
  @override
  void initState() {
    dio = ref.read(dioProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить вопрос'),
        centerTitle: true,
      ),
      floatingActionButton: ElevatedButton(
        style: appButtonStyle,
        onPressed: () {
          //внести изменения в yml file и запустить раса трейн
          _backToMainReturnQuestion();
        },
        child: Text('Сохранить',
            style: TextStyle(fontSize: isSmallScreen ? 15 : 20)),
      ),
      body: Center(
        child: Container(
          width: !isSmallScreen
              ? MediaQuery.of(context).size.width / 2
              : MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              // Text(pageTitle, style: theme.textTheme.headlineSmall),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: appInputBorder,
                    hintText: 'Введите название блока вопросов'),
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _exampleQuestionController,
                    decoration: InputDecoration(
                        border: appInputBorder,
                        hintText: 'Возможный вопрос от пользователя'),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: appButtonStyle,
                      onPressed: () {
                        _addToListQuestions();
                      },
                      child: Text('Добавить',
                          style: TextStyle(fontSize: isSmallScreen ? 15 : 20)))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _answerController,
                decoration: InputDecoration(
                    border: appInputBorder, hintText: 'Ответ на вопросы'),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listQuestions.length,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      textColor: Colors.blue,
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blue.withOpacity(0.4),
                        ),
                        onPressed: () {
                          _deleteQuastion(index);
                        },
                      ),
                      title: Text('${index + 1}. ${listQuestions[index]}'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addToListQuestions() {
    final question = _exampleQuestionController.text;
    if (question.isNotEmpty) {
      listQuestions.add(question);

      setState(() {
        _exampleQuestionController.clear();
      });
    }
  }

  void _backToMainReturnQuestion() async {
    final String name = _nameController.text;
    final String answer = _answerController.text;

    QuestionModel result = QuestionModel(name, answer, listQuestions);
    Navigator.of(context).pop();
    await dio.addQuestion(result);
    ref.refresh(questionProvider.future);
  }

  void _deleteQuastion(int index) {
    listQuestions.removeAt(index);
    setState(() {});
  }
}

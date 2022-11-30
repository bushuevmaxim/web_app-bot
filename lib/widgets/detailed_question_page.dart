import 'package:flutter/material.dart';

import '../classes/question_model.dart';
import '../main.dart';

class DetailedQuestionPage extends StatefulWidget {
  final QuestionModel question;
  const DetailedQuestionPage({super.key, required this.question});
  @override
  State<DetailedQuestionPage> createState() => _DetailedQuestionPageState();
}

class _DetailedQuestionPageState extends State<DetailedQuestionPage> {
  final _nameController = TextEditingController();
  final _exampleQuestionController = TextEditingController();
  final _answerController = TextEditingController();
  late QuestionModel curentQuestion;
  List<String>? listQuestions;
  @override
  void initState() {
    curentQuestion = widget.question;
    listQuestions =
        List<String>.from(curentQuestion.exampleQuestionList as Iterable);
    _nameController.text = curentQuestion.name;
    _answerController.text = curentQuestion.answer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Подробная информация о вопросе'),
        centerTitle: true,
      ),
      floatingActionButton: ElevatedButton(
        style: appButtonStyle,
        onPressed: () {
          _saveChanges();
        },
        child: Text('Сохранить изменения',
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
                    border: appInputBorder, labelText: 'Вопрос'),
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
                        label: const Text('Возможный вопрос от пользователя')),
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
              TextFormField(
                controller: _answerController,
                decoration: InputDecoration(
                    border: appInputBorder,
                    label: const Text('Ответ на вопрос')),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listQuestions!.length,
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
                      title: Text('${index + 1}. ${listQuestions![index]}'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addToListQuestions() {
    listQuestions?.add(_exampleQuestionController.text);
    setState(() {});
  }

  void _deleteQuastion(int index) {
    listQuestions?.removeAt(index);
    setState(() {});
  }

  void _saveChanges() {
    curentQuestion.exampleQuestionList =
        List<String>.from(listQuestions as Iterable);
    curentQuestion.name = _nameController.text;
    curentQuestion.answer = _answerController.text;

    Navigator.of(context).pop(true);
  }
}

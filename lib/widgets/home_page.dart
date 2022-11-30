import 'package:admin_panel_for_bot/classes/question_model.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../main.dart';
import 'card_question.dart';
import 'detailed_question_page.dart';
import 'new_question_page.dart';

class ScreensExample extends StatefulWidget {
  const ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  State<ScreensExample> createState() => _ScreensState();
}

class _ScreensState extends State<ScreensExample> {
  final listQuestions = <QuestionModel>[
    QuestionModel(
        'когда защита', '7 - 13 декабря', ['когда защита', 'дата защиты'])
  ];

  List<QuestionModel> sortedListQuestions = [];

  final questionConroller = TextEditingController();
  @override
  void initState() {
    sortedListQuestions = listQuestions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(widget.controller.selectedIndex);
        switch (widget.controller.selectedIndex) {
          case 0:
            return Scaffold(
                body: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: !isSmallScreen
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width,
                      child: Column(children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextField(
                              onChanged: searchQuestion,
                              controller: questionConroller,
                              decoration: InputDecoration(
                                  border: appInputBorder,
                                  label: const Text('Поиск вопроса'),
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: 'Введите название'),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  _addQuestion();
                                },
                                style: appButtonStyle,
                                child: Text('Добавить вопрос',
                                    style: TextStyle(
                                        fontSize: isSmallScreen ? 15 : 20))),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: sortedListQuestions.length,
                                itemBuilder: (context, index) => Card(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.blue),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onTap: () {
                                          _editQuestion(context,
                                              sortedListQuestions[index]);
                                        },
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
                                        title: Text(
                                            '${index + 1}. ${sortedListQuestions[index].name}'),
                                      ),
                                    )))
                      ]),
                    )),
                floatingActionButton: ElevatedButton(
                  style: appButtonStyle,
                  onPressed: () {
                    //добавить потенциальный вопрос
                    //текст из филда добавляется в список вопросов
                  },
                  child: Text(
                    'Переобучить',
                    style: TextStyle(fontSize: isSmallScreen ? 15 : 20),
                  ),
                ));
          case 1:

          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }

  void _editQuestion(BuildContext context, QuestionModel question) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailedQuestionPage(question: question)));
    if (result) {
      setState(() {});
    }
  }

  void _deleteQuastion(int index) {
    sortedListQuestions.removeAt(index);
    setState(() {});
  }

  void searchQuestion(String query) {
    setState(() {
      if (query.isEmpty) {
        sortedListQuestions = listQuestions;
      } else {
        sortedListQuestions = listQuestions
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> _addQuestion() async {
    final result = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewQuestionPage()))
        as QuestionModel;
    listQuestions.add(result);
    setState(() {});
  }
}

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Главная';
    case 1:
      return 'Добавить вопрос для бота';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

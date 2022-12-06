import 'package:admin_panel_for_bot/api_client/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_panel_for_bot/classes/question_model.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'detailed_question_page.dart';

import 'new_question_page.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

// final listQuesionsProvider = StateProvider<List<QuestionModel>?>((ref) => null);

class _MainScreenState extends ConsumerState<ConsumerStatefulWidget> {
  final questionConroller = TextEditingController();
  late final DioClient dio;
  @override
  void initState() {
    dio = ref.read(dioProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final list = ref.watch(questionProvider);
    List<QuestionModel>? sortedListQuestions;
    return list.when(
        error: (error, stackTrace) {
          return const Text('Ошибка загрузки данных');
        },
        loading: () => const CircularProgressIndicator(),
        data: (data) {
          // ref.read(listQuesionsProvider.notifier).update((state) => data);
          sortedListQuestions = data;

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
                                goToAddQuestion();
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
                              itemCount: sortedListQuestions!.length,
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
                                            sortedListQuestions![index]);
                                      },
                                      textColor: Colors.blue,
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.blue.withOpacity(0.4),
                                        ),
                                        onPressed: () {
                                          _deleteQuastion(
                                              sortedListQuestions![index]);
                                        },
                                      ),
                                      title: Text(
                                          '${index + 1}. ${sortedListQuestions![index].name}'),
                                    ),
                                  )))
                    ]),
                  )),
              floatingActionButton: ElevatedButton(
                style: appButtonStyle,
                onPressed: () async {
                  await dio.rasaTrain();
                },
                child: Text(
                  'Переобучить',
                  style: TextStyle(fontSize: isSmallScreen ? 15 : 20),
                ),
              ));
        });
  }

  void _editQuestion(BuildContext context, QuestionModel question) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailedQuestionPage(question: question)));
    ref.refresh(questionProvider.future);
  }

  void _deleteQuastion(QuestionModel questionModel) async {
    await dio.deleteQuestion(questionModel);

    ref.refresh(questionProvider.future);
  }

  void searchQuestion(String query) {
    setState() {
      ref.refresh(questionProvider);
    }
  }

  void goToAddQuestion() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NewQuestionPage()));
  }
}

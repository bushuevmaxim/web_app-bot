import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../main.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final List<Message> messages = [];
  final inputController = TextEditingController();
  final inputFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
        body: Center(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          alignment: Alignment.center,
          child: SizedBox(
            width: !isSmallScreen
                ? MediaQuery.of(context).size.width / 2
                : MediaQuery.of(context).size.width,
            child: Column(children: [
              Expanded(
                child: GroupedListView<Message, DateTime>(
                  useStickyGroupSeparators: true,
                  elements: messages,
                  groupHeaderBuilder: (element) => SizedBox(
                    height: 40,
                    width: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              DateFormat.yMMMd().format(element.date),
                            )),
                      ),
                    ),
                  ),
                  groupBy: (message) => DateTime(
                      message.date.year, message.date.month, message.date.day),
                  itemBuilder: (context, element) => Align(
                    alignment: element.isMe
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Linkify(
                          text: element.text,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                focusNode: inputFocusNode,
                onSubmitted: (text) => _sendMessege(),
                controller: inputController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessege();
                    },
                  ),
                  border: appInputBorder,
                ),
              )
            ]),
          )),
    ));
  }

  Future<void> _sendMessege() async {
    final message =
        Message(inputController.text.toString(), DateTime.now(), true);
    messages.add(message);
    inputController.clear();
    inputFocusNode.requestFocus();
    setState(() {});
    final Message answer;
    Dio dio = Dio(BaseOptions(
        baseUrl: 'http://localhost:5005/',
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
        }));

    final response = await dio.post('/webhooks/rest/webhook/',
        data: {"sender": "test_user", "message": message.text});
    if (response.statusCode == 200) {
      final map = response.data[0] as Map<String, dynamic>;
      answer = Message(map['text'], DateTime.now(), false);
    } else {
      answer = Message('Автоотвечик: я отдыхаю и не могу вам ответить',
          DateTime.now(), false);
    }

    messages.add(answer);
    setState(() {});
  }
}

class Message {
  final String text;
  final DateTime date;
  bool isMe;
  Message(this.text, this.date, this.isMe);
}

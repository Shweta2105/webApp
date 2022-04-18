import 'package:flutter/material.dart';
import 'package:webapp/screens/chat.dart';
import 'package:webapp/screens/list_chat.dart';
import 'package:webapp/screens/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          child: Row(children: [
            Expanded(
              flex: 3,
              child: Menu(),
            ),
            Expanded(
              flex: 7,
              child: ChatList(),
            ),
            Expanded(
              flex: 8,
              child: ChatMessage(),
            ),
          ]),
        ),
      ),
    );
  }
}

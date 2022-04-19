import 'package:flutter/material.dart';
import 'package:webapp/screens/chat.dart';
import 'package:webapp/screens/list_chat.dart';
import 'package:webapp/screens/menu.dart';

class HomePage extends StatelessWidget {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _key,
      drawer: width > 880
          ? null
          : Container(
              width: 250,
              child: Menu(),
            ),
      body: SafeArea(
        child: Container(
          height: height,
          child: Row(children: [
            if (width > 880)
              Expanded(
                flex: 3,
                child: Menu(),
              ),
            Expanded(
              flex: 7,
              child: ChatList(
                onOpenMenu: width > 880
                    ? null
                    : () {
                        _key.currentState!.openDrawer();
                      },
              ),
            ),
            if (width > 660)
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

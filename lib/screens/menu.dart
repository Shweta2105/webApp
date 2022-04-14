import 'package:flutter/material.dart';

import 'package:webapp/configs/config.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var selectValue = MenuItemSelect.CHAT;
  onChanged(val) {
    selectValue = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

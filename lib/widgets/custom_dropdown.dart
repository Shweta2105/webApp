import 'package:flutter/material.dart';
import 'package:webapp/configs/config.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final Function(dynamic value) onChange;
  final dynamic value;
  CustomDropDown({required this.items, required this.onChange, this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      isDense: true,
      onChanged: (value) {
        if (onChange != null) onChange(value);
      },
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Config.colors.textColorMenu,
      ),
      hint: Text(
        value,
        style: Config.styles.prymaryTextStyle
            .copyWith(color: Config.colors.textColorMenu),
      ),
      items: items
          .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: Config.styles.prymaryTextStyle
                    .copyWith(color: Config.colors.textColorMenu),
              )))
          .toList(),
    );
  }
}

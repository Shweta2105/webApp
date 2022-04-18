import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:webapp/configs/config.dart';

import 'custom_dropdown.dart';

class CustomSearch extends StatefulWidget {
  CustomSearch({Key? key}) : super(key: key);

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  String value = "Messages";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Config.colors.textColorMenu.withOpacity(.7),
                offset: Offset(0, 0),
                blurRadius: 0)
          ]),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          style: Config.styles.prymaryTextStyle.copyWith(
            color: Config.colors.textColorMenu,
          ),
          decoration: InputDecoration(
              prefixIcon: const Icon(
                FeatherIcons.search,
                size: 20,
              ),
              hintStyle: Config.styles.prymaryTextStyle.copyWith(
                color: Config.colors.textColorMenu,
              ),
              hintText: "Search",
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              )),
        )),
        CustomDropDown(
            value: value,
            items: ["Messages", "Voices", "Files"],
            onChange: (e) {
              value = e;
              setState(
                () {},
              );
            }),
      ]),
    );
  }
}

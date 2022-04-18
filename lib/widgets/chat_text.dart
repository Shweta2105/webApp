import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:webapp/configs/config.dart';

class ChatTextFields extends StatelessWidget {
  final Widget? prefix, suffix;
  final int? minLines, maxLines;
  final String hintText;

  const ChatTextFields(
      {Key? key,
      this.prefix,
      this.minLines,
      this.maxLines,
      required this.hintText,
      this.suffix})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (prefix != null) prefix!,
        Expanded(
            child: TextField(
          maxLines: maxLines,
          minLines: minLines,
          style: Config.styles.prymaryTextStyle
              .copyWith(color: Config.colors.textColorMenu),
          decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: Config.styles.prymaryTextStyle
                  .copyWith(color: Config.colors.textColorMenu.withOpacity(.5)),
              suffixIcon: Icon(FeatherIcons.smile)),
        )),
        if (suffix != null) suffix!
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:webapp/configs/config.dart';
import 'package:webapp/widgets/myfile.dart';

class MessageComponent extends StatelessWidget {
  final bool isMe;
  final String? message;
  final MyFile? myFile;

  const MessageComponent({
    Key? key,
    this.isMe = false,
    this.message,
    this.myFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width <= 660;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe)
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(Config.assets.user3),
          ),
        Row(
          children: [
            if (isMe)
              Icon(
                FeatherIcons.moreHorizontal,
                size: 18,
                color: Config.colors.textColorMenu,
              ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              constraints: BoxConstraints(
                maxWidth: isMobile ? width / 1.6 : width / 4,
              ),
              decoration: BoxDecoration(
                  color: isMe ? Colors.white : Config.colors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(10),
                    bottomRight: const Radius.circular(10),
                    topLeft: isMe
                        ? const Radius.circular(10)
                        : const Radius.circular(0),
                    topRight: isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(10),
                  ),
                  boxShadow: [
                    if (!isMe) ...[
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.15),
                          offset: const Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.05),
                          offset: const Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.15),
                          offset: const Offset(6, 6),
                          blurRadius: 10),
                    ] else ...[
                      BoxShadow(
                          color: Config.colors.shadowCurrentUserChat
                              .withOpacity(.15),
                          offset: const Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color: Config.colors.shadowCurrentUserChat
                              .withOpacity(0.05),
                          offset: const Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color: Config.colors.shadowCurrentUserChat
                              .withOpacity(.15),
                          offset: const Offset(6, 6),
                          blurRadius: 10),
                    ]
                  ],
                  gradient: isMe
                      ? null
                      : LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.bottomLeft,
                          // radius: 10,
                          colors: [
                              Config.colors.primaryColor,
                              Config.colors.primaryColor,
                              Config.colors.primaryColor.withOpacity(.5),
                            ])),
              child: Column(
                crossAxisAlignment:
                    !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  if (message != null) ...[
                    Text(
                      message!,
                      style: Config.styles.prymaryTextStyle.copyWith(
                          color:
                              isMe ? Config.colors.textColorMenu : Colors.white,
                          fontSize: 13),
                    ),
                    if (myFile != null) ...[
                      const SizedBox(
                        height: 10,
                      ),
                      FileWidget(
                        file: myFile!,
                        isMe: isMe,
                      )
                    ],
                  ] else ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isMe) ...[
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white.withOpacity(.5),
                            ),
                            child: const Icon(
                              FeatherIcons.file,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myFile!.name,
                              style: Config.styles.prymaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: !isMe
                                      ? Colors.white
                                      : Config.colors.textColorMenu),
                            ),
                            Text(
                              "${myFile!.size} Mb",
                              style: Config.styles.prymaryTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: !isMe
                                      ? Colors.white
                                      : Config.colors.textColorMenu),
                            ),
                          ],
                        ),
                        if (isMe) ...[
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white.withOpacity(.5),
                            ),
                            child: Icon(
                              FeatherIcons.file,
                              size: 15,
                              color: Config.colors.textColorMenu,
                            ),
                          ),
                        ],
                      ],
                    )
                  ]
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class FileWidget extends StatelessWidget {
  final MyFile file;
  final bool isMe;

  const FileWidget({
    Key? key,
    required this.file,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (isMe)
          Icon(
            FeatherIcons.file,
            size: 13,
            color: !isMe ? Colors.white : Config.colors.primaryColor,
          ),
        Expanded(
          flex: 2,
          child: Text(
            "(${file.size} Mb)${file.name}",
            textAlign: isMe ? TextAlign.start : TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: Config.styles.prymaryTextStyle.copyWith(
                fontSize: 12,
                color: !isMe ? Colors.white : Config.colors.primaryColor),
          ),
        ),
        if (!isMe)
          Icon(
            FeatherIcons.file,
            size: 13,
            color: !isMe ? Colors.white : Config.colors.primaryColor,
          ),
      ],
    );
  }
}

class FullCheck extends StatelessWidget {
  final double size;
  final bool isChecked;
  final Color checkColor;
  FullCheck(
      {Key? key,
      this.size = 15,
      this.isChecked = false,
      this.checkColor = const Color(0xFFB7BDCB)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          FeatherIcons.check,
          size: size,
          color: checkColor,
        ),
        Container(
            margin: const EdgeInsets.only(left: 5),
            child: Icon(
              FeatherIcons.check,
              size: size,
              color: checkColor,
            )),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  final String date;

  const CustomDivider({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
              child:
                  Divider(color: Config.colors.textColorMenu.withOpacity(.15))),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                date,
                style: Config.styles.prymaryTextStyle.copyWith(
                  fontSize: 11,
                  color: Config.colors.textColorMenu.withOpacity(.7),
                ),
              )),
          Expanded(
              child:
                  Divider(color: Config.colors.textColorMenu.withOpacity(.15))),
        ],
      ),
    );
  }
}

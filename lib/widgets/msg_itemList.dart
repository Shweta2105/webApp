import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:webapp/configs/config.dart';
import 'package:webapp/widgets/item_profiel.dart';

import '../models/msg_model.dart';

class MessageItemList extends StatelessWidget {
  final MessageItem msg;

  const MessageItemList({required this.msg});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: msg.isSelected
                  ? Config.colors.primaryColor
                  : Config.colors.backgroundColor1),
          color: Colors.white,
          gradient: msg.isSelected
              ? LinearGradient(colors: [
                  Config.colors.primaryColor,
                  Config.colors.primaryColor,
                  Config.colors.primaryColor.withOpacity(.5)
                ])
              : null,
          boxShadow: [
            BoxShadow(
                color: Config.colors.textColorMenu.withOpacity(.7),
                offset: Offset(0, 0),
                blurRadius: 0),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemProfile(msg),
              Expanded(
                  child: Text(
                msg.time!,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                style: Config.styles.prymaryTextStyle.copyWith(
                    fontSize: 12,
                    color: msg.isSelected
                        ? Colors.white
                        : Config.colors.textColorMenu),
              ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (msg.isVoice) ...[
                        Container(
                          margin: EdgeInsets.only(top: 2, right: 8),
                          child: Icon(
                            FeatherIcons.mic,
                            color: msg.isSelected
                                ? Colors.white
                                : Config.colors.textColorMenu,
                            size: 12,
                          ),
                        )
                      ],
                      Expanded(
                        child: Text(
                          msg.textMessage!,
                          style: Config.styles.prymaryTextStyle.copyWith(
                              fontSize: 13,
                              color: msg.isSelected
                                  ? Colors.white
                                  : Config.colors.textColorMenu),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (msg.haveFile)
                    Row(
                      children: [
                        ItemFile(
                            title: "File (x2)",
                            color: Config.colors.primaryColor,
                            icon: FeatherIcons.mic),
                        SizedBox(
                          width: 10,
                        ),
                        ItemFile(
                            title: "Photos",
                            color: Config.colors.notifColor,
                            icon: FeatherIcons.image),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Config.colors.notifColor.withOpacity(.25)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FeatherIcons.image,
                                size: 13,
                                color: Config.colors.notifColor,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Photo",
                                style: Config.styles.prymaryTextStyle.copyWith(
                                    color: Config.colors.notifColor,
                                    fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                ],
              )),
              if (msg.notif != null)
                Container(
                  margin: EdgeInsets.only(left: 6, right: 6),
                  padding:
                      EdgeInsets.only(left: 5, bottom: 6, right: 5, top: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Config.colors.notifColor,
                  ),
                  child: Center(
                    child: Text(
                      "${msg.notif}",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              if (msg.notif == null)
                Container(
                  width: 20,
                ),
            ],
          )
        ],
      ),
    ));
  }
}

class ItemFile extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const ItemFile({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Config.colors.primaryColor.withOpacity(.25)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13,
            color: color,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "$title",
            style: Config.styles.prymaryTextStyle.copyWith(
              color: Config.colors.primaryColor,
              fontSize: 11,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:webapp/screens/chat.dart';
import 'package:webapp/widgets/custom_button.dart';
import 'package:webapp/widgets/custom_dropdown.dart';
import 'package:webapp/widgets/custom_search.dart';
import 'package:webapp/widgets/msg_itemList.dart';

import '../configs/config.dart';
import '../models/msg_model.dart';

class ChatList extends StatefulWidget {
  final Function()? onOpenMenu;

  const ChatList({Key? key, this.onOpenMenu}) : super(key: key);
  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  String recentValue = "Recent Message";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Config.colors.backgroundColor1,
                    Config.colors.backgroundColor2,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 0.2])),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chats",
                              style: Config.styles.prymaryTextStyle.copyWith(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            CustomDropDown(
                                value: recentValue,
                                items: ["Recent Message", "Old Message"],
                                onChange: (e) {
                                  recentValue = e;
                                  setState(
                                    () {},
                                  );
                                }),
                          ],
                        ),
                        CustomButton(
                            title: "New Chat",
                            onTap: () {},
                            radius: 10,
                            prefix: Icons.add)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomSearch(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      MessageItemList(
                          msg: MessageItem(
                        onTap: () {
                          //if (width <= 660)
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => ChatMessage()));
                        },
                        statut: StatusType.WRITE,
                        username: "OnProgram",
                        statutMessage: "writes",
                        time: "1 Minute Ago",
                        profil_asset: Config.assets.user1,
                        textMessage:
                            "Most of the time i get confuse to post or not to post",
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      MessageItemList(
                        msg: MessageItem(
                          profil_asset: Config.assets.user2,
                          notif: 1,
                          statut: StatusType.RECORD,
                          isVoice: true,
                          haveFile: true,
                          username: "Jores Valdes",
                          statutMessage: "records voice message",
                          time: "1 minute ago",
                          textMessage: "Voice message (01:15)",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MessageItemList(
                        msg: MessageItem(
                            isSelected: true,
                            profil_asset: Config.assets.user3,
                            statut: StatusType.LAST_AGO,
                            username: "Harold Beranger",
                            statutMessage: "last online 5 hours ago",
                            time: "3 days ago",
                            textMessage:
                                "Cicero famously orated against his political opponent Lucius Sergius Catilina."),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MessageItemList(
                        msg: MessageItem(
                          profil_asset: Config.assets.user4,
                          notif: 2,
                          statut: StatusType.LAST_AGO,
                          username: "Aurore Belvine",
                          statutMessage: "last online 5 hours ago",
                          time: "3 days ago",
                          textMessage:
                              "Most of its text is made up from sections 1.10.32–3 of Cicero's De finibus bonorum et malorum (On the Boundaries of Goods and Evils; finibus may also be translated as purposes).",
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
        if (widget.onOpenMenu != null)
          Container(
            margin: EdgeInsets.only(left: 25, top: 20),
            child: InkWell(
              child: Icon(
                FeatherIcons.menu,
                size: 30,
              ),
              onTap: widget.onOpenMenu,
            ),
          )
      ],
    );
  }
}

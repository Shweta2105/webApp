import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:webapp/configs/config.dart';
import 'package:webapp/models/msg_model.dart';
import 'package:webapp/widgets/chat_text.dart';
import 'package:webapp/widgets/custom_button.dart';
import 'package:webapp/widgets/item_profiel.dart';
import 'package:webapp/widgets/message_component.dart';
import 'package:webapp/widgets/myfile.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({Key? key}) : super(key: key);

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 50, bottom: 25, left: 5, right: 15),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Config.colors.textColorMenu.withOpacity(.2),
              blurRadius: 5,
              offset: Offset(0, 0),
            )
          ]),
          child: Column(children: [
            Container(
              padding: EdgeInsets.fromLTRB(35, 20, 30, 15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Config.colors.textColorMenu.withOpacity(.5)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemProfile(MessageItem(
                      username: "Harold Beranger",
                      statutMessage: "last online 5 hours ago",
                      statut: StatusType.LAST_AGO,
                      profil_asset: Config.assets.user3)),
                  Expanded(child: Container()),
                  RBtn(icon: FeatherIcons.paperclip, onPressed: () {}),
                  SizedBox(
                    width: 15,
                  ),
                  RBtn(icon: FeatherIcons.moreVertical, onPressed: () {})
                ],
              ),
            ),
            Expanded(
                child: Scrollbar(
              isAlwaysShown: true,
              controller: controller,
              child: SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 30, 0),
                    child: Column(children: [
                      MessageComponent(
                        message:
                            "Hello OnProgramme! Finally found the time to write to you)\n"
                            "I need your help in creating interactive animations for my"
                            "mobile application.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MessageComponent(
                        message: "Can I send you files?",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MessageComponent(
                        message: "Hey! Okay, send out.",
                        isMe: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MessageComponent(
                        myFile: MyFile(size: 41.36, name: "Style.zip"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomDivider(
                        date: "3 day ago",
                      ),
                      MessageComponent(
                        isMe: true,
                        message:
                            "Hello! I tweaked everything you asked. I am sending "
                            "the finished file",
                        myFile: MyFile(size: 41.36, name: " New_Style.zip"),
                      ),
                      MessageComponent(
                        isMe: true,
                        myFile: MyFile(size: 41.36, name: "Style.zip"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MessageComponent(
                        message:
                            "Hello OnProgramme! Finally found the time to write to you) I need your help in creating interactive animations for my mobile application.",
                      ),
                    ]),
                  )),
            )),
            Container(
              margin: EdgeInsets.only(left: 40, right: 30, bottom: 10),
              child: ChatTextFields(
                  prefix: RBtn2(
                    icon: Icons.add,
                    onpressed: () {},
                  ),
                  suffix: RBtn2(
                    icon: FeatherIcons.send,
                    onpressed: () {},
                  ),
                  hintText: "Type a message here.."),
            )
          ]),
        ),
      ),
    );
  }
}

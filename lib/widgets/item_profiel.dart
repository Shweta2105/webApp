import 'package:flutter/material.dart';
import 'package:webapp/configs/config.dart';
import 'package:webapp/widgets/svg_icon.dart';

import '../models/msg_model.dart';

class ItemProfile extends StatelessWidget {
  final MessageItem msgModel;
  const ItemProfile(this.msgModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(msgModel.profil_asset),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (msgModel.statutMessage != null)
                Text(
                  msgModel.username,
                  style: Config.styles.prymaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (msgModel != null &&
                      msgModel.statut != StatusType.LAST_AGO) ...[
                    // SvgIcon(
                    //     asset: msgModel.statut == StatusType.RECORD
                    //         ? Config.assets.record
                    //         : Config.assets.write,
                    //     color: msgModel.isSelected
                    //         ? Colors.white
                    //         : Config.colors.primaryColor,
                    // size: msgModel.statut == StatusType.WRITE ? 4 : 10),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Text(
                      msgModel.statutMessage,
                      style: Config.styles.prymaryTextStyle.copyWith(
                        color: msgModel.isSelected
                            ? Colors.white
                            : Config.colors.primaryColor,
                      ),
                    )
                  ]
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MessageItem {
  String statutMessage;
  String username;
  String profil_asset;
  String? time;
  StatusType statut;
  String? textMessage;
  bool haveFile;
  bool isVoice;
  int? notif;
  bool isSelected;
  Function? onTap;

  MessageItem(
      {required this.statutMessage,
      required this.username,
      required this.statut,
      required this.profil_asset,
      this.time,
      this.textMessage,
      this.haveFile = false,
      this.isVoice = false,
      this.notif,
      this.isSelected = false,
      this.onTap});

  // @override
  // Widget build(BuildContext context) {
  //   return InkWell();
  // }
}

enum StatusType { RECORD, WRITE, LAST_AGO }

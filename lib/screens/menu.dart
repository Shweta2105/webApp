import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webapp/configs/config.dart';
import 'package:webapp/widgets/menu_item.dart';

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
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(20, 10),
          blurRadius: 50,
        )
      ]),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(Config.assets.user),
                        radius: 40,
                        backgroundColor: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Henry',
                            style: Config.styles.prymaryTextStyle
                                .copyWith(fontSize: 12.5),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Config.colors.primaryBlackColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                MenuItem(
                  title: "Home",
                  groupValue: MenuItemSelect.HOME,
                  onChanged: onChanged,
                  icon: FeatherIcons.grid,
                ),
                MenuItem(
                  title: "Chat",
                  groupValue: MenuItemSelect.CHAT,
                  onChanged: onChanged,
                  icon: FontAwesomeIcons.commentDots,
                ),
                MenuItem(
                  title: "Contact",
                  groupValue: MenuItemSelect.CONTACT,
                  onChanged: onChanged,
                  icon: FeatherIcons.user,
                ),
                MenuItem(
                  title: "Notification",
                  groupValue: MenuItemSelect.NOTIIFICATION,
                  onChanged: onChanged,
                  icon: FeatherIcons.bell,
                ),
                MenuItem(
                  title: "Calender",
                  groupValue: MenuItemSelect.CALENDAR,
                  onChanged: onChanged,
                  icon: FeatherIcons.calendar,
                ),
                MenuItem(
                  title: "Settings",
                  groupValue: MenuItemSelect.SETTINGS,
                  onChanged: onChanged,
                  icon: FeatherIcons.settings,
                ),
              ],
            ),
          ),
          MenuItem(
            title: "LogOut",
            groupValue: MenuItemSelect.LOGOUT,
            onChanged: onChanged,
            icon: FeatherIcons.settings,
          ),
        ],
      ),
    );
  }
}

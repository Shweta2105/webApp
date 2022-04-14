import 'package:flutter/material.dart';
import 'package:webapp/configs/config.dart';

class MenuItem extends StatefulWidget {
  final String title;
  final groupValue, value;
  final Function(dynamic value) onChanged;
  final IconData icon;

  const MenuItem(
      {Key? key,
      required this.title,
      this.groupValue,
      this.value,
      required this.onChanged,
      required this.icon})
      : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.value == widget.groupValue;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onHover: (value) {
          isHover = value;
          setState(() {});
        },
        onTap: () {
          if (widget.onChanged != null) widget.onChanged(widget.groupValue);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: isHover
                ? LinearGradient(
                    colors: [
                      Config.colors.primaryBlackColor.withOpacity(0.1),
                      Colors.white,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 0.7])
                : null,
          ),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 2.5,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Config.colors.primaryColor
                      : Colors.transparent,
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: Config.colors.primaryColor,
                        offset: Offset(3, -1),
                        blurRadius: 5,
                      ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                widget.icon,
                color: isSelected
                    ? Config.colors.primaryColor
                    : Config.colors.textColorMenu,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.title,
                style: Config.styles.prymaryTextStyle.copyWith(
                  color: Config.colors.textColorMenu,
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

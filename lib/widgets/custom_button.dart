import 'package:flutter/material.dart';
import 'package:webapp/configs/config.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final double radius;
  final IconData prefix;

  CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.radius,
      required this.prefix})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Config.colors.shadowButtonColor.withOpacity(.15),
                    offset: Offset(6, 6),
                    blurRadius: 10),
                BoxShadow(
                    color: Config.colors.shadowButtonColor.withOpacity(.05),
                    offset: Offset(6, 6),
                    blurRadius: 10),
                BoxShadow(
                    color: Config.colors.shadowButtonColor.withOpacity(.15),
                    offset: Offset(6, 6),
                    blurRadius: 10),
              ],
              borderRadius: BorderRadius.circular(radius),
              gradient: LinearGradient(
                colors: [
                  Config.colors.primaryColor,
                  Config.colors.primaryColor,
                  Config.colors.primaryColor.withOpacity(.5),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefix != null)
                Icon(
                  prefix,
                  color: Colors.white,
                  size: 20,
                ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: Config.styles.prymaryTextStyle.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ));
  }
}

class RBtn extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RBtn({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      shadowColor: Config.colors.textColorMenu,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Config.colors.textColorMenu,
            size: 13,
          ),
        ),
      ),
    );
  }
}

class RBtn2 extends StatelessWidget {
  final IconData? icon;
  final Function? onpressed;

  const RBtn2({Key? key, this.icon, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Config.colors.primaryColor.withOpacity(.5),
                Config.colors.primaryColor,
                Config.colors.primaryColor,
              ]),
          borderRadius: BorderRadius.circular(50)),
      child: RawMaterialButton(
        onPressed: () => onpressed,
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

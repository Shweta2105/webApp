import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String asset;
  final Color color;
  final double size;

  const SvgIcon({
    required this.asset,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      height: size,
      color: color,
    );
  }
}

import 'package:flutter/material.dart';

class GenericText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextDecoration? textDecoration;

  const GenericText({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
        decoration: textDecoration ?? TextDecoration.none,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

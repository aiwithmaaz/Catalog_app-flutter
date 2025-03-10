import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class catalogimage extends StatelessWidget {
  final String image;
  const catalogimage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image ,
      fit: BoxFit.contain,
    )
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .pOnly(left: 12, top: 12, bottom: 12, right: 12)
        .w40(context);
  }
}

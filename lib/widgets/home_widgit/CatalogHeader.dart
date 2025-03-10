import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .color(context.theme.secondaryHeaderColor)
            .xl6
            .bold
            .make(),
        "Trending Products"
            .text
            .color(context.theme.secondaryHeaderColor)
            .xl2
            .make()
            .p(10),
      ],
    );
  }
}

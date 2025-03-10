import 'package:flutter/material.dart';
import 'package:myapp/widgets/home_widgit/add_to_cart.dart';
import 'package:myapp/widgets/home_widgit/catalogimage.dart';
import 'package:myapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: catalogimage(image: catalog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(context.theme.secondaryHeaderColor)
                    .bold
                    .make()
                    .pOnly(left: 12),
                catalog.discription.text
                    .textStyle(context.captionStyle)
                    .make()
                    .pOnly(left: 12),
                10.heightBox,
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.bold.xl2.make().pOnly(left: 12),
                      Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: AdtoCart(catalog: catalog)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py12();
  }
}


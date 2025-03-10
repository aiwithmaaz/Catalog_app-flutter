import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/home_widgit/add_to_cart.dart';
import 'package:myapp/widgets/thems.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  final item catalog;

  const HomeDetails({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: context.canvasColor  ,
        bottomNavigationBar: Container(
          color: context.theme.cardColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: AdtoCart(catalog: catalog,)
                    .wh(170, 45),
              ),
            ],
          ).p32(),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h40(context),
              Expanded(
                  child: VxArc(
                      height: 30,
                      arcType: VxArcType.convey,
                      edge: VxEdge.top,
                      child: Container(
                        color: Theme.of(context).cardColor,
                        width: context.screenWidth,
                        child: Column(
                          children: [
                            catalog.name.text.xl5
                                .color(Mytheme.darkbluisColor)
                                .bold
                                .make(),
                            catalog.discription.text.xl
                                .textStyle(context.captionStyle)
                                .make(),
                          ],
                        ).py64(),
                      )))
            ],
          ),
        ));
  }
}

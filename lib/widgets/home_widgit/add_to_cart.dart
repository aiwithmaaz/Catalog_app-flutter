import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/cart_details.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/thems.dart';
import 'package:velocity_x/velocity_x.dart';

class AdtoCart extends StatelessWidget {
  final item catalog;
  AdtoCart({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return VxBuilder(
  mutations: {AddMutation, RemoveMutation}, // ✅ Mutation listen ho raha hai
  builder: (context, _, __) {
    final CartModel _cart = (VxState.store as Mystore).cart;

    final bool IsinCart = _cart.items.contains(catalog); // ✅ Har rebuild pe update hoga

    return ElevatedButton(
      onPressed: () {
        if (!IsinCart) {
          AddMutation(item: catalog); // ✅ AddMutation ke baad UI update hoga
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Mytheme.darkbluisColor),
      ),
      child: IsinCart  
          ? const Icon(Icons.done)  // ✅ Har update ke baad sahi icon show hoga
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  },
);

  }
}

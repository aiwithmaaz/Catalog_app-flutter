import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/cart_details.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/thems.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        title:
            "Cart".text.center.color(context.theme.secondaryHeaderColor).make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as Mystore).cart;
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxConsumer(
                notifications: {},
                mutations: {RemoveMutation},
                builder: (context, _, __) {
                  return "\$${_cart.totalPrice}"
                      .text
                      .color(context.theme.secondaryHeaderColor)
                      .make()
                      .w(30);
                }),
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Bying is not supproted yet.".text.make(),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ));
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                      Mytheme.darkbluisColor,
                    )),
                    child: "Buy".text.white.make())
                .w32(context)
          ],
        ));
  }
}

class _cartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: {RemoveMutation}, // Yeh mutation ka update listen karega
      builder: (context, _, __) {
        final CartModel _cart = (VxState.store as Mystore).cart;
        return _cart.items.isEmpty
            ? "Nothing to Show".text.xl3.capitalize.makeCentered()
            : ListView.builder(
                itemCount: _cart.items.length,
                itemBuilder: (context, index) {
                  final item = _cart.items[index];
                  return ListTile(
                    leading: const Icon(Icons.done_rounded),
                    trailing: IconButton(
                      onPressed: () {
                        RemoveMutation(item: item);
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    title: item.name.text.make(),
                  );
                },
              );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/Pages/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemWidget extends StatelessWidget {
  final item;

  const ItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        onTap: () {
          print(item.name);
        },
        leading: Image.network(item.image,
        fit: BoxFit.contain,),
        title: Text(item.name,
            style: TextStyle(fontWeight: FontWeight.bold,
            color: context.theme.secondaryHeaderColor,
            )),
        subtitle: Text(item.discription),
        trailing: Text(
          "\$${item.price}",
          // ignore: deprecated_member_use
          textScaleFactor: 1.5,
          style: const TextStyle(
              fontWeight: FontWeight.bold,),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}

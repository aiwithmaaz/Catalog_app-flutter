import 'package:flutter/material.dart';
import 'package:myapp/Pages/LoginPage.dart';
import 'package:myapp/Pages/cart.dart';
import 'package:myapp/Pages/homePage.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/thems.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: Mystore(),
  child: const myapp()));
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      themeMode: ThemeMode.dark,
        theme: Mytheme.LightTheme(context),
        darkTheme: Mytheme.DarkTheme(context),
        routes: {
          "/": (context) => const LoginPage(),
          "/home": (context) => HomePage(),
          "/login": (context) => const LoginPage(),
          "/cart": (context) => const CartPage()
        });
  }
}

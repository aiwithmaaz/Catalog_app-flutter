import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/home_widgit/CatalogHeader.dart';
import 'package:myapp/widgets/home_widgit/CatalogList.dart';
import 'package:myapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];

    catalogModel.items = List.from(productsData)
        .map<item>((product) => item.fromMap(product))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).elevatedButtonTheme.style?.backgroundColor?.resolve({}),
          onPressed: () => Navigator.pushNamed(context ,"/cart"),
          child: const Icon(CupertinoIcons.cart),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const CatalogHeader(),
              if (catalogModel.items != null && catalogModel.items.isNotEmpty)
                const Expanded(child: CatalogList(filtereditems: []))
              else
                const CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}









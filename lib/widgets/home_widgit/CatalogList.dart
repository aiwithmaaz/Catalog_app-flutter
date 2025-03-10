import 'package:flutter/material.dart';
import 'package:myapp/Pages/home_details.dart';
import 'package:myapp/widgets/home_widgit/CatalogItem.dart';
import 'package:myapp/models/catalog.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key, required List<item> filtereditems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: catalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = catalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetails(
                catalog: catalog,
              ))),
          child:  CatalogItem(catalog: catalog));
      },
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // Private catalog instance. Using 'late' since it must be set before usage.
  late catalogModel _catalog;

  // Collection of IDs - store IDs of each item in the cart.
  final List<int> _itemIDs = [];

  // Getter for catalog
  catalogModel get catalog => _catalog;

  // Setter for catalog
  set catalog(catalogModel newCatalog) {
    assert(newCatalog != null, "Catalog must not be null");
    _catalog = newCatalog;
  }

  // Get items in the cart.
  // Assumes that 'getById' returns an item for the given id.
  List<item> get items => _itemIDs.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

}

class AddMutation extends VxMutation<Mystore> {
  final item;
  AddMutation({required this.item});
  @override
  perform() {
    store!.cart._itemIDs.add(item.id);
  }
}


class RemoveMutation extends VxMutation<Mystore> {
  final item;
  RemoveMutation({required this.item});
  @override
  perform() {
    store!.cart._itemIDs.remove(item.id);
  }
}

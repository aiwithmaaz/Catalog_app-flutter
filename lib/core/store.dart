import 'package:myapp/models/cart_details.dart';
import 'package:myapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore {
  late catalogModel catalog;
  late CartModel cart;

  // Constructor
  Mystore() {
    catalog = catalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}

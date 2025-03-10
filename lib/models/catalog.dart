import 'package:flutter/material.dart';

class catalogModel {
  static List<item> items = [];

  get totalPrice => null;

// get items by id
  item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

// get item by position
  item getByPosition(int pos) => items[pos];
}

class item {
  final int id;
  final String name;
  final String discription;
  final num price;
  final String color;
  final String image;

  item(
      {required this.id,
      required this.name,
      required this.discription,
      required this.price,
      required this.color,
      required this.image});

  factory item.fromMap(Map<String, dynamic> map) {
    return item(
        id: map["id"],
        name: map["name"],
        discription: map["discription"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  tpMap() => {
        "id": id,
        "name": name,
        "discription": discription,
        "price": price,
        "color": color,
        "image": image
      };
}

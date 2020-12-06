import 'package:flutter/cupertino.dart';

class Coffeetype {
  final String name;
  final String coffeedef;
  final int price;
  final String brandName;
  bool isFavorite;

  Coffeetype(
      {@required this.name,
      @required this.coffeedef,
      @required this.price,
      @required this.brandName,
      @required this.isFavorite});
}

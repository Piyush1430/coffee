import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CoffeeModel {
  final String id;
  final String name;
  final String imagePath;
  final String subtitle;
  String price;
  int quantity;
  String size;

  CoffeeModel({
    required this.name,
    required this.imagePath,
    required this.subtitle,
    required this.price,
    this.quantity = 1,
    this.size = "S",
  }) : id = uuid.v4();
}

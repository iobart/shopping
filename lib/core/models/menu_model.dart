import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel{
  final String name;
  final String description;
  final int stock;
  final double price;
  final DocumentReference? createdByUserId;

  MenuModel({
    required this.name,
    required this.description,
    required this.stock,
    required this.price,
     this.createdByUserId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'stock': stock,
      'price': price,
      'createdByUserId': createdByUserId,
    };
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FoodItems {
  final String? name;
  final String? cuisine;
  final String? image;

  const FoodItems({this.name, this.cuisine, this.image});

  factory FoodItems.fromJson(Map<String, dynamic> json) {
    return FoodItems(
      name: json['name'] as String?,
      cuisine: json['cuisine'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'cuisine': cuisine,
        'image': image,
      };
  // creating a FoodItem object from a firebase snapshot
  FoodItems.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot['name'],
        cuisine = snapshot['cuisine'],
        image = snapshot['image'];
}

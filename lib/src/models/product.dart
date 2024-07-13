import 'dart:convert';

import 'package:intl/intl.dart';

const imageURL = 'https://api.timbu.cloud/images';

class Product {
  final String id;
  final String name;
  final String description;
  final Map<String, dynamic> price;
  final List<String> photos;
  final List<String> categories;
  final bool isAvailable;
  final int quantity;
  final int ratings;
  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categories,
    required this.photos,
    required this.isAvailable,
    this.quantity = 1,
    this.ratings = 4,
  });

  Product decrementQuantity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      categories: categories,
      photos: photos,
      isAvailable: isAvailable,
      quantity: quantity - 1,
    );
  }

  Product incrementQuantity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      categories: categories,
      photos: photos,
      isAvailable: isAvailable,
      quantity: quantity + 1,
    );
  }

  // sanitizedPrice is used to get the price, format it in the
  // form e.g "2,345.67", in 2 decimal place, and return as String
  String get sanitizedPrice {
    var str = '';
    price.forEach((key, value) {
      str += '${key[0]} ';
      str += NumberFormat('#,##0.00')
          .format(((value as List).first as double) * quantity)
          .toString();
    });

    return str;
  }

  String get photo {
    if (photos.isEmpty) return '';
    return photos.first;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    var categories = <String>[];
    if (map['categories'] == null) {
      categories.add('others');
    } else {
      categories =
          List<String>.from((map['categories'] as List).map((e) => e['name']));
    }
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] ?? '',
      price: ((map['current_price'] ?? []) as List).firstOrNull ?? {},
      categories: categories,
      photos: List<String>.from(
        (map['photos'] as List).map((e) => '$imageURL/${e['url']}'),
      ),
      isAvailable: map['is_available'],
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, isAvailable:$isAvailable, price: $price, categories: $categories, photos: $photos)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

import 'dart:convert';

class Product{
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  String? id;


  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,

  });

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'description' : description,
      'quantity' :quantity,
      'images' :  images,
      'category' : category,
      'price' : price,
      'id' : id,

    };
  }

  String toJson()  => json.encode(toMap());

  factory Product.fromMap(Map<String,dynamic> map){
    return Product(
        name : map['name'] ?? '',
        description : map['description'] ?? '',
        quantity : map ['quantity']?.toDouble() ?? 0.0,
        images :List<String>.from(map['images']),
        category : map['category'] ?? '',
        price : map['price']?.toDouble() ?? '',
        id : map['_id'],
    );
  }



  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
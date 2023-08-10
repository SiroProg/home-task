import 'dart:convert';

void main(List<String> args) {
  String response = '''
{
    "products": [
        {
            "id": 1,
            "title": "iPhone 9",
            "description": "An apple mobile which is nothing like apple",
            "price": 549,
            "discountPercentage": 12.96,
            "rating": 4.69,
            "stock": 94,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/1/1.jpg",
                "https://i.dummyjson.com/data/products/1/2.jpg",
                "https://i.dummyjson.com/data/products/1/3.jpg",
                "https://i.dummyjson.com/data/products/1/4.jpg",
                "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
            ]
        },
        {
            "id": 2,
            "title": "iPhone X",
            "description": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            "price": 899,
            "discountPercentage": 17.94,
            "rating": 4.44,
            "stock": 34,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/2/1.jpg",
                "https://i.dummyjson.com/data/products/2/2.jpg",
                "https://i.dummyjson.com/data/products/2/3.jpg",
                "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
            ]
        }
    ],
    "total": 100,
    "skip": 0,
    "limit": 2
}
''';

  ProductModel productModel = ProductModel.fromJson(jsonDecode(response));

  print(productModel.products![0].description);
}

class ProductModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductModel.fromJson(Map<String, Object?> json) {
    return ProductModel(
      products:
          (json['products'] as List?)?.map((e) => Product.fromJson(e)).toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }
}

class Product {
  int? id;
  String? title;
  String? description;
  num? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String> images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, Object?> json) {
    return Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as num?,
      discountPercentage: json['discountPercentage'] as double?,
      rating: json['rating'] as double?,
      stock: json['stock'] as int?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      thumbnail: json['thumbnail'] as String?,
      images:
          (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}

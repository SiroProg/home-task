import 'dart:convert';

void main(List<String> args) {
  String response = '''
{
    "carts": [
        {
            "id": 1,
            "products": [
                {
                    "id": 59,
                    "title": "Spring and summershoes",
                    "price": 20,
                    "quantity": 3,
                    "total": 60,
                    "discountPercentage": 8.71,
                    "discountedPrice": 55
                },
                {
                    "id": 88,
                    "title": "TC Reusable Silicone Magic Washing Gloves",
                    "price": 29,
                    "quantity": 2,
                    "total": 58,
                    "discountPercentage": 3.19,
                    "discountedPrice": 56
                },
                {
                    "id": 18,
                    "title": "Oil Free Moisturizer 100ml",
                    "price": 40,
                    "quantity": 2,
                    "total": 80,
                    "discountPercentage": 13.1,
                    "discountedPrice": 70
                },
                {
                    "id": 95,
                    "title": "Wholesale cargo lashing Belt",
                    "price": 930,
                    "quantity": 1,
                    "total": 930,
                    "discountPercentage": 17.67,
                    "discountedPrice": 766
                },
                {
                    "id": 39,
                    "title": "Women Sweaters Wool",
                    "price": 600,
                    "quantity": 2,
                    "total": 1200,
                    "discountPercentage": 17.2,
                    "discountedPrice": 994
                }
            ],
            "total": 2328,
            "discountedTotal": 1941,
            "userId": 97,
            "totalProducts": 5,
            "totalQuantity": 10
        },
        {
            "id": 2,
            "products": [
                {
                    "id": 96,
                    "title": "lighting ceiling kitchen",
                    "price": 30,
                    "quantity": 2,
                    "total": 60,
                    "discountPercentage": 14.89,
                    "discountedPrice": 51
                },
                {
                    "id": 91,
                    "title": "Black Motorbike",
                    "price": 569,
                    "quantity": 3,
                    "total": 1707,
                    "discountPercentage": 13.63,
                    "discountedPrice": 1474
                },
                {
                    "id": 9,
                    "title": "Infinix INBOOK",
                    "price": 1099,
                    "quantity": 1,
                    "total": 1099,
                    "discountPercentage": 11.83,
                    "discountedPrice": 969
                },
                {
                    "id": 16,
                    "title": "Hyaluronic Acid Serum",
                    "price": 19,
                    "quantity": 1,
                    "total": 19,
                    "discountPercentage": 13.31,
                    "discountedPrice": 16
                },
                {
                    "id": 54,
                    "title": "Pubg Printed Graphic T-Shirt",
                    "price": 46,
                    "quantity": 3,
                    "total": 138,
                    "discountPercentage": 16.44,
                    "discountedPrice": 115
                }
            ],
            "total": 3023,
            "discountedTotal": 2625,
            "userId": 30,
            "totalProducts": 5,
            "totalQuantity": 10
        }
    ],
    "total": 20,
    "skip": 0,
    "limit": 2
}
''';

  Carts carts = Carts.fromJson(jsonDecode(response));
  print(carts.carts[0].products[0].id);
}

class Carts {
  List<Cart> carts;
  int? total;
  int? skip;
  int? limit;

  Carts({
    required this.carts,
    this.total,
    this.skip,
    this.limit,
  });

  factory Carts.fromJson(Map<String, Object?> json) {
    return Carts(
      carts:
          (json['carts'] as List?)?.map((e) => Cart.fromJson(e)).toList() ?? [],
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }
}

class Cart {
  int? id;
  List<Product> products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Cart({
    this.id,
    required this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, Object?> json) {
    return Cart(
      id: json['id'] as int?,
      products: (json['products'] as List?)
              ?.map((e) => Product.fromJson(e))
              .toList() ??
          [],
      total: json['total'] as int?,
      discountedTotal: json['discountedTotal'] as int?,
      userId: json['userId'] as int?,
      totalProducts: json['totalProducts'] as int?,
      totalQuantity: json['totalQuantity'] as int?,
    );
  }
}

class Product {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;

  Product({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
  });

  factory Product.fromJson(Map<String, Object?> json) {
    return Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      quantity: json['quantity'] as int?,
      total: json['total'] as int?,
      discountPercentage: json['discountPercentage'] as double?,
      discountedPrice: json['discountedPrice'] as int?,
    );
  }
}

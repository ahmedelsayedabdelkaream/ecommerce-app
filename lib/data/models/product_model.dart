class ProductModel {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  final int? discount;
  final double? discountPrice;
  final Map<String, dynamic>? category;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.category,
    this.discountPrice,
    this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['imageUrl'],
      discount: json['discount'],
      discountPrice:
          ((json['price'] as num).toDouble()) -
          ((json['price'] as num).toDouble() * json['discount'] / 100),
      category: json['category'],
    );
  }

  static Map<String, dynamic> toJson(ProductModel product) => {
    'id': product.id,
    'name': product.name,
    'description': product.description,
    'price': product.price,
    'image': product.image,
    'category': product.category,
  };
}

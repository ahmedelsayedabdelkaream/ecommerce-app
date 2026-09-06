class ProductModel {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  final Map<String, dynamic>? category;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['imageUrl'],
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

class CartModel {
  final String? id;
  final String? name;
  final String? image;
  final double? price;
  final int? quantity;

  CartModel({this.id, this.name, this.image, this.price, this.quantity});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['productId'];
    return CartModel(
      id: data['_id'],
      name: data['name'],
      image: data['imageUrl'],
      price: (data['price'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }

  static Map<String, dynamic> toJson(
    String id,
    String name,
    String image,
    double price,
    int quantity,
  ) => {
    'id': id,
    'name': name,
    'image': image,
    'price': price,
    'quantity': quantity,
  };
}

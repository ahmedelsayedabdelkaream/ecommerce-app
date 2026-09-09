class CartModel {
  final String? id;
  final String? name;
  final String? image;
  final double? price;
  final int? quantity;
  final double? discountPrice;
  final int discount;
  CartModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.discount = 0,
    this.discountPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['productId'];
    final double discountPrice =
        ((data['price'] as num).toDouble() * json['quantity']) -
        (((data['price'] as num).toDouble() * json['quantity']) *
            (data['discount'] / 100));

    return CartModel(
      id: data['_id'],
      name: data['name'],
      image: data['imageUrl'],
      discount: data['discount'],
      price: (data['price'] as num).toDouble(),
      discountPrice: discountPrice,
      quantity: json['quantity'],
    );
  }

  static Map<String, dynamic> toJson(
    String id,
    String name,
    String image,
    double price,
    int quantity,
    int discount,
  ) => {
    'id': id,
    'name': name,
    'image': image,
    'price': price,
    'quantity': quantity,
    'discount': discount,
  };
}

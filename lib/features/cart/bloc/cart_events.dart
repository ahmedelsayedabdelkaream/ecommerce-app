abstract class CartEvents {}

class GetCartEvent extends CartEvents {}

class AddproductToCartEvent extends CartEvents {
  final String productId;
  final int quantity;
  AddproductToCartEvent({required this.productId, required this.quantity});
}

class AddToCartEvent extends CartEvents {
  final String productId;

  AddToCartEvent({required this.productId});
}

class RemoveFromCartEvent extends CartEvents {
  final String productId;

  RemoveFromCartEvent({required this.productId});
}

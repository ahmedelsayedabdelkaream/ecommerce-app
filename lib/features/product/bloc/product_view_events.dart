class ProductViewEvents {}

class ProductViewInitialEvent extends ProductViewEvents {
  final String productId;
  ProductViewInitialEvent(this.productId);
}

class PageViewChange extends ProductViewEvents {
  final int index;
  PageViewChange(this.index);
}

class OnDecrementQuantity extends ProductViewEvents {}

class OnIncrementQuantity extends ProductViewEvents {}

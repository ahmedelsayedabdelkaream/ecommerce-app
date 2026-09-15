abstract class FavoriteEvents {}

class IntitialFavoritesIds extends FavoriteEvents {}

class WishListInitial extends FavoriteEvents {}

class ToggleFavorites extends FavoriteEvents {
  final String productId;
  ToggleFavorites({required this.productId});
}

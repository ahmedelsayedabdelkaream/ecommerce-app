import 'package:ecommerce_app/data/repositories/favorites_repository.dart';
import 'package:ecommerce_app/data/services/storage_services.dart';
import 'package:ecommerce_app/features/favorites/bloc/favorites_events.dart';
import 'package:ecommerce_app/features/favorites/bloc/favorites_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteStates> {
  FavoritesRepository api;
  StorageServices storageServices;
  FavoriteBloc(this.api, this.storageServices) : super(FavoriteStates()) {
    on<IntitialFavoritesIds>((event, emit) async {
      try {
        final serverIds = await api.getFavoritesId();
        await storageServices.setFavorites(serverIds.toList());
        emit(state.copyWith(favoritesIds: serverIds.toSet()));
      } catch (e) {
        emit(
          state.copyWith(
            status: FavoritesStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
    on<WishListInitial>((event, emit) async {
      emit(state.copyWith(status: FavoritesStatus.loading));
      try {
        final products = await api.getFavorites();
        print("========================================== $products");
        emit(
          state.copyWith(status: FavoritesStatus.success, products: products),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: FavoritesStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
    on<ToggleFavorites>((event, emit) async {
      final current = storageServices.getFavorites();
      final wasFavorite = current.contains(event.productId);

      wasFavorite
          ? current.remove(event.productId)
          : current.add(event.productId);
      try {
        wasFavorite
            ? await api.removeFromFavorite(event.productId)
            : await api.addedToFavorite(event.productId);

        await storageServices.setFavorites(current.toList());
        emit(state.copyWith(favoritesIds: current.toSet()));
      } catch (e) {
        emit(
          state.copyWith(
            status: FavoritesStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}

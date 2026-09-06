import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_events.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  ProductRepository prodRepo;
  static HomePageBloc getInstance(BuildContext context) =>
      BlocProvider.of<HomePageBloc>(context);

  HomePageBloc(this.prodRepo)
    : super(
        HomePageStates(
          pageIndex: 0,
          categories: [],
          status: HomePageStatus.initial,
          featuredProducts: [],
        ),
      ) {
    on<OnInitial>((event, emit) async {
      emit(state.copyWith(status: HomePageStatus.loading));
      final categories = await prodRepo.getCategory();
      final featuredProducts = await prodRepo.getProducts();
      emit(
        state.copyWith(
          categories: categories,
          featuredProducts: featuredProducts,
          status: HomePageStatus.success,
        ),
      );
    });
    on<CategoriesListInitial>((event, emit) async {
      emit(state.copyWith(status: HomePageStatus.loading));
      final categories = await prodRepo.getCategory();
      emit(
        state.copyWith(categories: categories, status: HomePageStatus.success),
      );
    });
    // on<CategoriesListInitial>((event, emit) async {
    //   emit(state.copyWith(status: HomePageStatus.loading));
    //   final products = await prodRepo.getProducts();
    //   emit(
    //     state.copyWith(
    //       featuredProducts: products,
    //       status: HomePageStatus.success,
    //     ),
    //   );
    // });
    on<OnPageViewChanged>((event, emit) {
      emit(state.copyWith(pageIndex: event.index));
    });
    on<OnCategoryTapped>((event, emit) async {
      if (state.categoryIndex == event.index) return;
      emit(
        state.copyWith(
          categoryIndex: event.index,
          status: HomePageStatus.productsLoading,
        ),
      );
      final featuredProducts = await prodRepo.getProductsByCategory(event.id);
      emit(
        state.copyWith(
          featuredProducts: featuredProducts,
          status: HomePageStatus.success,
        ),
      );
    });
  }
}

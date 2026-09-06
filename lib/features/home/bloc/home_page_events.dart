class HomePageEvents {}

class OnInitial extends HomePageEvents {}

class OnPageViewChanged extends HomePageEvents {
  final int index;
  OnPageViewChanged(this.index);
}

class CategoriesListInitial extends HomePageEvents {}

class OnCategoryTapped extends HomePageEvents {
  final String id;
  final int index;
  OnCategoryTapped({required this.index, required this.id});
}

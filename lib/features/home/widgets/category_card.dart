import 'package:ecommerce_app/features/home/bloc/home_page_bloc.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_events.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_state.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  final HomePageStates state;
  const CategoryCard({super.key, required this.index, required this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<HomePageBloc>().add(
        OnCategoryTapped(index: index, id: state.categories[index].id ?? ''),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: index == state.categoryIndex
                  ? AppColors.primaryColor
                  : AppColors.backgroundFormColor.withAlpha(100),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: index == state.categoryIndex
                        ? AppColors.secondaryColor
                        : AppColors.imageColor,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      state.categories[index].image ?? '',
                      width: 30,
                      height: 30,

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  state.categories[index].name ?? '',
                  style: TextStyle(
                    color: index == state.categoryIndex
                        ? Colors.white
                        : AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

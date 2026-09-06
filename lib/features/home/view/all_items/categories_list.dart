import 'package:ecommerce_app/features/home/bloc/home_page_bloc.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_events.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_state.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(CategoriesListInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        centerTitle: true,
        title: const Text("Explore Categories"),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomePageBloc, HomePageStates>(
        builder: (context, state) {
          return state.status == HomePageStatus.loading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: GridView.builder(
                    itemCount: state.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.imageColor,
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                height: 30,
                                width: 30,
                                state.categories[index].image ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(state.categories[index].name ?? ''),
                          ],
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}

import 'package:ecommerce_app/features/home/widgets/explore_more.dart';
import 'package:ecommerce_app/features/search/bloc/search_bloc.dart';
import 'package:ecommerce_app/features/search/bloc/search_events.dart';
import 'package:ecommerce_app/features/search/bloc/search_states.dart';
import 'package:ecommerce_app/features/search/widgets/product_search.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 70,
        backgroundColor: AppColors.imageColor,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.all(15),
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
        title: Container(
          margin: EdgeInsets.only(right: 20),
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: TextFormField(
            onChanged: (value) => context.read<SearchPageBloc>().add(
              OnSearchChange(query: value),
            ),
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(top: 12),
              prefixIcon: Icon(Icons.search),
              hintText: "Search here...",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchPageBloc, SearchPageStates>(
        builder: (context, state) {
          if (state.status == SearchStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == SearchStatus.error) {
            return Center(child: Text(state.errorText!));
          }
          if (state.status == SearchStatus.success && state.result.isEmpty) {
            return Center(child: Text("No result found"));
          }
          if (state.query == "") {
            return Center();
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextRow(
                          text1: "Recent Search",
                          text2: "Clear All",
                          onPressed: () {},
                        ),
                        Wrap(
                          spacing: 8.0, // Space between bubbles
                          runSpacing: 4.0, // Space between lines
                          children: [
                            InputChip(
                              label: Text(state.query!),
                              onDeleted: () {
                                // Logic to remove single itemp
                              },
                              deleteIcon: const Icon(Icons.close, size: 16),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.grey[300]!),
                              ),
                              onPressed: () {
                                // Trigger search again
                              },
                            ),
                          ],
                        ),
                        TextRow(
                          text1: "Recently Viewed",
                          text2: "See All",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return SearchProduct();
                  },
                ),
              ),
              SliverPadding(padding: const EdgeInsets.only(bottom: 50)),
            ],
          );
        },
      ),
    );
  }
}

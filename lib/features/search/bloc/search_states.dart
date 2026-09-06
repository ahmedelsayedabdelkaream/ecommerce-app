import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

enum SearchStatus { initial, loading, success, error }

class SearchPageStates extends Equatable {
  final SearchStatus status;
  final String? query;
  final List<ProductModel> result;
  final String? errorText;
  const SearchPageStates({
    this.status = SearchStatus.initial,
    this.result = const [],
    this.query = "",
    this.errorText,
  });
  SearchPageStates copyWith({
    SearchStatus? status,
    String? query,
    List<ProductModel>? result,
    String? errorText,
  }) {
    return SearchPageStates(
      status: status ?? this.status,
      query: query ?? this.query,
      result: result ?? this.result,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object?> get props => [status, query, result, errorText];
}

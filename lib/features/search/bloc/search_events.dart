abstract class SearchPageEvents {}

class OnSearchChange extends SearchPageEvents {
  final String query;
  OnSearchChange({required this.query});
}

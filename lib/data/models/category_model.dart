class CategoryModel {
  final String? id;
  final String? name;
  final String? image;
  CategoryModel({this.id, this.name, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      image: json['imageUrl'],
    );
  }
  static Map<String, dynamic> toJson(String id, String name, String image) => {
    'id': id,
    'name': name,
    'image': image,
  };
}

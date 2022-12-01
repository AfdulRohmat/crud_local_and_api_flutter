class ProductLocalModel {
  ProductLocalModel({
    this.id,
    this.title,
    this.price,
    this.description,
  });

  int? id;
  String? title;
  double? price;
  String? description;

  factory ProductLocalModel.fromMap(Map<dynamic, dynamic> json) =>
      ProductLocalModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
      };
}

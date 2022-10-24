class ProductModel {
  String name;
  double price;
  String image;

  ProductModel({
    required this.price,
    required this.image,
    this.name = '',
  });
}

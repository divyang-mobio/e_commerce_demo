import 'dart:ui';

class ProductDetailModel {
  String name, description, imageLink;
  List<Color> productColor;
  int price;
  Color bgColor;

  ProductDetailModel(
      {required this.name,
      required this.bgColor,
      required this.description,
      required this.price,
      required this.imageLink,
      required this.productColor});
}

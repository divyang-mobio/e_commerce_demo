import 'dart:ui';

class SaveItemModel {
  String name, description, imageLink;
  Color selectedProductColors;
  int price, numberOfItem;

  SaveItemModel(
      {required this.name,
      required this.description,
      required this.imageLink,
      required this.price,
      required this.numberOfItem,
      required this.selectedProductColors});
}

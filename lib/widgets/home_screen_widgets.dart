import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../model/product_detail_model.dart';
import '../resources/resources.dart';

appbarSearchField() {
  return TextField(
      decoration: InputDecoration(
    contentPadding: const EdgeInsets.all(8),
    iconColor: Colors.grey,
    fillColor: const Color.fromARGB(255, 219, 224, 222),
    filled: true,
    hintText: 'Search for a Product',
    hintStyle: const TextStyle(color: Colors.grey),
    suffixIcon: const Icon(Icons.search, color: Colors.grey),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(15)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(15)),
  ));
}

categoryListBody(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .08,
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoryData.length,
        itemBuilder: (context, index) =>
            categoryCard(context, categoryData: categoryData[index])),
  );
}

categoryCard(context, {required CategoryModel categoryData}) {
  return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color.fromARGB(255, 235, 235, 235))),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 235, 235),
                  borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.height * .06,
              child: Image.asset(categoryData.image)),
          const SizedBox(width: 10),
          Text(categoryData.categoryType,
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: 10)
        ],
      ));
}

showMoreData({required Widget firstWidget, required Widget secondWidget}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [firstWidget, secondWidget]);
}

mainCardListView(context,
    {required List<ProductDetailModel> data, required bool isMainView}) {
  return SizedBox(
    height: isMainView
        ? MediaQuery.of(context).size.height * .40
        : MediaQuery.of(context).size.height * .45,
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => isMainView
            ? mainCardView(context, data: data[index])
            : otherCardView(context, data: data[index])),
  );
}

mainCardView(context, {required ProductDetailModel data}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/detail', arguments: data);
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * .50,
      height: MediaQuery.of(context).size.height * .45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: data.bgColor,
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * .22,
                width: MediaQuery.of(context).size.width * .50,
                child: Image.asset(data.imageLink)),
            Positioned(
              bottom: 5,
              left: 5,
              child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text('Free Shipping',
                      style: TextStyle(color: Colors.white, fontSize: 8))),
            ),
          ],
        ),
        const SizedBox(height: 10),
        showMoreData(
          firstWidget: Flexible(
            child: Text(data.name,maxLines: 2,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          secondWidget: Text('\$ ${data.price}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 5),
        Flexible(child: Text(data.description)),
      ]),
    ),
  );
}

otherCardView(context, {required ProductDetailModel data}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/detail', arguments: data);
    },
    child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * .5,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: data.bgColor,
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * .22,
                width: MediaQuery.of(context).size.width * .5,
                child: Image.asset(data.imageLink)),
            const SizedBox(height: 10),
            showMoreData(
                firstWidget: Text(data.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                secondWidget: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.favorite,
                      color: Color.fromARGB(255, 162, 166, 171)),
                )),
            const SizedBox(height: 10),
            Text(data.description,
                maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),
            showMoreData(
                firstWidget: Text('\$${data.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                secondWidget: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 57, 199, 165),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(Icons.add, color: Colors.white)),
                )),
          ],
        )),
  );
}

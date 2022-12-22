import 'package:e_commerce_demo/model/category_model.dart';
import 'package:e_commerce_demo/model/product_detail_model.dart';
import 'package:e_commerce_demo/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.white),
          title: appbarSearchField(),
          elevation: 0,
          backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            categoryListBody(context),
            const SizedBox(height: 15),
            showMoreData(title: 'Hot Sales'),
            const SizedBox(height: 15),
            mainCardListView(context, data: laptopList, isMainView: true),
            const SizedBox(height: 15),
            showMoreData(title: 'Recently Viewed'),
            mainCardListView(context, data: phoneList, isMainView: false),
          ]),
        ),
      ),
    );
  }
}

appbarSearchField() {
  return TextField(
      decoration: InputDecoration(
    iconColor: Colors.grey,
    fillColor: const Color.fromARGB(255, 219, 224, 222),
    filled: true,
    hintText: 'Search for a Product',
    hintStyle: const TextStyle(color: Colors.grey),
    suffixIcon: const Icon(Icons.search, color: Colors.grey),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.7)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.7)),
  ));
}

categoryListBody(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .10,
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
              height: MediaQuery.of(context).size.height * .09,
              width: MediaQuery.of(context).size.height * .09,
              child: Image.asset(categoryData.image)),
          const SizedBox(width: 10),
          Text(categoryData.categoryType,
              style: Theme.of(context).textTheme.headline6),
          const SizedBox(width: 10)
        ],
      ));
}

showMoreData({required String title}) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const Text(
        'See all',
        style: TextStyle(color: Color.fromARGB(255, 162, 166, 171)),
      )
    ]),
  );
}

mainCardListView(context,
    {required List<ProductDetailModel> data, required bool isMainView}) {
  return SizedBox(
    height: isMainView
        ? MediaQuery.of(context).size.height * .33
        : MediaQuery.of(context).size.height * .41,
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
  return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * .45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: data.bgColor,
                        borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.of(context).size.height * .22,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Image.asset(data.imageLink)),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text('Free Shipping',
                          style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(data.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('\$ ${data.price}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 10),
            Text(data.description,
                maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ));
}

otherCardView(context, {required ProductDetailModel data}) {
  return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * .45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: data.bgColor,
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * .22,
                width: MediaQuery.of(context).size.width * .45,
                child: Image.asset(data.imageLink)),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(data.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.favorite,
                    color: Color.fromARGB(255, 162, 166, 171)),
              )
            ]),
            const SizedBox(height: 10),
            Text(data.description,
                maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('\$${data.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 57, 199, 165),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              )
            ]),
          ],
        ),
      ));
}

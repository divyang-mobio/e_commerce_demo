import 'package:e_commerce_demo/model/product_detail_model.dart';
import 'package:flutter/material.dart';
import '../widgets/home_screen_widgets.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.productDetailModel})
      : super(key: key);

  final ProductDetailModel productDetailModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int item = 1;
  int selectedColor = 0;

  itemIncDecMethod() {
    return Row(children: [
      itemCountButton(
          onTap: () {
            if (item > 1) {
              setState(() {
                item -= 1;
              });
            }
          },
          iconData: Icons.remove,
          iconColor: const Color.fromARGB(255, 57, 199, 165),
          containerColor: Colors.white,
          containerBorderColor: const Color.fromARGB(255, 57, 199, 165)),
      const SizedBox(width: 15),
      Text(item.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      const SizedBox(width: 15),
      itemCountButton(
          onTap: () {
            setState(() {
              item += 1;
            });
          },
          iconData: Icons.add,
          iconColor: Colors.white,
          containerBorderColor: Colors.white,
          containerColor: const Color.fromARGB(255, 57, 199, 165)),
    ]);
  }

  bottomAppBar() {
    return BottomAppBar(
        color: Colors.white,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [itemIncDecMethod(), bottomAppBarButton(context)],
            ),
          ),
        ));
  }

  selectColor() {
    return Row(
        children: widget.productDetailModel.productColors
            .map((e) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor =
                            widget.productDetailModel.productColors.indexOf(e);
                      });
                    },
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor:
                          widget.productDetailModel.productColors.indexOf(e) ==
                                  selectedColor
                              ? Colors.black
                              : Colors.white,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 13, backgroundColor: e),
                      ),
                    ),
                  ),
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Details Products',
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu),
            )
          ]),
      bottomNavigationBar: bottomAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * .40,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 246, 246, 246),
            child: Image.asset(widget.productDetailModel.imageLink),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              showMoreData(
                firstWidget: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 57, 199, 165),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('Free Shipping',
                        style: TextStyle(color: Colors.white))),
                secondWidget: const Icon(Icons.favorite,
                    color: Color.fromARGB(255, 162, 166, 171)),
              ),
              const SizedBox(height: 20),
              Text(widget.productDetailModel.name,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              Text(widget.productDetailModel.description,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 148, 148, 148))),
              const SizedBox(height: 20),
              showMoreData(
                firstWidget: Text('\$${widget.productDetailModel.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25)),
                secondWidget: selectColor(),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

itemCountButton(
    {required GestureTapCallback onTap,
    required IconData iconData,
    required Color iconColor,
    required Color containerColor,
    required Color containerBorderColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          border: Border.all(color: containerBorderColor),
          color: containerColor,
          borderRadius: BorderRadius.circular(10)),
      child: Icon(iconData, color: iconColor),
    ),
  );
}

bottomAppBarButton(context) {
  return MaterialButton(
    height: 45,
    minWidth: MediaQuery.of(context).size.width * .45,
    onPressed: () {},
    color: const Color.fromARGB(255, 57, 199, 165),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color.fromARGB(255, 235, 235, 235))),
    child: const Text('Continue', style: TextStyle(color: Colors.white)),
  );
}

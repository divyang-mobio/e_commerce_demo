import '../model/save_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../resources/resources.dart';
import '../widgets/home_screen_widgets.dart';
import 'detail_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  slidableList({required SaveItemModel data, required int index}) {
    return Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
              onPressed: (c) {
                setState(() {
                  saveData.removeAt(index);
                });
              },
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFFFE4A49),
              icon: Icons.delete),
        ]),
        child: card(data: data));
  }

  card({required SaveItemModel data}) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image(imageLink: data.imageLink),
            const SizedBox(width: 10),
            textData(data: data),
            itemIncrement(data: data)
          ]),
    );
  }

  itemIncrement({required SaveItemModel data}) {
    return Row(children: [
      itemCountButton(
          height: 30,
          onTap: () {
            if (data.numberOfItem > 1) {
              setState(() {
                data.numberOfItem -= 1;
              });
            }
          },
          iconData: Icons.remove,
          iconColor: const Color.fromARGB(255, 57, 199, 165),
          containerColor: Colors.white,
          containerBorderColor: const Color.fromARGB(255, 57, 199, 165)),
      const SizedBox(width: 5),
      Text(data.numberOfItem.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      const SizedBox(width: 5),
      itemCountButton(
          height: 30,
          onTap: () {
            setState(() {
              data.numberOfItem += 1;
            });
          },
          iconData: Icons.add,
          iconColor: Colors.white,
          containerBorderColor: Colors.white,
          containerColor: const Color.fromARGB(255, 57, 199, 165)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return (saveData.isEmpty)
        ? const Center(child: Text('No Data'))
        : SingleChildScrollView(
            child: Column(children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: saveData.length,
                  itemBuilder: (context, index) =>
                      slidableList(data: saveData[index], index: index)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 15),
                      showMoreData(
                        firstWidget: const Text('Subtotal',
                            style: TextStyle(
                                color: Color.fromARGB(255, 160, 160, 160))),
                        secondWidget: Text(
                            '\$${saveData.map((e) => e.price * e.numberOfItem).fold('0', (previousValue, int element) => (int.parse(previousValue) + element).toString())}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 10),
                      showMoreData(
                          firstWidget: const Text('Delivery Fee:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 160, 160, 160))),
                          secondWidget: const Text('\$0.00',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      const SizedBox(height: 10),
                      showMoreData(
                          firstWidget: const Text('Discount:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 160, 160, 160))),
                          secondWidget: const Text('0%',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      showMoreData(
                        firstWidget: const Text('Total',
                            style: TextStyle(
                                color: Color.fromARGB(255, 160, 160, 160))),
                        secondWidget: Text(
                            '\$${saveData.map((e) => e.price * e.numberOfItem).fold('0', (previousValue, int element) => (int.parse(previousValue) + element).toString())}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 57, 199, 165))),
                      ),
                      const SizedBox(height: 15),
                      MaterialButton(
                          height: 45,
                          minWidth: MediaQuery.of(context).size.width,
                          color: const Color.fromARGB(255, 57, 199, 165),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            setState(() {
                              saveData.clear();
                            });
                          },
                          child: const Text('Continue',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))
                    ]),
              )
            ]),
          );
  }
}

image({required String imageLink}) {
  return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(10)),
      height: 100,
      width: 100,
      child: Padding(
          padding: const EdgeInsets.all(8.0), child: Image.asset(imageLink)));
}

textData({required SaveItemModel data}) {
  return Flexible(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(data.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 5),
      Text(data.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Color.fromARGB(255, 100, 100, 100))),
      const SizedBox(height: 5),
      Text('\$ ${data.price}',
          style: const TextStyle(fontWeight: FontWeight.bold)),
    ]),
  );
}

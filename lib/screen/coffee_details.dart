import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:coffee/provider/cart_provider.dart";
import "package:coffee/model/cofee_model.dart";

class CoffeeDetailScreen extends ConsumerStatefulWidget {
  const CoffeeDetailScreen({Key? key, required this.coffeeItems})
      : super(key: key);
  final CoffeeModel coffeeItems;

  @override
  ConsumerState<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends ConsumerState<CoffeeDetailScreen> {
  int selectedIndex = 0;
  int _quantity = 1;
  String _coffeeSize = "S";

  void onConatinerTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double price = double.parse(widget.coffeeItems.price) * _quantity;
    if (selectedIndex == 1) {
      price = (double.parse(widget.coffeeItems.price) * _quantity) * 1.4;
    } else if (selectedIndex == 2) {
      price = (double.parse(widget.coffeeItems.price) * _quantity) * 2;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.grey.shade100,
              Colors.brown.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "₹ $price",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 30, color: Colors.green.shade700),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.coffeeItems.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    widget.coffeeItems.imagePath,
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Q U A N T I T Y",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity = _quantity > 1 ? _quantity - 1 : 1;
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade600)),
                          child: Text(
                            "$_quantity",
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                      const SizedBox(
                        width: 3,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "S I Z E",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          onConatinerTap(0);
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              color: selectedIndex == 0
                                  ? Colors.brown
                                  : Colors.white),
                          child: Text(
                            selectedIndex == 0 ? _coffeeSize = "S" : "S",
                            style: TextStyle(
                                color: selectedIndex == 0
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          onConatinerTap(1);
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              color: selectedIndex == 1
                                  ? Colors.brown
                                  : Colors.white),
                          child: Text(
                            selectedIndex == 1 ? _coffeeSize = "M" : "M",
                            style: TextStyle(
                                color: selectedIndex == 1
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          onConatinerTap(2);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              color: selectedIndex == 2
                                  ? Colors.brown
                                  : Colors.white),
                          child: Text(
                            selectedIndex == 2 ? _coffeeSize = "L" : "L",
                            style: TextStyle(
                                color: selectedIndex == 2
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.coffeeItems.quantity = _quantity;
                          widget.coffeeItems.size = _coffeeSize;

                          ref
                              .read(cartProvider.notifier)
                              .addItems(widget.coffeeItems);
                          Navigator.of(context).pop();
                        });
                        // showDialog(
                        //   context: context,
                        //   builder: (context) => const AlertDialog(
                        //     title: Text("Successfully Added to the Cart"),
                        //     backgroundColor: Colors.brown,
                        //   ),
                        // );
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Successfully Added to the Cart"),
                          backgroundColor: Colors.grey,
                          duration: Duration(seconds: 1),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.brown,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 60)),
                      child: Text(
                        "ADD TO CART",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

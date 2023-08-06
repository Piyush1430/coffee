import "package:coffee/screen/coffee_details.dart";
import "package:flutter/material.dart";

import "package:coffee/widgets/coffee_tile.dart";
import "package:coffee/data/dummy_data.dart";

class CoffeeScreen extends StatelessWidget {
  const CoffeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "How would you like your Coffee \t",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 30)),
                WidgetSpan(
                  child: Image.asset(
                    "assets/images/coffee.png",
                    height: 30,
                    width: 30,
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: availableCoffee.length,
              itemBuilder: (context, index) {
                final coffeeItems = availableCoffee[index];
                return CoffeeTile(
                  items: coffeeItems,
                  subtitle: Text(" Price : ₹${coffeeItems.price}"),
                  iconButton: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CoffeeDetailScreen(coffeeItems: coffeeItems),
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black45,
                      )),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

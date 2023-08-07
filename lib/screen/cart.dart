import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:coffee/provider/cart_provider.dart";
import "package:coffee/widgets/coffee_tile.dart";
import "package:coffee/screen/coffee_details.dart";

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(cartProvider);
    final totalPrice = ref.watch(cartProvider.notifier).getTotalPrice();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Your Cart",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  CoffeeDetailScreen(coffeeItems: items[index]),
                            ),
                          );
                        },
                        child: CoffeeTile(
                          items: items[index],
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price : ${items[index].price}",
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text("Q:${items[index].quantity}"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("Size : ${items[index].size}")
                                ],
                              ),
                            ],
                          ),
                          iconButton: IconButton(
                            onPressed: () {
                              setState(() {
                                ref
                                    .read(cartProvider.notifier)
                                    .removeItems(items[index]);
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey.shade400,
                              size: 35,
                            ),
                          ),
                        ),
                      );
                    })),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Total Price ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text("₹ $totalPrice",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        
                      ),
                      icon: const Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                      ),
                      label: Text(
                        "PAY NOW",
                        style: Theme.of(context).textTheme.titleMedium,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

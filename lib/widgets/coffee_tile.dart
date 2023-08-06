import "package:coffee/model/cofee_model.dart";
import "package:flutter/material.dart";

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({Key? key, required this.items, required this.iconButton , required this.subtitle})
      : super(key: key);
  final CoffeeModel items;
  final IconButton iconButton;
  final Widget subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Card(
        elevation: 2,
        color: Colors.grey[100],
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: ListTile(
            leading: Image.asset(items.imagePath),
            title: Text(
              items.name,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            subtitle: subtitle,
            trailing: iconButton,
          ),
        ),
      ),
    );
  }
}

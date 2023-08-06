
import "package:coffee/screen/home.dart";
import "package:flutter/material.dart";

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey.shade200, Colors.brown.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/hot.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const  HomePage(),
                  ));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Home",
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(
                    Icons.info_sharp,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "About",
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
            const Spacer(),
            const Row(
              children: [
                Icon(Icons.exit_to_app_sharp),
                SizedBox(
                  width: 10,
                ),
                Text("Log Out")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

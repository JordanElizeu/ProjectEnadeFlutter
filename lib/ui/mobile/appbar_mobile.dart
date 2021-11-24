import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/components/drawer.dart';
import 'package:scaled_list/scaled_list.dart';

class ViewPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appBarMobile(context);
  }
}

Widget appBarMobile(BuildContext context) {
  final String _title = "Enade 2021";

  return Scaffold(
    appBar: AppBar(
      title: Row(
        children: [
          Image.asset(
            "assets/images/gov.png",
            width: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(_title),
          )
        ],
      ),
      centerTitle: true,
    ),
    drawer: drawer(context),
    body: Center(
      child: test(),
    ),
  );
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: image,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            ElevatedButton(
              child: const Text("Learn more"),
              onPressed: () => print("Button was tapped"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget test() {
  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];

  final List<Category> categories = [
    Category(image: Icons.computer, name: "ADS"),
    Category(image: Icons.cloud_done, name: "RESULTADOS"),
    Category(image: Icons.network_wifi, name: "REDES"),
  ];

  return ScaledList(
      itemCount: categories.length,
      itemColor: (index) {
        return kMixedColors[index % kMixedColors.length];
      },
      itemBuilder: (index, selectedIndex) {
        final category = categories[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: selectedIndex == index ? 100 : 80,
              child: Icon(category.image),
            ),
            SizedBox(height: 15),
            Text(
              category.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: selectedIndex == index ? 25 : 20),
            )
          ],
        );
      });
}

class Category {
  final IconData image;
  final String name;

  Category({@required this.image, @required this.name});
}

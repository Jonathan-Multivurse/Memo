import 'package:flutter/material.dart';
import 'package:ppm/widgets/home/carousel.dart';
import 'package:ppm/widgets/home/category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List images = [
    'lib/assets/images/slide1.png',
    'lib/assets/images/slide2.png',
    'lib/assets/images/slide3.png',
    'lib/assets/images/slide4.png',
  ];
  List<String> tileImages = [
    'lib/assets/images/heirlooms.png',
    'lib/assets/images/collectibles.png',
    'lib/assets/images/furniture.png',
    'lib/assets/images/jewelry.png',
    'lib/assets/images/other.png',
  ];
  List<String> title = [
    'heirlooms',
    'collectibles',
    'Furniture',
    'Jewelry',
    'Miscellaneous',
  ];
  List<String> details = [
    'Valuable objects that have belonged to a family for several generations.',
    'Items such as antiques, books, vintage toys, record albums, comic books, art, figurines, etc.',
    'Chairs, sofas, tables, and other pieces of furniture',
    'Rings, earrings, watches, and other items',
    'Any items that don\'t belong in the other categories',
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        child: Column(
          children: [
            HomeCarousel(images: images),
            CategoryTile(
                tileImages: tileImages, title: title, detials: details),
          ],
        ),
      ),
    );
  }
}

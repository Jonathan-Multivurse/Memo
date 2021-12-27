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
    'lib/assets/images/books.png',
    'lib/assets/images/furniture.png',
    'lib/assets/images/jewelry.png',
  ];
  List<String> title = [
    'heirlooms',
    'collectibles',
    'Books',
    'Furniture',
    'Jewelry'
  ];
  List<String> details = [
    'Tap here for more details',
    'Tap here for more details',
    'Tap here for more details',
    'Tap here for more details',
    'Tap here for more details',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HomeCarousel(images: images),
          CategoryTile(tileImages: tileImages, title: title, detials: details),
        ],
      ),
    );
  }
}

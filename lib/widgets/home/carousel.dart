import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeCarousel extends StatefulWidget {
  final List images;

  HomeCarousel({
    required this.images,
  });
  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    var width = device.width;
    var height = device.width;
    return Column(
      children: [
        Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Material(
                elevation: 1,
                child: Container(
                  color: Colors.white,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: height * 0.6,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: widget.images
                        .map((item) => Container(
                              child: Center(
                                  child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                height: height * 0.6
                              )),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.images.map((url) {
                      int index = widget.images.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Colors.green[500]
                                : Colors.grey[100]),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

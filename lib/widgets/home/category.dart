import 'package:flutter/material.dart';
import 'package:ppm/components/tile_model.dart';
import 'package:ppm/theme/theme.dart';

class CategoryTile extends StatefulWidget {
  final List<String> tileImages;
  final List<String> title;
  final List<String> detials;

  const CategoryTile({
    Key? key,
    required this.tileImages,
    required this.title,
    required this.detials,
  }) : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.title.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 120,
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
              padding: EdgeInsets.all(0),
              child: TileModel(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.tileImages[index],
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title[index].toUpperCase(),
                            style: theme.textTheme.headline3,
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.detials[index],
                            textAlign: TextAlign.start,
                            style: theme.textTheme.subtitle2,
                          )
                        ],
                      ),
                    )),
                  ],
                ),
                onTap: () {},
              ),
            );
          }),
    );
  }
}

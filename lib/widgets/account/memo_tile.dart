import 'package:flutter/material.dart';
import 'package:ppm/components/tile_model.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/theme/theme.dart';

class MemoTile extends StatefulWidget {
  final List<String> title;
  final List<String> type;
  final List<String> detials;
  final List<String> date;

  const MemoTile({
    Key? key,
    required this.title,
    required this.type,
    required this.detials,
    required this.date,
  }) : super(key: key);

  @override
  _MemoTileState createState() => _MemoTileState();
}

class _MemoTileState extends State<MemoTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.title.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
              padding: EdgeInsets.all(0),
              child: TileModel(
                title: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title[index].toUpperCase(),
                            style: theme.textTheme.headline3,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Type: ' + widget.type[index],
                            style: theme.textTheme.subtitle2,
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.detials[index],
                            style: theme.textTheme.subtitle2,
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.date[index],
                            style: theme.textTheme.subtitle2,
                          )
                        ],
                      )),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, MemoDetailsRoute);
                },
              ),
            );
          }),
    );
  }
}

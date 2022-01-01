import 'package:flutter/material.dart';
import 'package:ppm/components/tile_model.dart';
import 'package:ppm/theme/theme.dart';

class MemoTile extends StatefulWidget {
  final String title;
  final String type;
  final String details;
  final String date;
  final void Function()? onTap;

  const MemoTile({
    Key? key,
    required this.title,
    required this.type,
    required this.details,
    required this.date,
    required this.onTap,
  }) : super(
          key: key,
        );

  @override
  _MemoTileState createState() => _MemoTileState();
}

class _MemoTileState extends State<MemoTile> {
  @override
  Widget build(BuildContext context) {
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
                    widget.title.toUpperCase(),
                    style: theme.textTheme.headline3,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Type: ' + widget.type,
                    style: theme.textTheme.subtitle2,
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.details,
                    style: theme.textTheme.subtitle2,
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.date,
                    style: theme.textTheme.subtitle2,
                  )
                ],
              )),
            ],
          ),
        ),
        onTap: widget.onTap,
      ),
    );
  }
}

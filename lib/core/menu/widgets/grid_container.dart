import 'package:flutter/material.dart';
import 'package:food_app/core/menu/widgets/primary_text.dart';

import '../../../Utils/colors.dart';
import '../../../config/size_config/size_config.dart';

class GridContainer extends StatefulWidget {
  String name;
  String cuisine;
  String image;
  GridContainer(
      {Key? key,
      required this.name,
      required this.cuisine,
      required this.image})
      : super(key: key);

  @override
  State<GridContainer> createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  final SizeConfig _config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 300,
            child: GridTile(
                child: Card(
                  color: AppColor.LM_BACKGROUND_BASIC,
                ),
                header: SizedBox(
                    height: _config.sh(300).toDouble(),
                    child:
                        //  FittedBox(
                        //     fit: BoxFit.contain,
                        Image.network(widget.image, fit: BoxFit.cover)
                    // ),
                    ),
                footer: SizedBox(
                  height: _config.sh(70).toDouble(),
                  child: GridTileBar(
                    backgroundColor: Color.fromARGB(185, 119, 113, 113),
                    title: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(widget.cuisine,
                          style: TextStyle(fontSize: 12.0)),
                    ),
                    subtitle: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(widget.name,
                            style: TextStyle(fontSize: 12.0))),
                  ),
                )),
          )),
    );
  }

  Widget buildInfo(BuildContext context) => Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 300,
        child: Card(
            color: Colors.black12,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                        height: 50,
                        child: Image.network(widget.image, fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 30,
                    child: Text(
                      widget.cuisine,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ));
}

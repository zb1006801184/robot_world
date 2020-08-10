import 'package:robot_world/page_index.dart';
import 'package:flutter/cupertino.dart';

class SingleLinePicker extends StatelessWidget {
  Function sureOnTap;
  BuildContext superContext;
  List listData;
  SingleLinePicker({
    Key key,
    this.sureOnTap,
    this.listData,
    this.superContext,
  }) : super(key: key);
  List buildGrid(List listData) {
    List<Widget> tiles = [];
    for (var item in listData) {
      tiles.add(Center(
        child: Text(item),
      ));
    }
    return tiles;
  }

  showPickerView() {
    int index = 0;
    final picker = CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (position) {
        index = position;
      },
      children: buildGrid(listData),
      backgroundColor: Colors.white,
    );
    showCupertinoModalPopup(
        context: superContext,
        builder: (cxt) {
          return Container(
            height: 230,
            child: Column(
              children: <Widget>[
                Container(
                  height: 30,
                  width: Global.ksWidth,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          "取消",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(superContext).pop();
                        },
                      ),
                      GestureDetector(
                        child: Text(
                          "确定",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(superContext).pop();
                          sureOnTap(listData[index]);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(child: picker),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

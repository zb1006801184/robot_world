//选择视图
import 'package:robot_world/page_index.dart';

class SelectMuchView extends StatefulWidget {
  @override
  String title;
  List itemList;
  List selectItemList;
  SelectMuchView({
    this.itemList,
    this.title,
    this.selectItemList,
    Key key,
  }) : super(key: key);

  _SelectMuchViewState createState() => _SelectMuchViewState();
}

class _SelectMuchViewState extends State<SelectMuchView> {
  String title;
  List itemList;
  List selectItemList;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    itemList = widget.itemList;
    selectItemList = widget.selectItemList;
  }
  
  //判断是否被选中
  bool _clickData(String item) {
    List temList = [];
    for (var item1 in selectItemList) {
      if (item1 == item) {
        temList.add(item1);
      }
    }
    if (temList.length > 0) {
      return true;
    } else {
      return false;
    }

  }

  //循环创建
  List buildGrid(List listData) {
    List<Widget> tiles = [];
    for (var item in listData) {
      String imageStr;      
      if (_clickData(item) == true) {
        imageStr = "images/list_icon_selected.png";
      } else {
        imageStr = "images/list_icon_select.png";
      }
      tiles.add(
        GestureDetector(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 18,
                    height: 18,
                    margin: EdgeInsets.only(left: 11),
                    child: Image(
                      image: AssetImage(imageStr),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 11),
                    child: Text(item),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            List temList = selectItemList;
            if (_clickData(item) == true) {
              temList.remove(item);
            } else {
              temList.add(item);
            }
            setState(() {
              selectItemList = temList;
            });
          },
        ),
      );
    }
    return tiles;
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Global.BGCOLOR,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            // color: Colors.white,
            margin: EdgeInsets.only(top: 12),
            child: Column(children: buildGrid(itemList)),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ],
      ),
      
    );
  }
}

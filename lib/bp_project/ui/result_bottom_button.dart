import 'package:robot_world/page_index.dart';

class ResultBottomButton extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;

  final VoidCallback leftOnTop;
  final VoidCallback rightOnTop;

  ResultBottomButton(
    this.leftTitle,
    this.rightTitle,
    this.leftOnTop,
    this.rightOnTop, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Global.ksWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 48,
            width: 166,
            margin: EdgeInsets.only(left: 16, bottom: 12),
            child: FlatButton(
              color: Color(0xFFF4F5F7),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text(
                leftTitle,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F3ABB)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              onPressed: leftOnTop,
            ),
          ),
          Container(
            height: 48,
            width: 166,
            margin: EdgeInsets.only(right: 16, bottom: 12),
            child: FlatButton(
              color: Color(0xFF1F3ABB),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text(
                rightTitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              onPressed: rightOnTop,
            ),
          ),
        ],
      ),
    );
  }
}

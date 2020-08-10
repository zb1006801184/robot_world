import 'package:robot_world/page_index.dart';

class CommitBottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTop;

  CommitBottomButton(
    this.title,
    this.onTop, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Global.ksWidth,
      height: 88,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: Global.ksWidth - 32,
            height: 48,
            color: const Color(0xFFF4F5F7),
            child: FlatButton(
              color: Color(0xFF1F3ABB),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              onPressed: onTop,
            ),
          )
        ],
      ),
    );
  }
}

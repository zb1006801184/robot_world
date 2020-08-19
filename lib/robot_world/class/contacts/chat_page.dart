import '../../../page_index.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: 3,
          itemExtent: 73,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                child: Row(
                  children: [
                    _buildHeadIcon(index),
                    _buildMessageContent(index),
                  ],
                ),
              ),
              onTap: () {
                print("object");
              },
            );
          }),
    );
  }

  //头像
  Widget _buildHeadIcon([int index]) {
    return Container(
      width: 70,
      height: 73,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17, top: 20),
            child: Image(
              image: AssetImage("images/nav_icon_me.png"),
              height: 53,
              width: 53,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: 15,
              right: 0,
              child: Container(
                width: 25,
                height: 17,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6951),
                  borderRadius: BorderRadius.all(Radius.circular(8.5)),
                ),
                child: Center(
                  child: Text("3",style: TextStyle(fontSize: 11,color: Colors.white),),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildMessageContent([int index]) {
    return Expanded(
        child: Column(
      children: [
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 14),
                  child: Text(
                    "A小白白",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 17),
                  child: Text(
                    "18:00",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF999999)),
                  ),
                )
              ],
            ),
          ),
          flex: 44,
        ),
        Expanded(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 14),
                  child: Text(
                    "微风吹起，青草摇摆，羊儿咩咩叫",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF999999)),
                  ),
                )
              ],
            ),
          ),
          flex: 29,
        ),
      ],
    ));
  }
}

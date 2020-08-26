import '../../../page_index.dart';

class BusinessCardDetailPage extends StatefulWidget {
  @override
  _BusinessCardDetailPageState createState() => _BusinessCardDetailPageState();
}

class _BusinessCardDetailPageState extends State<BusinessCardDetailPage> {
  List dataList = [
    "请问你叫什么名字？",
    "我叫小白白我叫小白白我叫小白白我叫小白白",
    "http://.ditingai.cn%E5%B9%B3%E8%A%8C%E4%BA%BA%E5%89%8D%E5%8F%B0UI%E8%AE%BEE8%AE%A1%E5%9B%BEE6"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.65),
      body: Column(
        children: [
          _buildTopBlank(context),
          _buildListView(),
        ],
      ),
    );
  }

  //空白区域
  Widget _buildTopBlank(BuildContext context) {
    return InkWell(
      child: Container(
        height: 160,
        width: Global.ksWidth,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }

  //列表视图
  Widget _buildListView() {
    return Container(
      height: Global.ksHeight - 160,
      width: Global.ksWidth,
      color: Color(0xFFF6F6F6),
      child: Column(
        children: [
          Container(
            width: Global.ksWidth,
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Center(
              child: Image(
                image: AssetImage("images/robots_namecard_icon_down.png"),
                height: 30,
                width: 30,
              ),
            ),
          ),
          Container(
            height: 1,
            color: Color(0xFFe3e3e3),
            margin: EdgeInsets.only(left: 16, right: 16),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _buildItemWidget(context, index);
                  }))
        ],
      ),
    );
  }

  //item
  Widget _buildItemWidget(BuildContext context, int index) {
    return Row(
      mainAxisAlignment:
          index == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: 16, right: 16, top: index == 0 ? 0 : 16),
          constraints: BoxConstraints(
            maxWidth: 234.0,
            minWidth: 0.0,
          ),
          padding: EdgeInsets.only(left: 12, right: 12, top: 14, bottom: 14),
          decoration: BoxDecoration(
              color: index == 0 ? Global.MAINSTYLECOLOR : Colors.white,
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Text(
              dataList[index],
              style: TextStyle(
                  fontSize: 16,
                  color: index == 0 ? Colors.white : Colors.black),
            ),
          ),
        )
      ],
    );
  }
}

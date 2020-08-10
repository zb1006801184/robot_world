//封面结果页
import 'package:robot_world/bp_project/models/form_data_model.dart';
import 'package:robot_world/page_index.dart';

class TitlePageResult extends StatelessWidget {
  FormDataModel _data;
  @override
  Widget build(BuildContext context) {
    FormDataModel model = ModalRoute.of(context).settings.arguments;
    _data = model;
    return Scaffold(
      body: Container(
        height: Global.ksHeight,
        width: Global.ksWidth,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/bg_pic_top.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Scrollbar(
                    child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 16,
                        top:
                            Global.ksToolbarHeight + Global.ksStateHeight + 16),
                    child: Text(
                      model.projectName,
                      style: TextStyle(
                          color: Color(0xFF1F3ABB),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32, left: 16, right: 16),
                    child: Text(
                      model.projectDescribe,
                      style: TextStyle(
                          color: Color(0xFF2A2A2A),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(top: 32, left: 16, right: 16),
                    color: Color(0xFFE4E4E4),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                width: 8,
                                height: 8,
                                decoration: new BoxDecoration(
                                  color: Global.BUTTONBGCOLOR,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Text("项目所属行业：${model.industry}"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                width: 8,
                                height: 8,
                                decoration: new BoxDecoration(
                                  color: Global.BUTTONBGCOLOR,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Text("项目类别：${model.projectType}"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                width: 8,
                                height: 8,
                                decoration: new BoxDecoration(
                                  color: Global.BUTTONBGCOLOR,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Text("项目团队所在城市：${model.projectCity}"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(top: 32, left: 16, right: 16),
                    color: Color(0xFFE4E4E4),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 31.5),
                          child: Text("汇报人：${model.username}",
                              style: TextStyle(fontSize: 16)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Text("公司名称：${model.companyName}",
                              style: TextStyle(fontSize: 16)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Text("日期：${model.reportTime}",
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))),
            Positioned(
              bottom: 0,
              child: Container(
                width: Global.ksWidth,
                child: ResultBottomButton("修改", "下一页", () {
                  _editData(context);
                }, () {
                  Navigator.of(context).pushNamed("/PlainDesPage");
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  //修改
  _editData(context) {
    Navigator.of(context).pushNamed("/TitlePage", arguments: _data);
  }
}

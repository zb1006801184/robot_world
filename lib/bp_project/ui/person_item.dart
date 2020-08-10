import 'package:robot_world/bp_project/models/form_data_model.dart';
import 'package:robot_world/bp_project/models/from_list_model.dart';
import 'package:flutter/material.dart';

//个人中心cell
class PersonItem extends StatelessWidget {
final List<FormListModel> data;
final int index;
final VoidCallback onTop;

PersonItem(
    this.data, 
    this.index,
    this.onTop,
    {
    Key key,
  }) : super(key: key);

@override
  Widget build(BuildContext context) {
    FormListModel model = data[index];
    String timeStr = model.createdTime ==null? "" : model.createdTime.substring(0,10);
    return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                      height: 112,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(left: 12, top: 16, right: 12),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "项目号 " + model.bpNum,
                                      style: TextStyle(
                                          color: Color(0xff2A2A2A),
                                          fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "新消息（1）",
                                      style: TextStyle(
                                          color: Color(0xFFFF505D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Text(
                              "项目名称：" + model.projectName,
                              style: TextStyle(
                                  color: Color(0xff2A2A2A), fontSize: 16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12, bottom: 16),
                            child: Text(
                              "提交时间 " + timeStr,
                              style: TextStyle(
                                  color: Color(0xff2A2A2A), fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: onTop,
                  );
  }

}
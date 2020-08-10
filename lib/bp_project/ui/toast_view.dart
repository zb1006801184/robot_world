import 'package:robot_world/page_index.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';

class ToastView extends StatelessWidget {
  String title;
  ToastView({
    Key key,
    this.title,
  }) : super(key: key);
  showMessage() {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0,
        webBgColor: "linear-gradient(to right, #2A2A2A, #2A2A2A)",
        webPosition: "center");
  }

  showAccomplish(BuildContext context) {
    showDialog(
      // barrierColor:Color(0xFF),
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            width: 295,
            height: 388,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24),
                  width: 184,
                  height: 96,
                  child: Image(image: AssetImage("images/me_pic_success.png")),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Text(
                    "提交成功",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2A2A2A),
                        decoration: TextDecoration.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 21, left: 32, right: 32),
                  child: Text(
                    "您的在线BP已经提交，XX实验室评审委员会将认真审议您的项目介绍与融资计划，请关注BP变化，评审委员会疑问在您BP每一页进行语音留言，您也可以通过语音进行解答。",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2A2A2A),
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 24),
                          width: 240,
                          height: 48,
                          decoration: new BoxDecoration(
                            color: Color(0xFF1F3ABB),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: Center(
                            child: Text(
                              "我知道了",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none),
                            ),
                          )),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  showLoading(BuildContext context) {
    showDialog(
      barrierColor: Color(0xFF),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: Loading(
              indicator: BallSpinFadeLoaderIndicator(),
              size: 50.0,
              color: Colors.black),
        );
      },
    );
  }

  dismissLoading(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

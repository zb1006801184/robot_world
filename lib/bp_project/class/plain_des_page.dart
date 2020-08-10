//痛点描述
import 'package:robot_world/page_index.dart';

class PlainDesPage extends StatefulWidget {
  @override
  _PlainDesPageState createState() => _PlainDesPageState();
}

class _PlainDesPageState extends State<PlainDesPage> {
  final controllerPainDescribe = TextEditingController();
  final controllePainOtherScheme = TextEditingController();
  final controllerPainProjectSchemeDescribe = TextEditingController();
  SelectMuchView selectCell = SelectMuchView(
    title: "您的项目用什么方法解决这个痛点（多选）",
    itemList: [
      "新技术",
      "新模式",
    ],
    selectItemList: [],
  );
  @override
  Widget build(BuildContext context) {
    FormDataModel model = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "痛点解决描述",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: Text(''),
        backgroundColor: Color(0xFFf4f5f7),
        elevation: 0, //阴影辐射范围
        brightness: Brightness.light,
      ),
      body: GestureDetector(
        child: ListView(
          children: <Widget>[
            MuchLineInput(
              titles: "关于项目解决了什么痛点",
              placeholderTitle: "请描述这个痛点",
              controller: controllerPainDescribe,
            ),
            MuchLineInput(
              titles: "",
              placeholderTitle: "当前社会解决这个痛点的方法",
              controller: controllePainOtherScheme,
            ),
            selectCell,
            MuchLineInput(
              titles: "",
              placeholderTitle: "请简单描述即可，后面页面有关于技术与模、\n式的详细内容填写页面。",
              controller: controllerPainProjectSchemeDescribe,
            ),
            CommitBottomButton("提交", () {
              if (!_checkParam()) {
                return;
              }
              _commitResult();
            }),
          ],
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }

  bool _checkParam() {
    if (controllerPainDescribe.text.length < 1) {
      ToastView(
        title: "请输入痛点描述！",
      ).showMessage();
      return false;
    }
    if (controllePainOtherScheme.text.length < 1) {
      ToastView(
        title: "请输入社会解决办法！",
      ).showMessage();
      return false;
    }
    if (selectCell.selectItemList.length < 1) {
      ToastView(
        title: "请选择解决办法！",
      ).showMessage();
      return false;
    }
    if (controllerPainProjectSchemeDescribe.text.length < 1) {
      ToastView(
        title: "请输入你的解决办法的描述！",
      ).showMessage();
      return false;
    }
    return true;
  }

  _commitResult() async {
    Map<String, dynamic> params = {};
    params["pageNo"] = "2";
    params["skinBackground"] = "0";
    params["id"] = Global.fromModel==null?"13":Global.fromModel.id;
    params["painDescribe"] = controllerPainDescribe.text;
    params["painOtherScheme"] = controllePainOtherScheme.text;
    params["painProjectScheme"] = selectCell.selectItemList;
    params["painProjectSchemeDescribe"] =
        controllerPainProjectSchemeDescribe.text;
    FormDataModel model = await ApiService.subCommitAllFromData(params);
    Navigator.of(context).pushNamed("/ResultPage",
        arguments: ConfigData().configResult(model, "痛点解决描述"));
  }
}

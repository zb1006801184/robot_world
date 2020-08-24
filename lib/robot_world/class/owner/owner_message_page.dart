import '../../../page_index.dart';

class OwnerMessagePage extends StatefulWidget {
  @override
  _OwnerMessagePageState createState() => _OwnerMessagePageState();
}

class _OwnerMessagePageState extends State<OwnerMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarBase().configAppBarRobot("编辑资料", context),
    );
  }
}
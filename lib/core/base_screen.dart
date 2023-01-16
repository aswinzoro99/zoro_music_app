import 'package:flutter/cupertino.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseState<Page extends BaseScreen> extends State<Page> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    onPause();
    super.dispose();
  }


  void onResume() {}

  void onPause() {}
}

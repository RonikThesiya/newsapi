import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsNews extends StatefulWidget {
  const DetailsNews({Key? key}) : super(key: key);

  @override
  State<DetailsNews> createState() => _DetailsNewsState();
}

class _DetailsNewsState extends State<DetailsNews> {




  @override
  Widget build(BuildContext context) {

    dynamic getdata = ModalRoute.of(context)!.settings.arguments;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Daily 24/7 News"),
      ),
      body: WebView(
        initialUrl: "${getdata}",
      )
    ));
  }
}

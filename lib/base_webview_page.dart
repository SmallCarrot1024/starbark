import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebViewPage extends StatefulWidget {
  final Map arguments;

  BaseWebViewPage({Key key, this.arguments}) : super(key: key);

  @override
  _BaseWebViewPageState createState() =>
      _BaseWebViewPageState(arguments: this.arguments);
}

class _BaseWebViewPageState extends State<BaseWebViewPage> {
  Map arguments;

  _BaseWebViewPageState({this.arguments});

  WebViewController _controller;
  String _title = "星巴克";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            _controller.canGoBack().then((value) {
              if (value) {
                _controller.goBack(); //返回上一层
              } else {
                return Navigator.pop(context); //返回上一页
              }
            });
          },
        ),
        title: Text(_title),
      ),
      body: Container(
          child: WebView(
        initialUrl: "${arguments["h5"]}",
        //JS执行模式 是否允许JS执行
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onPageFinished: (url) {
          _controller.evaluateJavascript("document.title").then((result) {
            setState(() {
              _title = result;
            });
          });
        },
      )),
    );
  }
}

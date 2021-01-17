import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview extends StatefulWidget {
  final String url;
  webview({this.url});
  @override
  _webviewState createState() => _webviewState();
}

class _webviewState extends State<webview> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  int _stackToView = 0;
  @override
  void initState() {
    // TODO: implement initState
    _stackToView = 1;
    super.initState();
  }

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewApp"),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _stackToView,
        children: [
          Column(
            children: <Widget>[
              Expanded(
                  child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.url,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                onPageFinished: _handleLoad,
              )),
            ],
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

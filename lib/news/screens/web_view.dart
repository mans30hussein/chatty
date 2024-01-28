import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViews extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViews> {

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  int _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.volume_up, color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }),
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        body: IndexedStack(
          index: _stackToView,
          children: [
            Column(
              children: <Widget>[
                Expanded(
                    child: WebViews(

                 // initialUrl: "https://www.google.co.in/",
                  
                )),
              ],
            ),
            Container(
              child: Center(child: CircularProgressIndicator(),)
            ),
          ],
        ));
  }
}
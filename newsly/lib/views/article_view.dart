import 'dart:async';


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';




class ArticleView extends StatefulWidget {
  // const ArticleView({super.key});
  final String blogUrl;
  const ArticleView({required this.blogUrl});


  @override
  _ArticleViewState createState() => _ArticleViewState();

}

class _ArticleViewState extends State<ArticleView> {
  //
  final Completer<WebViewController> _completer =
  Completer<WebViewController>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Text("Your" ,style:TextStyle(
                color: Colors.black
            ) ),
            Text("NEWSLY",style: TextStyle(
                color: Colors.blue
            ),)
          ],
        ),
        actions:<Widget> [
          Opacity(
            opacity: 0,
            child: Container(
                padding:EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body:  Container(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child: WebView(


         initialUrl:widget.blogUrl,
          onWebViewCreated:((WebViewController webViewController){
            _completer.complete(webViewController);
          }



        // controller:controller,


        ),

      ),
      )
    );
  }

  // WebView({required String initialUrl, required Function(WebViewController webViewController) onWebViewCreated}) {}
}



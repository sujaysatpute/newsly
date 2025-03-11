import 'dart:convert';

import 'package:newsly/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news =[];
  Future<void> getNews() async{
    String urlString ="https://newsapi.org/v2/everything?q=tesla&from=2024-07-21&sortBy=publishedAt&apiKey=61a50132296b4ee6ac1998e9606d469c";

    // var response = await http.get(url);
    // Uri response = Uri.parse(url);

    // String urlString = "https://example.com";
    Uri url = Uri.parse(urlString);
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null &&  element['description']!=null &&  element['author']!=null &&  element['content']!=null ){
          ArticleModel articleModel =ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content:element["content"]
          );
          news.add(articleModel);
        }

      });

    }


  }



}


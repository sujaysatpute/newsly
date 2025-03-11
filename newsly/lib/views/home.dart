import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsly/helper/data.dart';
import 'package:newsly/models/article_model.dart';
import 'package:newsly/models/category_model.dart';
import 'package:newsly/views/article_view.dart';


import '../helper/news.dart';
    
    class Home extends StatefulWidget {
      const Home({super.key});
    
      @override
      State<Home> createState() => _HomeState();
    }
    
    class _HomeState extends State<Home> {

      // List<CategoryModel> categories = new List<CategoryModel>();
      List<CategoryModel> categories = [];
      // List<ArticleModel> articles =new List<ArticleModel>();
      List<ArticleModel> articles =[];
      bool _loading = true;

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories=getCategories();
    getNews();
  }
  getNews() async{
        News newsClass=News();
        await newsClass.getNews();
        articles=newsClass.news;
        setState(() {
          _loading=false;

        });
  }


      @override
      Widget build(BuildContext context) {
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
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
            centerTitle: true,
            elevation: 0.0,
          ),
          body: _loading ?  Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          ) :SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget> [

                  ///Categories
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 70,
                    child: ListView.builder(
                      itemCount: categories.length,
                        shrinkWrap:true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                        return CategoryTile(
                         imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,
                        );
                        }) ,

                  ),
                  ///blogs
                  Container(
                    padding: EdgeInsets.only(top:16),
                    child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        // scrollDirection: Axis.vertical,
                        itemBuilder:(context,index){
                          return BlogTile(
                            imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                            url:articles[index].url,
                          );
                          
                        }),

                  )
                ],
              ) ,
            ),
          ),
        );
      }
    }
    
    class CategoryTile extends StatelessWidget {
      // const CategoryTile({super.key});

      final imageUrl,categoryName;
      CategoryTile ({/*super.key,*/ this.imageUrl,this.categoryName});

      @override
      Widget build(BuildContext context) {
        return  GestureDetector(
          onTap: (){


          },
          child: Container(
            margin:EdgeInsets.only(right: 16) ,
            child: Stack(
              children:<Widget> [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(imageUrl: imageUrl,width: 120,height: 60,fit: BoxFit.cover,)
                ),
                Container(
                  alignment: Alignment.center,
                  width: 120,height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    color:Colors.black26,
                  ),

                  child: Text(categoryName, style: TextStyle(
                   color: Colors.white,
                       fontSize: 15,
                    fontWeight: FontWeight.w700
                  ),),

                )


              ],
            ),

          ),
        );
      }
    }

    class BlogTile  extends StatelessWidget {
      // const ({super.key});
       final String imageUrl ,title,desc,url;
       BlogTile ({required this.imageUrl, required this.title, required this.desc,required this.url});

       @override
      Widget build(BuildContext context) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ArticleView(
                  blogUrl:url,

                )
            ));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Column(
              children:<Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network(imageUrl)),
                SizedBox(height: 8,),
                Text(title,style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 8,),
                Text(desc,style: TextStyle(
                  color: Colors.black54
                ),)
              ],

            ),

          ),
        );
      }
    }
    
    
    

    
    
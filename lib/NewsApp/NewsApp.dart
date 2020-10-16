



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:start/NewsApp/JsonFile/Network.dart';
import 'JsonFile/Json.dart';
import 'additionalFiles/FutureBuilderWidget.dart';


class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  Future<News>datai;
  int value=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datai= new Network("http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f6044640d16f4b69a3332b7fed961f72").getData();
  }
  @override
  Widget build(BuildContext context) 
  { 
    
        return Scaffold(
        appBar: AppBar(
        title: Text("NewsApp",style: TextStyle(color: Colors.white,fontStyle: FontStyle.normal,fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade400,
        ),
        bottomNavigationBar: BottomNavigationBar(elevation: 10
         ,items: [
         
         BottomNavigationBarItem(icon: Icon(Icons.military_tech),label: " Technology"
         ),
         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"
         ),
         BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.appStore),label: "Apple")
       ],
       onTap: (int i){
        
            value=i;
           setState(() {
             if(i==0)
             datai= Network("http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6044640d16f4b69a3332b7fed961f72").getData();
            else if(i==1)
             datai=Network("http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f6044640d16f4b69a3332b7fed961f72").getData();
            else
             datai= Network("http://newsapi.org/v2/everything?q=apple&from=2020-10-14&to=2020-10-14&sortBy=popularity&apiKey=f6044640d16f4b69a3332b7fed961f72").getData();
           });
         
         
       },
       )
       ,
      body:Center(child: app(datai),),
       floatingActionButton:FloatingActionButton(onPressed:(){
         setState(() {
             if(value==1)
             datai=Network("http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f6044640d16f4b69a3332b7fed961f72").getData();
             else if(value==0)
             datai=Network("http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6044640d16f4b69a3332b7fed961f72").getData();
             else 
             datai= Network("http://newsapi.org/v2/everything?q=apple&from=2020-10-14&to=2020-10-14&sortBy=popularity&apiKey=f6044640d16f4b69a3332b7fed961f72").getData();
         });
       
       },
       child: Icon(Icons.refresh_rounded),
       ) ,
        
       ) ;                      
        }
}
      







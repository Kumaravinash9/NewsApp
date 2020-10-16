import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start/NewsApp/JsonFile/Json.dart';

class NewsDetails extends StatelessWidget {
                 Articles news;

                  NewsDetails({Key key, this.news}) : super(key: key);

                   @override
                   Widget build(BuildContext context) {
                     return Scaffold(
                        
                        appBar: AppBar(
                          title:Text("NewsApp"),
                          centerTitle: true,
                        ),
                        body: Padding(
                        padding: EdgeInsets.all(4),
                        child:ListView(
                          scrollDirection:Axis.vertical ,
                          children:<Widget> [
                          Container(
                          margin: EdgeInsets.all(8),
                          height: 280,
                          decoration: BoxDecoration(
                            image:DecorationImage(image: NetworkImage(
                              news.urlToImage.toString()
                            ),fit: BoxFit.cover
                          
                          ),
                        borderRadius: BorderRadius.circular(5),
                        border:Border.all(width:1,color:Colors.black12.withOpacity(.2))
                        
                          )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget> [
                                Text(news.title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800)),
                                SizedBox(height:10),
                                Text(news.content.toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black12.withOpacity(.8)),),
                                SizedBox(height:10),
                                Text(news.description.toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black12.withOpacity(.8))),
                                SizedBox(height:10),
                                Text(news.content.toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black12.withOpacity(.8))),
                              ],
                            ),
                          ),
                          ],
                        ), ),  
                     );
                   }
                 }
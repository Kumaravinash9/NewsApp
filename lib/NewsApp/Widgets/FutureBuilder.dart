import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start/NewsApp/Jsons/Json.dart';
import 'ListView.dart';

Widget app(Future<News>data)
        {
         return FutureBuilder(future: data,
        builder: (context,AsyncSnapshot<News>snapshot){
        if(snapshot.hasData)
        return ListView.builder(itemCount: snapshot.data.articles.length,
        itemBuilder: (context,index){
        return content(snapshot.data.articles[index],context);
        });
          
        return CircularProgressIndicator();
        });
        } 
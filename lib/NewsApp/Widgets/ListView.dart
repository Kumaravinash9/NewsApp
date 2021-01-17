import 'dart:async';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:start/NewsApp/Jsons/Json.dart';
import 'package:start/NewsApp/Screens/WebView.dart';
import 'package:webview_flutter/webview_flutter.dart';


Widget content(Articles articl, BuildContext context) {
  if (articl.description != null) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
            elevation: 3,
            child: Container(
                margin: EdgeInsets.all(6),
                child: Flexible(
                    child: InkWell(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          articl.urlToImage.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: Colors.white10)),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    articl.source.name.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(DateFormat('h:mm a').format(
                                      DateFormat("yyyy-MM-dd hh:mm:ss").parse(
                                          articl.publishedAt.substring(0, 10) +
                                              " " +
                                              articl.publishedAt
                                                  .substring(12)))),
                                ],
                              ),
                              Text(
                                articl.description.toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(.8)),
                              ),
                            ]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      webview(url: articl.url)));
                        })))));
  }

  return SizedBox(width: 1);
}




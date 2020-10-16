import 'dart:convert';
import 'package:http/http.dart';
import 'Json.dart';

class Network
{
  
 String url;
Network(this.url);
Future<News> getData() async{

Response  response = await get(Uri.encodeFull(url));
if(response.statusCode==200)
{
 
return News.fromJson(json.decode(response.body));
}
else
throw Exception("It's not working");

}

}
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    var title = "Web Img";

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title:Text(title),
          ),
          body: Image.network('https://picsum.photp/250?image=9')
      ),
    );

  }
}
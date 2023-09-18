import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Flutter layout demo',
      home:Scaffold(
        appBar: AppBar(

          title: const Text('Flutter layout demo'),
        ),
        body: Center(child: buildExpandedImagesWithFlex()),
      ),
    );
  }

  Widget buildOverflowingRow()=>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/pic1.jpg'),
          Image.asset('images/pic2.jpg'),
          Image.asset('images/pic3.jpg'),
        ],
      );

  Widget buildExpandedImages()=>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Expanded(child: Image.asset('images/pic1.jpg'),),
          Expanded(child: Image.asset('images/pic2.jpg'),),
          Expanded(child: Image.asset('images/pic3.jpg'),),

        ],
      );

  Widget buildExpandedImagesWithFlex() =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Expanded(child: Image.asset('images/pic1.jpg'),),
          Expanded(
            flex: 2,
            child: Image.asset('images/pic2.jpg'),),
          Expanded(

            child: Image.asset('images/pic3.jpg'),),
        ],
      );
}
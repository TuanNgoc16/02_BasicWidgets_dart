
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

//Define a custom Form widget

class MyCustomForm extends StatefulWidget{
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();


}
//define a correspoding State class
//This class holds data related to the Form
class _MyCustomFormState extends State<MyCustomForm>{

  // create controller
  // of the TextField

  final myController = TextEditingController();

  @override
  void initState(){
    super.initState();

    // start listening to changes
    myController.addListener(_printLatestValue);
  }
  @override
  void dispose(){
    // clean upp the controller when the widget is removed
    // this also removes the _printLatestValue listener.

    myController.dispose();
    super.dispose();
  }

  void _printLatestValue(){
    final text = myController.text;
    pragma('Second text field: $text (${text.characters.length})');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        title:  const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16),
        child: Column(
          children:  [
            TextField(
              onChanged: (text){
                print('First text field : $text(${text.characters.length})');
              },
            ),
            TextField(
              controller:  myController,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext buildContext){
    return const MaterialApp(
      title: 'Text Field Focus',
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

class _MyCustomFormState extends State<MyCustomForm>{
  //define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method , and clean it up tin the dispose method
  late FocusNode myFocusNode;

  @override
  void initState(){
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose(){

    myFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        title:  const Text('Text field focus'),

      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            //the first text field is focused on as soon as the app starts

            const TextField(
              autofocus: true,
            ),

            //the second text field is focused on when a user taps the
            // floatingActionButton
            TextField(
              focusNode: myFocusNode,
            ),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        // when the button is pressed
        // give focus to the text field using myFocusNode
        onPressed: () => myFocusNode.requestFocus(),
        tooltip: 'Focus Second Text Field',
        child: const Icon(Icons.edit),
      ),
    );
  }
}
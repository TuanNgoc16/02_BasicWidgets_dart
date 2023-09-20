
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

class MyCustomForm extends StatefulWidget{
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

//Define a corresponding State class
//this clas holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm>{

  //create a text controller and use it
  //of the TextField

  final myController = TextEditingController();

  @override
  void dispose(){
    //clean up the controller when the widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: myController,
        ),
      ),

      floatingActionButton: FloatingActionButton(

        // when the user presses the button , show an alert dialog
        // the text that the user has entered into the text field
        onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              //Retrieve the text that user has entered by using
              // TextEditing Controller
              content: Text(myController.text),
            );
          },

          );
        },
        tooltip: 'Show me the value!',
        child:  const Icon(Icons.text_fields),
      ),
    );
  }
}
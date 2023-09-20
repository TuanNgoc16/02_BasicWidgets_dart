import 'package:flutter/material.dart';

void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

//create a form widget
class MyCustomForm extends StatefulWidget{
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState(){
    return MyCustomFormState();
  }
}

//create a corresponding State class
//This class holds date related to the form
class MyCustomFormState extends State<MyCustomForm>{
  // create a global key that uniquely identifies the Form widget
  // and allows validation of the form

  //Note : This is a GlobalKey<FormState>
  //not a GlobalKey<MyCustomFormState>
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    //build a form widget using the _formKey create above

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            //The validator receives the text that the user has entered
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: (){
                //validate returns true if the form is valid , or false otherwise
                if(_formKey.currentState!.validate()){
                  //if the form is valid display a snackbar. in the real word
                  // you'd often call a server or save the information in a datatbase
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Date')),
                  );
                }
              },
              child: const Text('Submit'),
            ),

          )
        ],
      ),
    );
  }
}
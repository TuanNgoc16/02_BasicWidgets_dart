import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login Form',
      home: MyLoginForm(),
    );
  }
}

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({Key? key});

  @override
  _MyLoginFormState createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late FocusNode _passwordFocusNode;
  String? _errorText; // Error text for displaying errors

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordFocusNode = FocusNode();
    _errorText = null;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorText = 'Please enter both username and password.';
      });
      return;
    }

    // Perform login logic here
    // For demonstration, we'll assume a successful login
    // and reset the error text
    setState(() {
      _errorText = null;
    });

    // Print the values for demonstration purposes
    print('Username: $username, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                errorText: null, // Clear error text when text is entered
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _errorText, // Display error text if present
              ),
              obscureText: true,
              onSubmitted: (_) {
                _submitForm();
              },
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

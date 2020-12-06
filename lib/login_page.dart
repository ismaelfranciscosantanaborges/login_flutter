import 'package:flutter/material.dart';
import 'package:login_flutter/constants.dart';
import 'package:login_flutter/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 150),
              Text(
                'Login',
                style: kStyleTitle1,
                textAlign: TextAlign.center,
              ),
              _buildTextField(
                controller: _emailController,
                hintText: 'maria@gmail.com',
                labelText: 'Email',
              ),
              _buildTextField(
                  controller: _passwordController,
                  hintText: '* * * * * * * * * *',
                  labelText: 'Password',
                  obscureText: true),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 15),
                onPressed: () {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Failed to authenticate'),
                        content: Text('Incorrect email or password'),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ok'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                color: Colors.blue,
                elevation: 0,
                child: Text(
                  'Log in',
                  style: kStyleTitle2.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {TextEditingController controller,
      String hintText,
      String labelText,
      bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText ?? '',
          labelText: labelText ?? '',
        ),
      ),
    );
  }
}

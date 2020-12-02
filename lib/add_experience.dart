import 'package:flutter/material.dart';

class AddExperience extends StatefulWidget {
  AddExperience({Key key}) : super(key: key);

  @override
  _AddExperienceState createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Experience'),
        actions: [
          FlatButton(
            onPressed: () async {
              if (_controller.text.isEmpty) return;
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Success'),
                  content: Text('Added experience'),
                  actions: [
                    FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );

              Navigator.pop(context, _controller.text);
            },
            child: Text(
              'SAVE',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Experience'),
        ),
      ),
    );
  }
}

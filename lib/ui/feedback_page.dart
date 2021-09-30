import 'package:flutter/material.dart';
import 'package:instantsewa/router/route_constants.dart';
import 'package:instantsewa/util/hexcode.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    Color _purple = HexColor('#603f8b');
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        backgroundColor: _purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, homeRoute);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                minLines: 4,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Write your feedback',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: _purple,
              padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

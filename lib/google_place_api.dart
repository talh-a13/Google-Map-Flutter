import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class googlepplaceapi extends StatefulWidget {
  const googlepplaceapi({super.key});

  @override
  State<googlepplaceapi> createState() => _googlepplaceapiState();
}

class _googlepplaceapiState extends State<googlepplaceapi> {
  TextEditingController _controller = TextEditingController();
  List<dynamic> _placesList = [];
  var uuid = Uuid(); // get device id
  String sessionToken = "12345";

  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    String KPLACES_API_KEY = "AIzaSyAKbyY5pk-YOkK0wccchfzJhIZxclQiY10";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$KPLACES_API_KEY&sessiontoken=$sessionToken';
    var response = await http.get(Uri.parse(request));

    print(response.body.toString());

    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Seach Place Api"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration:
                    InputDecoration(hintText: "Search Places with name"),
              ),
              // Using Expanded Widget to Show Search Place Api implementation on Screen
              Expanded(
                  child: ListView.builder(
                      itemCount: _placesList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_placesList[index]['description']),
                        );
                      }))
            ],
          ),
        ));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(home: Mainpage()));
}

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  void initstate() {
    super.initState();
    postuser();
  }

  Future postuser() async {
    var url =
        'https://us-central1-laundry-guru-50b7a.cloudfunctions.net/api/customer/create-customer';
    var response = await http.post(
        Uri.parse(
            'https://us-central1-laundry-guru-50b7a.cloudfunctions.net/api/customer/create-customer'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "id": "cus128",
          "name": "Abdul Smith",
          "phoneNumber": "9884342422",
          "storeId": "s_9b6f4374-d3eb-44c5-b518-aba4a8622d94",
          "status": "ALLOWED"
        }));

    print("${response.body}");
  }

  Future getuser() async {
    var url1 =
        'https://us-central1-laundry-guru-50b7a.cloudfunctions.net/api/customer/get-customer?id=cus128';
    var response1 = await http.get(Uri.parse(url1));
    if (response1.statusCode == 200) {
      print("${response1.body}");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          child: Column(
            children: [
              Container(
                child: ElevatedButton(
                  child: Text('Post'),
                  onPressed: () => postuser(),
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Text('Get'),
                  onPressed: () => getuser(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

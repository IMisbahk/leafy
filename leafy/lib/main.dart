import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
{
  return Scaffold(
    appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.energy_savings_leaf),
              SizedBox(width: 8),
              Text('Leafy'),
            ],
          ),
        ),
     drawer: Drawer(
  child: ListView(
    children: const <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  radius: 25,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Amish Gandhi",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 5),
                Text("amishgandhi316@gmail.com"),
              ],
            ),
          ],
        ),
      ),
      ListTile(
        title: Text('User'),
        leading: Icon(Icons.verified_user),
      ),
      ListTile(
        title: Text('Rewards'),
        leading: Icon(Icons.card_giftcard),
      ),
      ListTile(
        title: Text('Log out'),
        leading: Icon(Icons.logout),
      ),
      ListTile(
        title: Text('Customer Care'),
        leading: Icon(Icons.question_answer),
      ),
      ListTile(
        title: Text('FAQs'),
        leading: Icon(Icons.contact_support),
      ),
    ],
  ),
),
    body: const Center(
        child: Text(
          "Maps",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}

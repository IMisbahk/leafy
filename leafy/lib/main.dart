import 'package:flutter/material.dart';

void main() {
  runApp((const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
    children: <Widget>[
      const DrawerHeader(
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
        title: const Text('User'),
        leading: const Icon(Icons.verified_user),
        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserInfo()));
        },
      ),
      ListTile(
        title: const Text('Rewards'),
        leading: const Icon(Icons.card_giftcard),
        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Rewards()));
        },
      ),
      ListTile(
        title: const Text('Log out'),
        leading: const Icon(Icons.logout),
        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserInfo()));
        },
      ),
      ListTile(
        title: const Text('Customer Care'),
        leading: const Icon(Icons.question_answer),
        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Customer_Care()));
        },
      ),
      ListTile(
        title: const Text('FAQs'),
        leading: const Icon(Icons.contact_support),
        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FAQs()));
        },
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

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('User Info'),), 
      body: const Center( 
        child: Text('Take from cloud and refer to it in the formatting will req backend and frontend linkage'), 
      ), 
    ); 
  } 
}
class Rewards extends StatelessWidget {
  const Rewards({super.key});
 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('Rewards'),), 
      body: const Center( 
        child: Text('Grid List with conformation boxes and search and filter functionality using metadata'), 
      ), 
    ); 
  } 
}
class Customer_Care extends StatelessWidget {
  const Customer_Care({super.key});
 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('Customer Care'),), 
      body: const Center( 
        child: Text('Implement chatbot for extra points and maybe try call function'), 
      ), 
    ); 
  } 
}
class FAQs extends StatelessWidget {
  const FAQs({super.key});
 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text("FAQ's"),), 
      body: const Center( 
        child: Text('Need to make, will be static, update when necessary via code'), 
      ), 
    ); 
  } 
}
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RewardsScreen()));
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
class RewardsScreen extends StatelessWidget {
  final List<Reward> rewards = [
    Reward(title: 'DataBase', description: 'DataBase 1', image: 'assets/images/download.png'),
    Reward(title: 'DataBase', description: 'DataBase 2', image: 'assets/images/download (1).png'),
    Reward(title: 'DataBase', description: 'DataBase 3', image: 'assets/images/download (2).png'),
    Reward(title: 'DataBase', description: 'DataBase 4', image: 'assets/images/download (3).png'),
    Reward(title: 'DataBase', description: 'DataBase 5', image: 'assets/images/download (4).png'),
  ];

  RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: SizedBox(
        height: 1000,
        width: 1200,
        child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: rewards.length,
        itemBuilder: (context, index) {
          return RewardCard(reward: rewards[index]);
          },
        ),
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

class RewardCard extends StatelessWidget {
  final Reward reward;

  const RewardCard({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Set the desired border radius
      ),
      child: Column(
        children: [
          Image.asset(reward.image, fit: BoxFit.cover, height: 200, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              reward.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(reward.description, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              // Show confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Redemption'),
                    content: Text('Are you sure you want to redeem ${reward.title}?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle redemption action here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Redeemed ${reward.title}!')),
                          );
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('Redeem'),
                      ),
                    ],
                  );
                },
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            child: const Text('Redeem'),
          ),
          const SizedBox(height: 1),
        ],
      ),
    );
  }
}

class Reward {
  final String title;
  final String description;
  final String image;

  Reward({required this.title, required this.description, required this.image});
}

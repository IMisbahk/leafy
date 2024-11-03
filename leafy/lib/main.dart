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
              Text('leafy'),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FAQs()));
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

class RewardsScreen extends StatefulWidget {
  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  final List<Reward> rewards = [
    Reward(title: 'DataBase', description: 'DataBase 1', image: 'assets/images/download.png'),
    Reward(title: 'DataBase', description: 'DataBase 2', image: 'assets/images/download (1).png'),
    Reward(title: 'DataBase', description: 'DataBase 3', image: 'assets/images/download (2).png'),
    Reward(title: 'DataBase', description: 'DataBase 4', image: 'assets/images/download (3).png'),
    Reward(title: 'DataBase', description: 'DataBase 5', image: 'assets/images/download (4).png'),
  ];

  late List<bool> redeemedStatus;

  @override
  void initState() {
    super.initState();
    redeemedStatus = List<bool>.filled(rewards.length, false); // Initialize redeemed status
  }

  void redeemReward(int index) {
    setState(() {
      redeemedStatus[index] = true; // Update redemption status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: Center(
        child: SizedBox(
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
              return RewardCard(
                reward: rewards[index],
                isRedeemed: redeemedStatus[index],
                onRedeem: () => redeemReward(index),
              );
            },
          ),
        ),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final Reward reward;
  final bool isRedeemed;
  final VoidCallback onRedeem;

  const RewardCard({super.key, required this.reward, required this.isRedeemed, required this.onRedeem});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Column(
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
                onPressed: isRedeemed ? null : () {
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
                              onRedeem(); // Call redeem function
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Redeemed ${reward.title}!')),
                              );
                              Navigator.of(context).pop(); // Close the dialog
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
          if (isRedeemed) // Show overlay if redeemed
            Container(
              color: const Color.fromARGB(187, 255, 255, 255), // Semi-transparent overlay
              child: Center(
                child: Text(
                  'Redeemed',
                  style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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

class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}

class FAQs extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQs> with TickerProviderStateMixin {
  final List<bool> _isExpanded = List.generate(4, (_) => false); // Tracks expanded state

  final List<FAQ> faqs = [
    FAQ(question: "1. What is Flutter?", answer: "Flutter is an open-source UI software development toolkit."),
    FAQ(question: "2. How does Flutter work?", answer: "Flutter works by compiling to native ARM code."),
    FAQ(question: "3. Is Flutter a good choice for mobile development?", answer: "Absolutely! It’s like having a Swiss Army knife, but for coding."),
    FAQ(question: "4. Can I build web apps with Flutter?", answer: "Yes, you can! It’s like getting a two-for-one deal at a fancy restaurant."),
    // Add more FAQs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs')),
      body: Center(
        child: Container(
          width: 1000, // Set your desired width here
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: faqs.asMap().entries.map((entry) {
              int index = entry.key;
              FAQ faq = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(12), // Curved corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0), // Padding inside the container
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align the question to the left
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded[index] = !_isExpanded[index]; // Toggle expansion state
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                faq.question,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Icon(
                                _isExpanded[index] ? Icons.remove : Icons.add, // Change icon based on state
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        // The answer section with animated size
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300), // Duration of the animation
                          curve: Curves.easeInOut, // Animation curve
                          child: _isExpanded[index]
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 12.0), // Additional space above the answer
                                  child: Text(
                                    faq.answer,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              : SizedBox.shrink(), // Shrinks when not expanded
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

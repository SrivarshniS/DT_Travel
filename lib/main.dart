import 'package:flutter/material.dart';
import './weatherPage.dart';
import './flightBooking.dart';
import './calculator.dart';
import './converter.dart';
import './compass.dart';
import './train.dart';
import './hotel.dart';
import './location.dart';
import './profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> categories = [
    {"name": "Flight", "icon": Icons.airplane_ticket, "page": FlightPage()},
    {"name": "Train", "icon": Icons.train, "page": TrainPage()},
    {"name": "Hotels", "icon": Icons.explore, "page": HotelsPage()},
    {"name": "Weather", "icon": Icons.wb_sunny, "page": WeatherPage()},
    {"name": "Converter", "icon": Icons.swap_horiz, "page": CurrencyConverterPage()},
    {"name": "Compass", "icon": Icons.explore, "page": CompassPage()},
    {"name": "Location", "icon": Icons.location_on, "page": LocationPage()},
    {"name": "Calculator", "icon": Icons.calculate, "page": CalculatorPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: ColorFiltered(
            colorFilter: ColorFilter.mode(
           Colors.black.withOpacity(0.2), // Adjust opacity to control darkness
            BlendMode.darken,
            ),
            child: Image.asset(
              "assets/images/nature1.png",
              fit: BoxFit.cover,
            ),
          ),
          ),
          Column(
            children: [
              // AppBar with Background
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Semi-transparent white overlay
                ),
                child: AppBar(
                  title: Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png", // Replace with your logo path
                        height: 35,
                        width: 35,
                      ),
                      SizedBox(width: 1),
                      const Text(
                        "WayGo",
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 3, 3, 3),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  actions: [
                    Row(
                      children: [
                        _buildIconText(Icons.monetization_on, const Color.fromARGB(255, 252, 199, 40), '25 / 28'),
                        SizedBox(width: 10),
                        _buildIconText(Icons.monetization_on, Color.fromARGB(255, 165, 163, 163), '68 / 128'),
                        SizedBox(width: 10),
                        Builder(
                          builder: (context) => GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            child: _ProfileIcon(Icons.account_circle, const Color.fromARGB(255, 82, 81, 81),),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      // Search Box
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: 1000,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.search, color: Colors.black54),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 1100,
                          padding: EdgeInsets.only(top: 16, bottom: 24, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Categories",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              SizedBox(height: 20),
                              Wrap(
                                spacing: 30,
                                runSpacing: 15,
                                children: categories.map((category) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => category['page']),
                                      );
                                    },
                                    child: Container(
                                      width: 100, 
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 5,
                                            spreadRadius: 2,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(category['icon'], size: 40, color: Colors.white),
                                          SizedBox(height: 8),
                                          Text(
                                            category['name'],
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Start the Trip",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 1100,
                          padding: EdgeInsets.only(top: 16, bottom: 24, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Categories",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
      endDrawer: _buildDrawer(),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String amount) {
    return Container(
      padding: EdgeInsets.only(top:1, bottom:1, left:3, right: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          SizedBox(width: 4),
          Text(amount, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _ProfileIcon(IconData icon, Color color) {
    return Icon(icon, size: 35, color: color);
  }

  Widget _buildDrawer() {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("User Name"),
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
              decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 152, 0)),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text("Feedback"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help & Support"),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

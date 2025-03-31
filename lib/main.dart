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
import './trip_details.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showOverlay = false;

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  final List<Map<String, dynamic>> categories = [
    {"name": "Flight", "icon": Icons.airplane_ticket, "page": FlightPage()},
    {"name": "Train", "icon": Icons.train, "page": TrainPage()},
    {"name": "Hotels", "icon": Icons.explore, "page": HotelsPage()},
    {"name": "Weather", "icon": Icons.wb_sunny, "page": WeatherPage()},
    {
      "name": "Converter",
      "icon": Icons.swap_horiz,
      "page": CurrencyConverterPage(),
    },
    {"name": "Compass", "icon": Icons.explore, "page": CompassPage()},
    {"name": "Location", "icon": Icons.location_on, "page": LocationPage()},
    {"name": "Calculator", "icon": Icons.calculate, "page": CalculatorPage()},
  ];

  final List<Map<String, String>> places = [
    {
      "image": "assets/images/img1.jpg",
      "name": "Eiffel Tower",
      "description": "A famous landmark in Paris.",
    },
    {
      "image": "assets/images/img2.jpg",
      "name": "Great Wall",
      "description": "Historic wall in China.",
    },
    {
      "image": "assets/images/img3.jpg",
      "name": "Taj Mahal",
      "description": "Symbol of love in India.",
    },
    {
      "image": "assets/images/img4.jpg",
      "name": "Eiffel Tower",
      "description": "A famous landmark in Paris.",
    },
    {
      "image": "assets/images/img5.png",
      "name": "Great Wall",
      "description": "Historic wall in China.",
    },
    {
      "image": "assets/images/img6.jpg",
      "name": "Taj Mahal",
      "description": "Symbol of love in India.",
    },
    {
      "image": "assets/images/img7.jpg",
      "name": "Eiffel Tower",
      "description": "A famous landmark in Paris.",
    },
    {
      "image": "assets/images/img8.jpg",
      "name": "Great Wall",
      "description": "Historic wall in China.",
    },
    {
      "image": "assets/images/img9.jpg",
      "name": "Taj Mahal",
      "description": "Symbol of love in India.",
    },
    // Add more places here (total 21 for 3x7)
  ];

  List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _ads = [
    "assets/images/ad1.png",
    "assets/images/ad.jpg",
    "assets/images/ad3.jpg",
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _ads.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(
                  0.2,
                ), // Adjust opacity to control darkness
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
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                    0.8,
                  ), // Semi-transparent white overlay
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
                        _buildIconText(
                          Icons.monetization_on,
                          const Color.fromARGB(255, 252, 199, 40),
                          '25 / 28',
                        ),
                        SizedBox(width: 10),
                        _buildIconText(
                          Icons.monetization_on,
                          Color.fromARGB(255, 165, 163, 163),
                          '68 / 128',
                        ),
                        SizedBox(width: 10),
                        Builder(
                          builder:
                              (context) => GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openEndDrawer();
                                },
                                child: _ProfileIcon(
                                  Icons.account_circle,
                                  const Color.fromARGB(255, 82, 81, 81),
                                ),
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
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black54,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 1100,
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: 24,
                            left: 10,
                            right: 10,
                          ),
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
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 20),
                              Wrap(
                                spacing: 30,
                                runSpacing: 15,
                                children:
                                    categories.map((category) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => category['page'],
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 100,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.orange.withOpacity(
                                              0.9,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 5,
                                                spreadRadius: 2,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                category['icon'],
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                category['name'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                        onPressed: _toggleOverlay,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Start the Trip",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // Overlay
                      if (_showOverlay)
                        GestureDetector(
                          onTap: _toggleOverlay, // Close overlay when tapped
                          child: Center(
                            child: GestureDetector(
                              onTap:
                                  () {}, // Prevent closing when tapping inside
                              child: Container(
                                width: 1200,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Trip Started!",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    // Grid of 28 State Buttons
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: List.generate(states.length, (
                                        index,
                                      ) {
                                        final state = states[index];
                                        return ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        TripDetailsPage(
                                                          state: state,
                                                          index: index,
                                                        ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            state,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        );
                                      }),
                                    ),

                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: _toggleOverlay,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          209,
                                          77,
                                          36,
                                        ), // Change button background color
                                      ),
                                      child: Text(
                                        "Close",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ), // Set text color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                      SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 1100,
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: 24,
                            left: 10,
                            right: 10,
                          ),
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
                              SizedBox(height: 20),
                              Container(
                                height: 300,
                                width: double.infinity,
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: _ads.length,
                                  onPageChanged: (index) {
                                    setState(() {
                                      _currentPage = index;
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        _ads[index],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "   Top places of India",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio:
                                          1.2, // Adjust aspect ratio for better fit
                                    ),
                                itemCount: places.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Image.asset(
                                              places[index]["image"]!,
                                              height: 210,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            places[index]["name"]!,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            places[index]["description"]!,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
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
      padding: EdgeInsets.only(top: 1, bottom: 1, left: 3, right: 5),
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
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 152, 0),
              ),
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

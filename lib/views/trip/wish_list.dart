import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with background image and title
          Stack(
            children: [
              Image.asset(
                'images/danang2.png',
                width: double.infinity,
                fit: BoxFit.cover,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 90, left: 25),
                child: Text(
                  'My Trips',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Tabs Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Current Trips'),
              const Text('Next Trips'),
              const Text('Past Trips'),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xff00CEA6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Wish List',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildTripCard(
                  "Melbourne - Sydney",
                  "Jan 30, 2020",
                  "3 days",
                  "\$600.00",
                  "assets/images/sydney.png",
                  liked: true,
                ),
                _buildTripCard(
                  "Hanoi - Ha Long Bay",
                  "Jan 30, 2020",
                  "3 days",
                  "\$300.00",
                  "assets/images/halong.png",
                  liked: false,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'My Trips'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTab(String title, {bool selected = false}) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          backgroundColor: selected ? Colors.green : Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildTripCard(String title, String date, String duration,
      String price, String imagePath,
      {bool liked = false}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.red : Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(date, style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 16),
                    const Icon(Icons.timer, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(duration, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

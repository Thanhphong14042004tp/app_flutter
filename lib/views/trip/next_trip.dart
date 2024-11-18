import 'package:flutter/material.dart';

class NextTripPage extends StatelessWidget {
  const NextTripPage({super.key});

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
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xff00CEA6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Next Trips',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Text('Past Trips'),
              const Text('Wish List'),
            ],
          ),

          const SizedBox(height: 20),

          // Expanded ListView for trip cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildTripCard(
                  context,
                  "Ho Guom Trip",
                  "Hanoi, Vietnam",
                  "Feb 2, 2020",
                  "8:00 - 10:00",
                  "Jonathan P",
                  "assets/images/ho_guom.png",
                  newRequest: false,
                ),
                _buildTripCard(
                  context,
                  "Ho Chi Minh Mausoleum",
                  "Hanoi, Vietnam",
                  "Feb 2, 2020",
                  "8:00 - 10:00",
                  "Stephen",
                  "assets/images/mausoleum.png",
                  newRequest: true,
                ),
                _buildTripCard(
                  context,
                  "Duc Ba Church",
                  "Ho Chi Minh, Vietnam",
                  "Feb 2, 2020",
                  "8:00 - 10:00",
                  "Myung Dae",
                  "assets/images/duc_ba_church.png",
                  newRequest: false,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'My Trips'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 1,
        onTap: (index) {},
      ),
    );
  }

  Widget _buildTripCard(
    BuildContext context,
    String title,
    String location,
    String date,
    String time,
    String guide,
    String imagePath, {
    bool newRequest = false,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(imagePath, fit: BoxFit.cover),
              if (newRequest)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: Colors.blue,
                    child: const Text(
                      'New Request',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
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
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 4),
                    Text(date),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 4),
                    Text(time),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/$guide.jpg'),
                      radius: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(guide),
                  ],
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: const Text('Detail')),
              TextButton(onPressed: () {}, child: const Text('Chat')),
              TextButton(onPressed: () {}, child: const Text('Start')),
            ],
          ),
        ],
      ),
    );
  }
}

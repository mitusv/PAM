import 'package:flutter/material.dart';

void main() {
  runApp(BarbershopApp());
}


class BarbershopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbershop App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TopSection(),
                  SearchWidget(),
                  NearestBarbershopsWidget(),
                  MostRecommendedWidget(),
                  NearestBarbershopsWidget2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF3A1078)),
                  SizedBox(width: 8),
                  Text(
                    'Yogyakarta',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('images/Greeting/user.png'),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Joe Samanta',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            height: 180, // Adjust this value as needed
            decoration: BoxDecoration(
              color: Color(0xFFFFA500),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(34, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      'images/logo.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.network(
                    'images/barber.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Booking Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3A1078),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Joe Samanta',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            child: Text('Booking Now'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple),
          )
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search barber's, haircut ser...",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF3A1078), // Deep purple color
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: Icon(Icons.tune, color: Colors.white),
              onPressed: () {
                // Add filter functionality here
              },
            ),
          ),
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search barber's, haircut services...",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }


class NearestBarbershopsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Nearest Babershop',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        BarbershopCard(
          name: 'Alana Barbershop - Haircut massage & Spa',
          location: 'Banguntapan (5 km)',
          rating: 4.5,
          imageUrl: 'images/Rectangle 1547-2.png',
        ),
        BarbershopCard(
          name: 'Hercha Barbershop - Haircut & Styling',
          location: 'Jalan Kaliurang (8 km)',
          rating: 5.0,
          imageUrl: 'images/Rectangle 1547-1.png',
        ),
        BarbershopCard(
          name: 'Barberking - Haircut styling & massage',
          location: 'Jogja Expo Centre (12 km)',
          rating: 4.5,
          imageUrl: 'images/Rectangle 1547.png',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF3A1078), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Add functionality for See All button
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(
                            color: Color(0xFF3A1078),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_outward,
                          size: 20,
                          color: Color(0xFF3A1078),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NearestBarbershopsWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
        ),
        BarbershopCard(
          name: 'Alana Barbershop - Haircut massage & Spa',
          location: 'Banguntapan (5 km)',
          rating: 4.5,
          imageUrl: 'images/Rectangle 1547.png',
        ),
        BarbershopCard(
          name: 'Hercha Barbershop - Haircut & Styling',
          location: 'Jalan Kaliurang (8 km)',
          rating: 5.0,
          imageUrl: 'images/Rectangle 1547-1.png',
        ),
        BarbershopCard(
          name: 'Barberking - Haircut styling & massage',
          location: 'Jogja Expo Centre (12 km)',
          rating: 4.5,
          imageUrl: 'images/Rectangle 1547-2.png',
        ),

      ],
    );
  }
}


class BarbershopCard extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;

  BarbershopCard({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MostRecommendedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Most recommended',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        RecommendedBarbershopCard(
          name: 'Master piece Barbershop',
          location: 'Jogja Expo Centre (2 km)',
          rating: 5.0,
          imageUrl: 'images/Pict.png',
        ),
        // Add more RecommendedBarbershopCard widgets as needed
      ],
    );
  }
}

class RecommendedBarbershopCard extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;

  RecommendedBarbershopCard({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(location),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(rating.toString()),
                  ],
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  child: Text('Booking'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
                ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
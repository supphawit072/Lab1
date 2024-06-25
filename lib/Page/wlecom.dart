import 'package:flutter/material.dart';

class Wlecom extends StatefulWidget {
  const Wlecom({
    Key? key,
    required this.title,
    required this.username,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String username; // Store the username received from Index
  final String imageUrl; // Store the image URL received from Index

  @override
  State<Wlecom> createState() => _WlecomState();
}

class _WlecomState extends State<Wlecom> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selecting an item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue.shade100, // Change AppBar color to purple
        iconTheme: IconThemeData(
          color: Colors.white, // Change menu button color to white
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/736x/c2/56/cc/c256cc070d807f343ce7f0af9f273c1e.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _widgetOptions[_selectedIndex],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors
                    .purpleAccent, // Adjust drawer header background color
                image: DecorationImage(
                  image:
                      NetworkImage(widget.imageUrl), // Use imageUrl from widget
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile Image', // Text to indicate profile image
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Welcome, ${widget.username}!', // Display username here
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

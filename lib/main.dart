import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'today.dart';
import 'thanku_g.dart';
import 'add_page.dart'; // Import the new page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: SignUpScreen(), // Set SignUpScreen as the initial screen
      debugShowCheckedModeBanner: false,
    );
  }
}

// New SignUpScreen widget
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200, // Set the width of the button
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the HomeScreen after sign-up
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Set button color to yellow
                  padding: EdgeInsets.symmetric(vertical: 16), // Add padding for height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Add rounded corners
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google_logo.png', // Path to the Google logo image
                      height: 24, // Set the height of the logo
                    ),
                    SizedBox(width: 10), // Add some space between the logo and text
                    Text(
                      'Google',
                      style: TextStyle(
                        color: Colors.black, // Set text color to black
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HomeScreen widget (previously MyHomePage)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  List<Widget> _dynamicDrawerItems = [];

  @override
  void initState() {
    super.initState();
    _dynamicDrawerItems = [
      ListTile(
        title: Text('Thanku G', style: TextStyle(color: Colors.black)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThankuGPage()),
          );
        },
      ),
    ];
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _triggerSearch() {
    // Implement your search logic here
    print('Search triggered');
  }

  void _showNotification() {
    // Implement your notification logic here
    print('Notification triggered');
  }

  void _removeItem() {
    setState(() {
      if (_dynamicDrawerItems.isNotEmpty) {
        // Remove the last item from the dynamic drawer items list
        _dynamicDrawerItems.removeLast();
      }
    });
  }

  List<Widget> get _drawerItems {
    return [
      // Static "Today" item
      ListTile(
        title: Text('Today', style: TextStyle(color: Colors.black)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodayPage()),
          );
        },
      ),
      // Dynamic items (Thanku G, etc.)
      ..._dynamicDrawerItems,
      // Static "Add" item
      ListTile(
        leading: Icon(Icons.add, color: Colors.black),
        title: Text('Add', style: TextStyle(color: Colors.black)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()), // Navigate to the new page
          );
        },
      ),
      // Static "Remove" item
      ListTile(
        leading: Icon(Icons.remove, color: Colors.black),
        title: Text('Remove', style: TextStyle(color: Colors.black)),
        onTap: _removeItem,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background color to white
        leading: IconButton(
          icon: Icon(Icons.search, color: Colors.yellowAccent),
          onPressed: _triggerSearch,
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // Set Scaffold background color to white
      endDrawer: Drawer(
        backgroundColor: Colors.white, // Set Drawer background color to white
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ..._drawerItems,
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter, // Align to bottom center
          child: FloatingActionButton(
            onPressed: _showNotification,
            backgroundColor: Colors.yellowAccent,
            child: const Icon(Icons.notifications),
          ),
        ),
      ),
    );
  }
}
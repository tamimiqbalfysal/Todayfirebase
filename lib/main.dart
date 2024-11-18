import 'package:flutter/material.dart';

void main() {
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
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
            ListTile(
              leading: Icon(Icons.today, color: Colors.black),
              title: Text('Today', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodayPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.thumb_up, color: Colors.black),
              title: Text('Thanku G', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThankuGPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.remove, color: Colors.black),
              title: Text('Remove', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Implement your remove logic here
                print('Remove option selected');
              },
            ),
            ListTile(
              leading: Icon(Icons.add, color: Colors.black),
              title: Text('Add', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Implement your add logic here
                print('Add option selected');
              },
            ),
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

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today'),
      ),
      body: Center(
        child: Text('Welcome to the Today Page!'),
      ),
    );
  }
}

class ThankuGPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanku G'),
      ),
      body: Center(
        child: Text('Welcome to the Thanku G Page!'),
      ),
    );
  }
}
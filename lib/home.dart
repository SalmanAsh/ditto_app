import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holiday Destination Finder',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _destinations = [
    {
      "name": "Bali",
      "description": "Tropical paradise with beaches, temples, and culture."
    },
    {
      "name": "Paris",
      "description": "City of love with iconic landmarks and rich history."
    },
    {
      "name": "Kyoto",
      "description": "Historic city with temples, gardens, and traditional culture."
    },
    {
      "name": "Cape Town",
      "description": "Beautiful coastal city with mountains and vineyards."
    },
    {
      "name": "Reykjavik",
      "description": "Gateway to Iceland’s natural wonders and northern lights."
    },
  ];

  String _searchQuery = '';

  List<Map<String, String>> get _filteredDestinations {
    return _destinations.where((destination) {
      final query = _searchQuery.toLowerCase();
      return destination['name']!.toLowerCase().contains(query) ||
             destination['description']!.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Holiday Destinations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search destinations',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredDestinations.isEmpty
                  ? const Center(child: Text('No destinations found'))
                  : ListView.builder(
                      itemCount: _filteredDestinations.length,
                      itemBuilder: (context, index) {
                        final destination = _filteredDestinations[index];
                        return Card(
                          child: ListTile(
                            title: Text(destination['name']!),
                            subtitle: Text(destination['description']!),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
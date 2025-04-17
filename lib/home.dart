import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'destination_detail.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Holiday Destination Finder',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       home: const HomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _destinations = [];
  String _searchQuery = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    const url = '';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final features = data['features'] as List;

      setState(() {
        _destinations = features.map<Map<String, dynamic>>((item) {
          final props = item['properties'];
          return {
            'name': props['name'] ?? 'Unknown',
            'description': props['formatted'] ?? 'No description available',
            'details': props,
          };
        }).toList();
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
      throw Exception('Failed to load data');
    }
  }

  List<Map<String, dynamic>> get _filteredDestinations {
    return _destinations.where((destination) {
      final query = _searchQuery.toLowerCase();
      return destination['name'].toLowerCase().contains(query) ||
             destination['description'].toLowerCase().contains(query);
    }).toList();
  }

  void _openDetails(Map<String, dynamic> destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DestinationDetailPage(details: destination['details']),
      ),
    );
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
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredDestinations.isEmpty
                      ? const Center(child: Text('No destinations found'))
                      : ListView.builder(
                          itemCount: _filteredDestinations.length,
                          itemBuilder: (context, index) {
                            final destination = _filteredDestinations[index];
                            return Card(
                              child: ListTile(
                                title: Text(destination['name']),
                                subtitle: Text(destination['description']),
                                onTap: () => _openDetails(destination),
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
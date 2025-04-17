import 'package:flutter/material.dart';

class DestinationDetailPage extends StatelessWidget {
  final Map<String, dynamic> details;
  const DestinationDetailPage({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(details['name'] ?? 'Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  details['name'] ?? 'No Name',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  details['formatted'] ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                if (details['opening_hours'] != null)
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Hours: ${details['opening_hours']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                if (details['facilities'] != null)
                  Row(
                    children: [
                      const Icon(Icons.accessible, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Wheelchair: ${details['facilities']['wheelchair'] == true ? 'Yes' : 'No'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                if (details['website'] != null)
                  Row(
                    children: [
                      const Icon(Icons.link, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Website: ${details['website']}',
                          style: const TextStyle(fontSize: 16, color: Colors.blue),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                if (details['contact'] != null && details['contact']['phone'] != null)
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Phone: ${details['contact']['phone']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

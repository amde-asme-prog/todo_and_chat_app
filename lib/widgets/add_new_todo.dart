import 'package:flutter/material.dart';

class AddNewTodo extends StatelessWidget {
  const AddNewTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.push_pin_outlined),
            onPressed: () {
              // Handle pin action
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_alert_outlined),
            onPressed: () {
              // Handle alert action
            },
          ),
          IconButton(
            icon: const Icon(Icons.archive_outlined),
            onPressed: () {
              // Handle archive action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Note',
                labelStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle save action
              },
              style: ElevatedButton.styleFrom(
                minimumSize:
                    const Size.fromHeight(50), // Make button full-width
              ),
              child: const Text('Save Todo'),
            ),
          ],
        ),
      ),
    );
  }
}

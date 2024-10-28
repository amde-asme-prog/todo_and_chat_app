import 'package:flutter/material.dart';

class TodoDrawer extends StatelessWidget {
  const TodoDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        children: [
          const Text(
            'Todo',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outlined), // Profile Icon
            title: const Text('Notes'),
            onTap: () {
              // Handle profile tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_alert_rounded), // Settings Icon
            title: const Text('Reminders'),
            onTap: () {
              // Handle settings tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.add), // Logout Icon
            title: const Text('create new label'),
            onTap: () {
              // Handle logout tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.archive_outlined), // Logout Icon
            title: const Text('Archive'),
            onTap: () {
              // Handle logout tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_rounded), // Logout Icon
            title: const Text('Trash'),
            onTap: () {
              // Handle logout tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined), // Logout Icon
            title: const Text('Settings'),
            onTap: () {
              // Handle logout tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_outlined), // Logout Icon
            title: const Text('Help & Feedback'),
            onTap: () {
              // Handle logout tap
            },
          ),
        ],
      ),
    );
  }
}

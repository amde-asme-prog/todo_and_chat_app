import 'package:flutter/material.dart';
import 'package:todo_chat_app/models/todo_data.dart';
import 'package:todo_chat_app/widgets/todo_item.dart';
import 'package:todo_chat_app/widgets/todo_item_detail.dart';

class TodoScreen extends StatelessWidget {
  // Create a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 16.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, size: 24),
                    onPressed: () {
                      _scaffoldKey.currentState
                          ?.openDrawer(); // Open the drawer
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Opacity(
                      opacity: 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search your notes',
                          hintStyle: TextStyle(
                            fontSize: 18,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.view_list_outlined, size: 34),
                    onPressed: () {
                      // Handle view toggle action
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.account_circle_outlined, size: 24),
                    onPressed: () {
                      // Handle user profile action
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          elevation: 4,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                leading:
                    const Icon(Icons.question_mark_outlined), // Logout Icon
                title: const Text('Help & Feedback'),
                onTap: () {
                  // Handle logout tap
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1, // This will be overridden by the layout
              mainAxisExtent:
                  150, // Default height, will adjust based on content
            ),
            itemCount: todoData.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(todo: todoData.todos[index]);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext ctx) {
                return Scaffold(
                  appBar: AppBar(
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.push_pin_outlined),
                        onPressed: () {
                          // Handle delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_alert_outlined),
                        onPressed: () {
                          // Handle delete action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.archive_outlined),
                        onPressed: () {
                          // Handle delete action
                        },
                      ),
                    ],
                  ),
                  body: Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(8.0),
                      child: const Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Title',
                              hintStyle: TextStyle(
                                fontSize: 18,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 10.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Note",
                              hintStyle: TextStyle(fontSize: 18),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10.0),
                            ),
                          ),
                        ],
                      )),
                );
              }),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

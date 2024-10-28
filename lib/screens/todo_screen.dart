import 'package:flutter/material.dart';
import 'package:todo_chat_app/auth/auth.dart';
import 'package:todo_chat_app/auth/login_screen.dart';
import 'package:todo_chat_app/models/todo_data.dart';
import 'package:todo_chat_app/utils/show_toast.dart';
import 'package:todo_chat_app/widgets/add_new_todo.dart';
import 'package:todo_chat_app/widgets/todo_drawer.dart';
import 'package:todo_chat_app/widgets/todo_item.dart';

final auth = Auth();

class TodoScreen extends StatelessWidget {
  // Create a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TodoScreen({
    super.key,
  });

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
                    icon: const Icon(Icons.menu_outlined, size: 24),
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
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'Profile',
                          child: const Text('Profile'),
                          onTap: () {
                            // Handle user profile action
                          },
                        ),
                        PopupMenuItem(
                          value: 'Settings',
                          child: const Text('Settings'),
                          onTap: () {
                            // Handle user profile action
                          },
                        ),
                        PopupMenuItem(
                          value: 'Logout',
                          child: const Text('Logout'),
                          onTap: () {
                            auth.signOut();
                            if (auth.currentUser == null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            } else {
                              showToast(
                                  title: "Error",
                                  message: "something went wrong",
                                  isError: true);
                            }
                          },
                        ),
                      ];
                    },
                    child: const Icon(Icons.account_circle_rounded),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: const TodoDrawer(),
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
                return const AddNewTodo();
              }),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_chat_app/auth/auth.dart';
import 'package:todo_chat_app/auth/login_screen.dart';
import 'package:todo_chat_app/models/todo.dart';

import 'package:todo_chat_app/widgets/Todo/add_new_todo.dart';
import 'package:todo_chat_app/widgets/Todo/todo_drawer.dart';
import 'package:todo_chat_app/widgets/Todo/todo_item.dart';
import 'package:todo_chat_app/services/todo_database.dart';

final auth = Auth();

class TodoScreen extends StatelessWidget {
  final TodoDatabase todoDatabase = TodoDatabase();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TodoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 16.0),
          child: TodoAppBar(scaffoldKey: _scaffoldKey),
        ),
        drawer: const TodoDrawer(),
        body: const Text('Hello'),
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

class TodoAppBar extends StatelessWidget {
  const TodoAppBar({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                _scaffoldKey.currentState?.openDrawer(); // Open the drawer
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
            const TodoPopupMenuButton(),
          ],
        ),
      ),
    );
  }
}

class TodoPopupMenuButton extends StatelessWidget {
  const TodoPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'Profile',
            onTap: () {
              final user = FirebaseAuth.instance.currentUser;
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text('Profile'),
                            actions: [
                              IconButton(
                                icon: const Icon(Icons.more_horiz),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          body: SafeArea(
                            top: false,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user?.photoURL ?? ''),
                                    radius: 50,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    '${user!.displayName}',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(user.email ?? ''),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Email',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          const SizedBox(height: 5),
                                          Text(user.email ?? ''),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text('Phone Number',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          const SizedBox(height: 5),
                                          Text(user.phoneNumber ?? ''),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('UID',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          const SizedBox(height: 5),
                                          Text(user.uid),
                                        ],
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('Last Login',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          SizedBox(height: 5),
                                          Text('Just Now'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  ElevatedButton(
                                    child: const Text('Edit Profile'),
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Go back to previous screen
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              );
            },
            child: const Text('Profile'),
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
              auth.authStateChanges.listen((User? user) {
                if (user == null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                }
              });
            },
          ),
        ];
      },
      child: const Icon(Icons.account_circle_rounded),
    );
  }
}

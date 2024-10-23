import 'package:flutter/material.dart';
import 'package:todo_chat_app/models/todo_data.dart';
import 'package:todo_chat_app/widgets/todo_item.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 16.0),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                      // Handle menu action
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const TextField(
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
                  IconButton(
                    icon: const Icon(Icons.drag_handle_rounded, size: 34),
                    onPressed: () {
                      // Handle equal icon action
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.account_circle_outlined, size: 24),
                    onPressed: () {
                      // Handle user icon action
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(todoData.todos.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodoItem(
              todo: todoData.todos[index],
            ),
          );
        }),
      ),
    );
  }
}

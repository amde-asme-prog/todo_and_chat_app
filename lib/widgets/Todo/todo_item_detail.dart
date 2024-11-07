// //TodoItemDetail
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_chat_app/models/todo.dart';

// class TodoItemDetail extends StatelessWidget {
//   final Object todo;
//   const TodoItemDetail({super.key, required this.todo});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.push_pin_outlined),
//             onPressed: () {
//               // Handle delete action
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.add_alert_outlined),
//             onPressed: () {
//               // Handle delete action
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.archive_outlined),
//             onPressed: () {
//               // Handle delete action
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(16.0),
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               todo['title'] as String,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Text(
//               todo['description'] as String,
//               textAlign: TextAlign.start,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

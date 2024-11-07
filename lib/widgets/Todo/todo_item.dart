// import 'package:flutter/material.dart';
// import 'package:todo_chat_app/models/todo.dart';
// import 'package:todo_chat_app/widgets/Todo/todo_item_detail.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TodoItem extends StatelessWidget {
//   final Object todo;

//   const TodoItem({super.key, required this.todo});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TodoItemDetail(
//               todo: todo,
//             ),
//           ),
//         );
//       },
//       child: Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 todo['title'] as String,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 8.0),
//               Flexible(
//                 child: Text(
//                   todo['description'] as String,
//                   style: const TextStyle(
//                     fontSize: 14,
//                   ),
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

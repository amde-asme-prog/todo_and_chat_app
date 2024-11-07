// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:todo_chat_app/models/todo.dart';

// class TodoDatabase {
//   static final TodoDatabase instance = TodoDatabase._init();

//   TodoDatabase._init();

//   final FirebaseFirestore _firestore =
//       FirebaseFirestore.instance.collection('todos');

//   Future<Todo?> getTodo(String id) async {
//     try {
//       final docSnapshot = await _firestore.doc(id).get();
//       return docSnapshot.exists ? Todo.fromJson(id, docSnapshot.data) : null;
//     } catch (e) {
//       print('Error getting todo: $e');
//       return null;
//     }
//   }

//   Future<List<Todo>> getAllTodos() async {
//     try {
//       final querySnapshot = await _firestore.get();
//       return querySnapshot.docs
//           .map((doc) => Todo.fromJson(doc.id, doc.data()!))
//           .toList();
//     } catch (e) {
//       print('Error fetching all todos: $e');
//       return [];
//     }
//   }

//   Future<void> addTodo(Todo todo) async {
//     try {
//       await _firestore.doc(todo.id).set(todo.toJson());
//     } catch (e) {
//       print('Error adding todo: $e');
//     }
//   }

//   Future<void> updateTodo(Todo todo) async {
//     try {
//       await _firestore.doc(todo.id).update(todo.toJson());
//     } catch (e) {
//       print('Error updating todo: $e');
//     }
//   }

//   Future<void> deleteTodo(String id) async {
//     try {
//       await _firestore.doc(id).delete();
//     } catch (e) {
//       print('Error deleting todo: $e');
//     }
//   }
// }

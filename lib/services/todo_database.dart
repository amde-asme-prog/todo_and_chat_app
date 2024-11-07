import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_chat_app/auth/auth.dart';
import 'package:todo_chat_app/models/todo.dart';

final ownerId = Auth().currentUser.currentUser!.uid;

const String todoCollectionRef = 'todos';

class TodoDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todosCollection;

  TodoDatabase() {
    _todosCollection = _firestore.collection(todoCollectionRef);
  }

  Stream<QuerySnapshot> getAllTodos() {
    return _todosCollection.where('owner', isEqualTo: ownerId).snapshots();
  }

  Future<void> addTodo(Todo todo) async {
    return await _todosCollection.doc(todo.documentID).set(todo.toJson());
  }

  Future<void> updateTodo(Todo todo) async {
    return await _todosCollection.doc(todo.documentID).update(todo.toJson());
  }

  Future<void> deleteTodoByDocumentID(String id) async {
    return await _todosCollection.doc(id).delete();
  }

  Future<void> deleteTodos() async {
    return await _todosCollection
        .where('owner', isEqualTo: ownerId)
        .get()
        .then((value) {
      value.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }

  Future<void> getTodoByDocumentID(String id) async {
    return await _todosCollection.doc(id).get().then((value) {
      print(value.data());
    });
  }
}

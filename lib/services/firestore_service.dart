import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/note.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get notes collection for current user
  CollectionReference get _notesCollection {
    if (_auth.currentUser == null) {
      throw Exception('User not authenticated');
    }
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes');
  }

  // Get all notes for current user
  Stream<List<Note>> getNotes() {
    return _notesCollection
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
    });
  }

  // Add a new note
  Future<void> addNote(String title, String content) async {
    final now = DateTime.now();
    await _notesCollection.add({
      'title': title.trim(),
      'content': content.trim(),
      'createdAt': Timestamp.fromDate(now),
      'updatedAt': Timestamp.fromDate(now),
    });
  }

  // Update an existing note
  Future<void> updateNote(String noteId, String title, String content) async {
    await _notesCollection.doc(noteId).update({
      'title': title.trim(),
      'content': content.trim(),
      'updatedAt': Timestamp.fromDate(DateTime.now()),
    });
  }

  // Delete a note
  Future<void> deleteNote(String noteId) async {
    await _notesCollection.doc(noteId).delete();
  }

  // Get a specific note
  Future<Note?> getNote(String noteId) async {
    final doc = await _notesCollection.doc(noteId).get();
    if (doc.exists) {
      return Note.fromFirestore(doc);
    }
    return null;
  }
}

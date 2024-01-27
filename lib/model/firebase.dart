import 'package:firebase_storage/firebase_storage.dart';

class FirebaseFile {
  final Reference ref;
  final String url;
  final String name;

  FirebaseFile({
    required this.ref,
    required this.url,
    required this.name,
  });

  @override
  String toString() {
    return 'file "$name"';
  }
}
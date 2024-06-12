import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class User {
  String id;
  String name;
  String email;

  User({
    String? pid,
    required this.name,
    required this.email,
  }) : id = pid ?? uuid.v4(); // Génère un UUID si pid n'est pas fourni

  @override
  String toString() {
    return "User(id: $id, name: $name, email: $email)";
  }
}

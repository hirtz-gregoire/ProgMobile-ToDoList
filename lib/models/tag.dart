import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Tag {
  String id;
  String name;

  Tag({
    String? pid,
    required this.name,
  }) : id = pid ?? uuid.v4(); // Génère un UUID si pid n'est pas fourni

  @override
  String toString() {
    return "Tag(id: $id, name: $name)";
  }
}

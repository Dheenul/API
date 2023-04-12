import 'package:dart_json_mapper/dart_json_mapper.dart';

// Create a jsonSerializable class named AvengerBO.
@jsonSerializable
class AvengerBO {
  
  // Create a variable named id of type int which can accept null values.
  int? id;

  // Create a variable named name of type String which can accept null values.
  String? name;

  /* Create a constructor method for the class named AvengerBO which has the required named 
  parameter of all its class members*/
  AvengerBO({required this.id, required this.name});
}

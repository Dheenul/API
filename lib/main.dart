import 'package:data_api_crud/BO/AvengerBO/AvengerBO.mapper.g.dart';
import 'package:data_api_crud/Services/AvengerServices/AvengerService.dart';
import 'package:data_api_crud/Services/AvengerServices/IAvengerService.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'App.dart';
import 'main.reflectable.dart';

/* Create a main method of type void. */
void main() {
  
  // Call the method named initializeReflectable.
  initializeReflectable();

  // Call the method named initializeReflectable.
  initializeJsonMapper();

  // Using GetIt class register the service using getit instance following by registerSingleton and finally service name.
  GetIt.instance.registerSingleton<IAvengerService>(AvengerService());

  // Call the method named runApp and pass the method App() as it's parameter.
  runApp(const App());
}

import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:data_api_crud/Helpers/APIHandlerHelper/APIHandlerHelper.dart';
import 'package:data_api_crud/BO/AvengerBO/AvengerBO.dart';
import 'package:data_api_crud/Helpers/AppConstants/AppConstants.dart';
import 'package:data_api_crud/Services/AvengerServices/IAvengerService.dart';
import 'package:dio/dio.dart';

// Create a class named AvengerService by implementing the abstract class IAvengerService.
class AvengerService implements IAvengerService {

  // Create a instance for the class named Dio and in the constructor method pass value to base url parameter in BaseOptions method.
  final Dio _dio =
      Dio(BaseOptions(baseUrl: AppConstants.avengerSerivceBaseURL));

  @override
  Future<ServiceResult<AvengerBO>> createNewAvenger(
      {required AvengerBO newHeroName}) async {

    // Using try block perform the code inside the block.
    try {

      // Create a variable named newHero and assign the json serialized value of newHeroName to it. 
      var newHero = JsonMapper.serialize(newHeroName);

      // Create a variable named responseFromServer and store the response upon calling the .post method 
      // Using the instance named _dio and pass the required data in data parameter.
      var responseFromServer = await _dio
          .post(AppConstants.avengerSerivceCreateNewHero, data: newHero);

      // Check whether the statusCode of response is equal to 201.
      if (responseFromServer.statusCode == 201) {

        // Return ServiceResult with a HttpStatusCode.OK, deserialize the responseFromServer.data into AvengerBO and a success message.
        return ServiceResult(
            statusCode: HttpStatusCode.OK,
            content: JsonMapper.deserialize<AvengerBO>(responseFromServer.data),
            message: 'New hero created successfully');
      } 
      
      // Else.
      else {

        // Return ServiceResult with a HttpStatusCode.BadRequest and a error message.
        return ServiceResult(
            statusCode: HttpStatusCode.BadRequest,
            message: 'Error in creating new hero');
      }
    } 

    // On catching FormatException error.
    on FormatException {

      // Return ServiceResult with a HttpStatusCode.Forbidden and an error message.
      return ServiceResult(
        statusCode: HttpStatusCode.Forbidden,
        message: "The type of data got is incorrect!",
      );
    }
    
    // On catching SocketException error.
     on SocketException {

      // Return ServiceResult with a HttpStatusCode.NetworkFailure and an error message.
      return ServiceResult(
        statusCode: HttpStatusCode.NetworkFailure,
        message: "There is not internet connection!",
      );
    } 

    // Using catch block catch the thrown exception.
    catch (e) {
      
      // Return ServiceResult with a HttpStatusCode.SystemException and the exception caught.
      return ServiceResult(
          statusCode: HttpStatusCode.SystemException, message: e.toString());
    }
  }

  @override
  Future<ServiceResult<List<AvengerBO>>> deleteAnAvenger(
      {required AvengerBO deleteHero}) async {

    // Using try block perform the code inside the block.
    try {

      // Create a variable named responseFromServer and store the response upon calling the .delete method 
      // Using the instance named _dio and pass the path variable(id).
      var responseFromServer = await _dio
          .delete("${AppConstants.avengerSerivceGetAllAvengers}/${deleteHero.id}");

      // Check whether the statusCode of response is equal to 200.
      if (responseFromServer.statusCode == 200) {

        // Return ServiceResult with a HttpStatusCode.OK, deserialize the responseFromServer.data and a success message.
        return ServiceResult(
            statusCode: HttpStatusCode.OK,
            content: JsonMapper.deserialize(responseFromServer.data),
            message: 'Hero deleted successfully');
      }

      // Else.
       else {

        // Return ServiceResult with a HttpStatusCode.BadRequest and a error message.
        return ServiceResult(
            statusCode: HttpStatusCode.BadRequest,
            message: 'Error in deleting hero');
      }
    } 
    
    // On catching FormatException error.
    on FormatException {

      // Return ServiceResult with a HttpStatusCode.Forbidden and an error message.
      return ServiceResult(
        statusCode: HttpStatusCode.Forbidden,
        message: "The type of data got is incorrect!",
      );
    } 

    // On catching SocketException error.
    on SocketException {

      // Return ServiceResult with a HttpStatusCode.NetworkFailure and an error message.
      return ServiceResult(
        statusCode: HttpStatusCode.NetworkFailure,
        message: "There is not internet connection!",
      );
    } 

    // Using catch block catch the thrown exception.
    catch (e) {

      // Return ServiceResult with a HttpStatusCode.SystemException and the exception caught.
      return ServiceResult(
          statusCode: HttpStatusCode.SystemException, message: e.toString());
    }
  }

  @override
  Future<ServiceResult<List<AvengerBO>>> editAnAvenger(
      {required AvengerBO editHero}) async{

    // Using try block perform the code inside the block.
    try {

      // Create a variable named newHero and assign the json serialized value of newHeroName to it. 
      var newHero = JsonMapper.serialize(editHero);

      // Create a variable named responseFromServer and store the response upon calling the .put method 
      // Using the instance named _dio and pass the required data in data parameter and add the path variable.
      var responseFromServer = await _dio
          .put("${AppConstants.avengerSerivceGetAllAvengers}/${editHero.id}", data: newHero);
      
      // Check whether the statusCode of response is equal to 200.
      if (responseFromServer.statusCode == 200) {

        // Return ServiceResult with a HttpStatusCode.OK, deserialize the responseFromServer.data into AvengerBO and a success message.
        return ServiceResult(
            statusCode: HttpStatusCode.OK,
            content: JsonMapper.deserialize(responseFromServer.data),
            message: 'New hero created successfully');
      } 
      
      // Else.
      else {

        // Return ServiceResult with a HttpStatusCode.BadRequest and a error message.
        return ServiceResult(
            statusCode: HttpStatusCode.BadRequest,
            message: 'Error in creating new hero');
      }
    } 
    
    // On catching FormatException error.
    on FormatException {

      // Return ServiceResult with a HttpStatusCode.Forbidden and an error message.
      return ServiceResult(
        statusCode: HttpStatusCode.Forbidden,
        message: "The type of data got is incorrect!",
      );
    } 
    
    // On catching SocketException error.
    on SocketException {

      // Return ServiceResult with a HttpStatusCode.NetworkFailure and an error message.
      return ServiceResult(
        statusCode: HttpStatusCode.NetworkFailure,
        message: "There is not internet connection!",
      );
    } 
    
    // Using catch block catch the thrown exception.
    catch (e) {

      // Return ServiceResult with a HttpStatusCode.SystemException and the exception caught.
      return ServiceResult(
          statusCode: HttpStatusCode.SystemException, message: e.toString());
    }
  }

  @override
  Future<ServiceResult<List<AvengerBO>>> getAllAvengers() async {

    // Using try block perform the code inside the block.
    try {

      // Create a variable named responseFromServer and store the response upon calling the .get method 
      // Using the instance named _dio and pass the required value to it.
      var responseFromServer =
          await _dio.get(AppConstants.avengerSerivceGetAllAvengers);

      // Check whether the statusCode of response is equal to 200.
      if (responseFromServer.statusCode == 200) {

        // Create a variable named content and store the data from the 
        var content = responseFromServer.data;

        // Create a list named finalData of type AvengerBO and set it value as empty list.
        List<AvengerBO> finalData = [];

        // Check whether the content is of type List.
        if (content is List) {

          // Iterate the content till the number of elements present.
          for (var element in content) {

            // Create a variable named instance and assign the deserialize value of element.
            var instance = JsonMapper.deserialize<AvengerBO>(element);

            // Check whether the instance variable is not equal to null.
            if (instance != null) {

              // Using .add method add the variable instance in the list named finalData
              finalData.add(instance);
            }
          }
        }

        // Return ServiceResult with a HttpStatusCode.OK, finalData content and a success message.
        return ServiceResult(
            statusCode: HttpStatusCode.OK,
            content: finalData,
            message: 'Data fetched successfully');
      }

      // Return ServiceResult with a HttpStatusCode.Conflict, empty list as content and a success message.
      return ServiceResult(
          statusCode: HttpStatusCode.Conflict,
          content: [],
          message: 'Data fetched successfully');
    } 

    // On catching FormatException error.
    on FormatException {

      // Return ServiceResult with a HttpStatusCode.Forbidden, content of a empty list  and an error message.
      return ServiceResult(
        statusCode: HttpStatusCode.Forbidden,
        content: [],
        message: "The type of data got is incorrect!",
      );
    } 
    
    // On catching SocketException error.
    on SocketException {

      // Return ServiceResult with a HttpStatusCode.NetworkFailure, content of a empty list  and an error message.
      return ServiceResult(
        statusCode: HttpStatusCode.NetworkFailure,
        content: [],
        message: "There is not internet connection!",
      );
    } 
    
    // Using catch block catch the thrown exception.
    catch (e) {

      // Return ServiceResult with a HttpStatusCode.SystemException and the exception caught.
      return ServiceResult(
          statusCode: HttpStatusCode.SystemException,
          content: [],
          message: e.toString());
    }
  }
}

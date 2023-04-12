import 'package:data_api_crud/BO/AvengerBO/AvengerBO.dart';
import 'package:data_api_crud/Helpers/Mixins/PopUpMixin.dart';
import 'package:data_api_crud/Helpers/Utitilites/Utilities.dart';
import 'package:data_api_crud/Pages/HomeScreen/HomeScreenModel.dart';
import '../../Helpers/AppNavigations/NavigationMixin.dart';

// Create a class named HomeScreenVM by extending the class HomeScreenModel.
class HomeScreenVM extends HomeScreenModel {

  /* Create a method named getAllAvengersData of type future<void> to get all the avengers data.*/
  Future<void> getAllAvengersData() async {

    // Using try block perform the code inside the block. 
    try {


      // Call the method named setLoadingStatus and pass value to the named parameter.
      setLoadingStatus(loadingStatus: true);

      // Create a variable named data and call the method named getAllAvengers using the get it instance named avengerService which initiates an API call and store the response.
      var data = await avengerService.getAllAvengers();
      // await Future.delayed(Duration(seconds: 2));
      
      // Call the method named setDataTAllAvengerList and pass value to named parameter.
      setDataTAllAvengerList(avengerDetails: data.content ?? []);

      // Call the method named setLoadingStatus and pass value to the named parameter.
      setLoadingStatus(loadingStatus: false);
    } 
    
    // Using catch block catch the thrown exception.
    catch (e) {

      // Call the method named writeExceptionData to print the caught exception.
      e.writeExceptionData();
    }
  }

  /* Create a method named deleteAnAvengerData of type future<void> to delete an avenger data with a required named parameter index.*/
  Future<void> deleteAnAvengerData({required int index}) async {

    // Using try block perform the code inside the block.
    try {

      // Call the method named setLoadingStatus and pass value to the named parameter.
      setLoadingStatus(loadingStatus: true);

      // Create an instance named deleteAvengerID by assigning the constructor method named AvengerBO and passing the required parameter values.
      AvengerBO deleteAvengerID =
          AvengerBO(id: allAvenger[index].id, name: null);

      // Create a variable named data and call the method named deleteAnAvenger using the get it instance named avengerService which initiates an API call and store the response.
      var data =
          await avengerService.deleteAnAvenger(deleteHero: deleteAvengerID);

      // Call the method named getAllAvengersData.
      await getAllAvengersData();
    } 

    // Using catch block catch the thrown exception.
    catch (e) {

      // Call the method named writeExceptionData to print the caught exception.
      e.writeExceptionData();
    }
  }

  /* Create a method named deleteAnAvengerData of type future<void> to delete an avenger data with a required named parameter index and name.*/
  Future<void> editAvengerData(
      {required int index, required String name}) async {

    // Using try block perform the code inside the block.
    try {

      // Call the method named navigateToPreviousScreen.
      navigateToPreviousScreen();

      // Call the method named setLoadingStatus and pass value to the named parameter.
      setLoadingStatus(loadingStatus: true);

      // Create a variable named heroName and assign the parameter value to it. 
      String heroName = name;

      // Create an instance named editAvengerID by assigning the constructor method named AvengerBO and passing the required parameter values.
      AvengerBO editAvengerID =
          AvengerBO(id: allAvenger[index].id, name: heroName);

      // Create a variable named data and call the method named deleteAnAvenger using the get it instance named avengerService which initiates an API call and store the response.
      var data = await avengerService.editAnAvenger(editHero: editAvengerID);
      // await Future.delayed(Duration(seconds: 1));

      // Call the method named getAllAvengersData.
      await getAllAvengersData();
    } 
    
    // Using catch block catch the thrown exception.
    catch (e) {

      // Call the method named writeExceptionData to print the caught exception.
      e.writeExceptionData();
    }
  }

  /* Create a method named createAnNewAvenger of type future<void> to create an avenger, with a required named parameter name.*/
  Future<void> createAnNewAvenger({required String name}) async {

    // Using try block perform the code inside the block.
    try {

      // Call the method named navigateToPreviousScreen.
      navigateToPreviousScreen();

      // Call the method named setLoadingStatus and pass value to the named parameter.
      setLoadingStatus(loadingStatus: true);

      // Create a variable named heroName and assign the parameter value to it. 
      String heroName = name;

      // Create an instance named newAvenger by assigning the constructor method named AvengerBO and passing the required parameter values.
      AvengerBO newAvenger = AvengerBO(id: null, name: heroName);

      // Create a variable named data and call the method named createNewAvenger using the get it instance named avengerService which initiates an API call and store the response.
      var data = await avengerService.createNewAvenger(newHeroName: newAvenger);
      // await Future.delayed(Duration(seconds: 1));

      // Call the method named getAllAvengersData.
      await getAllAvengersData();
    } 
    
    // Using catch block catch the thrown exception.
    catch (e) {

      // Call the method named writeExceptionData to print the caught exception.
      e.writeExceptionData();
    }
  }

  /* Create a method named navigateToPreviousScreen of type void to navigate to previous page.*/
  void navigateToPreviousScreen() {

    // Using the streamcontroller named navigationStream add the event NavigatorPop() into the stream.
    navigationStream.add(NavigatorPop());
  }

  /* Create a method named newAvengerPopUp to show a pop up.*/
  void newAvengerPopUp({int index = 0}) {

    // Using the streamcontroller named addPopUpEvent add the event PopUpData() by passing the required named parameter values into the stream.
    addPopUpEvent(event: PopUpData(data: [index, 'showNewAvengerPopUp']));
  }

  /* Create a method named editAvengerPopUp to show a pop up.*/
  void editAvengerPopUp({required int index}) {

    // Using the streamcontroller named addPopUpEvent add the event PopUpData() by passing the required named parameter values into the stream.
    addPopUpEvent(event: PopUpData(data: [index, 'editAvengerPopUp']));
  }
}

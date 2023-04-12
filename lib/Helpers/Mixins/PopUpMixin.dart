import 'dart:async';

// Create a abstract class named IPopUpMixin.
abstract class IPopUpMixin {}

// Create a class named PopUpData by extending the class IPopUpMixin
class PopUpData extends IPopUpMixin {

  // Create a list named data of dynamic type.
  List<dynamic> data;

  /* Create a constructor method named PopUpData which has a required named parameter of its class members*/
  PopUpData({required this.data});
}

// Create a mixin named PopUpMixin to add data to stream
mixin PopUpMixin {

  // Create a stream controller named popUpController of type IPopUpMixin.
  StreamController<IPopUpMixin> popUpController = StreamController();

  /* Create a method named addPopUpEvent of type void and keep a named parameter called event of type IPopUpMixin*/
  void addPopUpEvent({required IPopUpMixin event}) {

    // Using the stream controller called popUpController add the parameter value event into the stream.
    popUpController.add(event);
  }
  
  /* Create a method named closePopUpStream of type void to close the pop up screen and navigate to the previous screen*/
  void closePopUpStream() {

    // close the stream named popUpController using .close method.
    popUpController.close();
  }
}













// abstract class IPopUpMixin {}

// class PopUpData extends IPopUpMixin {
//   List<dynamic> data;
//   PopUpData({required this.data});
// }

// mixin PopUpMixin {

//   StreamController<IPopUpMixin> popUpController = StreamController();

//   void setPopUpData({required IPopUpMixin event}) {
//     popUpController.add(event);
//   }

//   void closeStream() {
//     popUpController.close();
//   }

// }

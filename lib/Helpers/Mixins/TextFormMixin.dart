
import 'dart:async';

// Create a abstract class named ITextFormMixinx.
abstract class ITextFormMixinx {}

// Create a class named TextFeildData by extending the class ITextFormMixinx
class TextFeildData extends ITextFormMixinx {

  // Create a variable named data of type String.
  String data;

  /* Create a constructor method named TextFeildData which has a required named parameter of its class members*/
  TextFeildData({required this.data});
}

// Create a mixin named TextFormMixinx to add data to stream
mixin TextFormMixinx {

  // Create a stream controller named textEditingController of type ITextFormMixinx.
  StreamController<ITextFormMixinx> textEditingController = StreamController();
  
  /* Create a method named setInputData of type void and keep a named parameter called event of type ITextFormMixinx*/
  void setInputData({required ITextFormMixinx event}) {

    // Using the stream controller called textEditingController add the parameter value event into the stream.
    textEditingController.add(event);
  }

  /* Create a method named closeStream of type void to close the pop up screen and navigate to the previous screen*/
  void closeStream() {
    
    // close the stream named textEditingController using .close method.
    textEditingController.close();
  }
}

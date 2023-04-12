// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:data_api_crud/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:data_api_crud/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:data_api_crud/Helpers/Mixins/PopUpMixin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:data_api_crud/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// Create a screen named HomeScreen using satateful widget
class HomeScreen extends StatefulWidget {
  // Create a variable named extraData of object type.
  final Object extraData;

  /* Create a constructor method named HomeScreen which has required named parameter of its class members*/
  const HomeScreen({super.key, required this.extraData});

  // Create state for the screen HomeScreen
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Create an instance named _homeScreenVM for the class HomeScreenVM.
  final HomeScreenVM _homeScreenVM = HomeScreenVM();

  // Create a controller named _newAvengerController for the input feild that gets new avenger name as input.
  final TextEditingController _newAvengerController = TextEditingController();

  // Create a controller named _editAvengerController for the input feild that is used to edit avenger name.
  final TextEditingController _editAvengerController = TextEditingController();

  @override
  void initState() {
    // Using Super keyword call the parent initState method.
    super.initState();

    // Listen to the stream using the stream controller named navigationStream using instance _homeScreenVM.
    _homeScreenVM.navigationStream.stream.listen((event) {
      // Check whether the listened event is equal to NavigatorPop
      if (event is NavigatorPop) {
        // Using context.pop() navigate to the prevoius page.
        context.pop();
      }
    });

    // Listen to the stream using the stream controller named popUpController using instance _homeScreenVM.
    _homeScreenVM.popUpController.stream.listen((event) {
      // Check whether the event is PopUpData
      if (event is PopUpData) {
        // Using swicth check whether the data from event is at index 1.
        switch (event.data[1]) {
          // If the data from event is showNewAvengerPopUp
          case 'showNewAvengerPopUp':

            // Call the method named showNewAvengerPopUp.
            showNewAvengerPopUp();

            // Assing the value '' to the text editing controller named _newAvengerController.
            _newAvengerController.text = '';

            // stop the execution
            break;

          // If the data from event is editAvengerPopUp
          case 'editAvengerPopUp':

            // Call the method named editAvengerPopUp and pass the value at 0th index from the event.
            editAvengerPopUp(event.data[0]);

            // Assign the value name from the list allAvenger at the index got from stream data by parsing it to string.
            _editAvengerController.text =
                _homeScreenVM.allAvenger[event.data[0]].name.toString();

            // stop the execution
            break;
        }
      }
    });

    // Using the instance named _homeScreenVM call the method named getAllAvengersData to automatically initiate the api call.
    _homeScreenVM.getAllAvengersData();
  }

  @override
  void dispose() {
    // Dispose the TextEditingController using .dispose method.
    _editAvengerController.dispose();

    // Dispose the TextEditingController using .dispose method.
    _newAvengerController.dispose();

    // Using instance named _eventDetailsVM close the stream using .close() method.
    _homeScreenVM.dispose();

    // Using instance named _eventDetailsVM call the method named closePopUpMixin to close the stream.
    _homeScreenVM.closePopUpStream();

    // call the parent dispose method.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "API calls and crud operations",
          style: GoogleFonts.aBeeZee(),
        ),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _homeScreenVM.newAvengerPopUp();
          },
          icon: const Icon(Icons.add_rounded),
          label: Text(
            "Add new avenger",
            style: GoogleFonts.aBeeZee(),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Avengers list",
              style: GoogleFonts.aBeeZee(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (context) {
              return Visibility(

                  // Assing the value of loadingStatus using the instance _homeScreenVM.
                  visible: _homeScreenVM.loadingStatus,
                  child: const Center(child: CircularProgressIndicator()));
            }),
            Observer(builder: (context) {
              return Visibility(
                // Assing the value of loadingStatus using the instance _homeScreenVM.
                visible: !_homeScreenVM.loadingStatus,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  // Iterate till the lenght of the list named allAvenger using the instance _homeScreenVM.
                  itemCount: _homeScreenVM.allAvenger.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading:

                          // Build a text widget using value in the list named allAvenger at the particular index.
                          Text(
                        _homeScreenVM.allAvenger[index].id.toString(),
                        style: GoogleFonts.aBeeZee(),
                      ),
                      title:

                          // Build a text widget using value in the list named allAvenger at the particular index.
                          Text(
                        _homeScreenVM.allAvenger[index].name.toString(),
                        style: GoogleFonts.aBeeZee(),
                      ),
                      trailing: SizedBox(
                        height: 50,
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // Call the method named editAvengerPopUp and pass the values to required named parameter.
                                  _homeScreenVM.editAvengerPopUp(index: index);
                                },
                                icon: const Icon(Icons.edit_rounded,color: Colors.green)),
                            IconButton(
                                onPressed: () {
                                  // Call the method named deleteAnAvengerData and pass the values to required named parameter.
                                  _homeScreenVM.deleteAnAvengerData(
                                      index: index);
                                },
                                icon: const Icon(Icons.delete_rounded, color: Colors.red,))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  /* Create a method named showNewAvengerPopUp of type void to show pop to create a new avenger.*/
  void showNewAvengerPopUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Enter the name of new avenger',
              style: GoogleFonts.aBeeZee(),
            ),
            content: TextFormField(
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.aBeeZee(),

              // Assing the instance created for the TextEditingController for controller parameter.
              controller: _newAvengerController,
              decoration: InputDecoration(
                helperText: 'Please enter the name of the avenger',
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 330),
                label: Text(
                  "Name",
                  style: GoogleFonts.aBeeZee(),
                ),
                hintText: 'Enter the avenger name',
                hintStyle: GoogleFonts.aBeeZee(),
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    // Call the method named createAnNewAvenger using the instance _homeScreenVM and pass the required parameter values.
                    _homeScreenVM.createAnNewAvenger(
                        name: _newAvengerController.text);
                  },
                  child: Text("Save", style: GoogleFonts.aBeeZee())),
              ElevatedButton(
                  onPressed: () {
                    // Call the method named navigateToPreviousScreen using the instance _homeScreenVM.
                    _homeScreenVM.navigateToPreviousScreen();
                  },
                  child: Text("Cancel", style: GoogleFonts.aBeeZee()))
            ],
          );
        });
  }

  /* Create a method named editAvengerPopUp of type void with a required parameter named index 
  to show pop to edit an existing avenger.*/
  void editAvengerPopUp(int index) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Edit the avenger name',
              style: GoogleFonts.aBeeZee(),
            ),
            content: TextFormField(
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.aBeeZee(),

              // Assing the instance created for the TextEditingController for controller parameter.
              controller: _editAvengerController,
              decoration: InputDecoration(
                helperText: 'Please enter the name of the avenger',
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 330),
                label: Text(
                  "Name",
                  style: GoogleFonts.aBeeZee(),
                ),
                hintText: 'Enter the avenger name',
                hintStyle: GoogleFonts.aBeeZee(),
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    // Call the method named editAvengerData using the instance _homeScreenVM and pass the required parameter values.
                    _homeScreenVM.editAvengerData(
                        index: index, name: _editAvengerController.text);
                  },
                  child: Text("Save", style: GoogleFonts.aBeeZee())),
              ElevatedButton(
                  onPressed: () {
                    // Call the method named navigateToPreviousScreen using the instance _homeScreenVM.
                    _homeScreenVM.navigateToPreviousScreen();
                  },
                  child: Text("Cancel", style: GoogleFonts.aBeeZee()))
            ],
          );
        });
  }
}



















// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
// import 'package:api/Helpers/AppNavigations/NavigationHelpers.dart';
// import 'package:api/Helpers/Mixins/PopUpMixin.dart';
// import 'package:api/Helpers/Mixins/TextFormMixin.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:api/Pages/HomeScreen/HomeScreenVM.dart';
// import 'package:flutter/material.dart';

// import '../../Helpers/AppNavigations/NavigationMixin.dart';

// class HomeScreen extends StatefulWidget {
//   final Object extraData;
//   const HomeScreen({Key? key, required this.extraData}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// final HomeScreenVM _homeScreenVM = HomeScreenVM();
// final TextEditingController _newAvengerNameField = TextEditingController();
// final TextEditingController _editAvengerNameField = TextEditingController();

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _homeScreenVM.textEditingController.stream.listen((event) {
//       if (event is TextFeildData) {
//         _editAvengerNameField.text = _homeScreenVM.hero;
//       }
//     });
//     _homeScreenVM.popUpController.stream.listen((event) {
//       if (event is PopUpData) {
//         switch (event.data[0]) {
//           case 'showNewAvengerPopUp':
//             showNewAvengerPopUp();
//             _newAvengerNameField.text = '';
//             break;
//           case 'editAvengerPopUp':
//             editAvengerPopUp(event.data[1]);
//             _editAvengerNameField.text =
//                 _homeScreenVM.allAvenger[event.data[1]].name.toString();
//             break;
//           default:
//         }
//       }
//     });
//     _homeScreenVM.navigationStream.stream.listen((event) {
//       if (event is NavigatorPop) {
//         context.pop();
//       }
//     });
//     _homeScreenVM.allAvengerDetails();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dashboard"),
//         actions: const [],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           _homeScreenVM.popUps(0);
//         },
//         label: const Text('Add new avenger'),
//         icon: const Icon(Icons.add_rounded),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // ElevatedButton(onPressed: (){_homeScreenVM.allAvengerDetails();}, child: Text("click")),
//             Observer(builder: (context) {
//               return Visibility(
//                   visible: _homeScreenVM.loadingStatus,
//                   child: const CircularProgressIndicator());
//             }),
//             Observer(builder: (context) {
//               return Visibility(
//                 visible: !_homeScreenVM.loadingStatus,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: _homeScreenVM.allAvenger.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       leading:
//                           Text(_homeScreenVM.allAvenger[index].id.toString()),
//                       title:
//                           Text(_homeScreenVM.allAvenger[index].name.toString()),
//                       trailing: SizedBox(
//                         height: 50,
//                         width: 100,
//                         child: Row(
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   _homeScreenVM.editPopUps(index: index);
//                                   // _homeScreenVM.onClickOfEdit(index: index);
//                                   // _homeScreenVM.editAnAvenger(index: index);
//                                 },
//                                 icon: const Icon(Icons.edit_rounded)),
//                             IconButton(
//                                 onPressed: () {
//                                   _homeScreenVM.deleteAnAvenger(index: index);
//                                 },
//                                 icon: const Icon(Icons.delete_rounded))
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   void showNewAvengerPopUp() {
//     showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Enter the name of new avenger'),
//             content: TextFormField(
//               controller: _newAvengerNameField,
//             ),
//             actions: [
//               ElevatedButton(
//                   onPressed: () {
//                     _homeScreenVM.newAvenger(
//                         heroName: _newAvengerNameField.text);
//                   },
//                   child: const Text("Save")),
//               ElevatedButton(
//                   onPressed: () {
//                     _homeScreenVM.navigateToPreviousScreen();
//                   },
//                   child: const Text("Cancel"))
//             ],
//           );
//         });
//   }

//   void editAvengerPopUp(int index) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Edit the avenger name'),
//             content: TextFormField(
//               controller: _editAvengerNameField,
//             ),
//             actions: [
//               ElevatedButton(
//                   onPressed: () {
//                     _homeScreenVM.editAnAvenger(
//                         index: index, heroName: _editAvengerNameField.text);
//                   },
//                   child: const Text("Save")),
//               ElevatedButton(
//                   onPressed: () {
//                     _homeScreenVM.navigateToPreviousScreen();
//                   },
//                   child: const Text("Cancel"))
//             ],
//           );
//         });
//   }
// }

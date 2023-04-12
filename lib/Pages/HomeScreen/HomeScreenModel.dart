import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../BO/AvengerBO/AvengerBO.dart';
import '../../Helpers/AppNavigations/NavigationMixin.dart';
import '../../Helpers/Mixins/PopUpMixin.dart';
import '../../Helpers/Mixins/TextFormMixin.dart';
import '../../Services/AvengerServices/IAvengerService.dart';
part 'HomeScreenModel.g.dart';

// Create a class named HomeScreenModel and add mixins named PopUpMixin, PopUpMixin, TextFormMixinx, NavigationMixin.
class HomeScreenModel = _HomeScreenModelBase
    with _$HomeScreenModel, PopUpMixin, TextFormMixinx, NavigationMixin;

abstract class _HomeScreenModelBase with Store {

  // Create an instance for get it named avengerService and get the required service. 
  final avengerService = GetIt.instance.get<IAvengerService>();

  // Create a observable variable named loadingStatus of type boolean and assign false to it.
  @observable
  bool loadingStatus = false;

  /* Create a method named setLoadingStatus which has a required named parameter called loadingStatus*/
  @action
  void setLoadingStatus({required bool loadingStatus}) =>

      // Assing the value of paramter named loadingStatus to the call member loadingStatus
      this.loadingStatus = loadingStatus;
  
  
  // Create a observable List of type AvengerBO named allAvenger
  @observable
  List<AvengerBO> allAvenger = [];

  /* Create a method named setDataTAllAvengerList of type void which has a required named parameter that 
  takes list as a input.  */
  @action
  void setDataTAllAvengerList({required List<AvengerBO> avengerDetails}) {

    // Empty the list named allAvenger.
    allAvenger = [];

    // Assign the list named avengerDetails to the list named allAvenger
    allAvenger = avengerDetails;
  }
}
























 // @observable
  // String hero = '';
  // @action
  // setHero({required String hero}) => this.hero = hero;
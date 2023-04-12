
import '../../BO/AvengerBO/AvengerBO.dart';
import '../../Helpers/APIHandlerHelper/APIHandlerHelper.dart';

// Create a abstract class named IAvengerService
abstract class IAvengerService {

  /* Create a abstract method named  getAllAvengers of type Future<ServiceResult<List<AvengerBO>>>*/
  Future<ServiceResult<List<AvengerBO>>> getAllAvengers();

  /* Create a abstract method named  editAnAvenger   of type Future<ServiceResult<List<AvengerBO>>> with a
   named parameter editHero of type AvengerBO*/
  Future<ServiceResult<List<AvengerBO>>> editAnAvenger({required AvengerBO editHero});

  /* Create a abstract method named  deleteAnAvenger of type Future<ServiceResult<List<AvengerBO>>> with a 
  named parameter deleteHero of type AvengerBO*/
  Future<ServiceResult<List<AvengerBO>>> deleteAnAvenger({required AvengerBO deleteHero});

  /* Create a abstract method named  createNewAvenger of type <ServiceResult<AvengerBO>> with a named 
  parameter newHeroName of type AvengerBO*/
  Future<ServiceResult<AvengerBO>> createNewAvenger({required AvengerBO newHeroName});
}

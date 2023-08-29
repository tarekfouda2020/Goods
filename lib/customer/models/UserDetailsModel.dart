
 // ignore_for_file: file_names
 
import 'AdOwnerModel.dart';
import 'AdsModel.dart';

class UserDetailsModel {
  UserDetailsModel({required this.ads, required this.userData});

  List<AdsModel> ads;
  AdOwnerModel userData;
}


 // ignore_for_file: file_names
 
import '../../../general/utilities/moor_db/db.dart';

class CategoryChildModel{
   List<Category> cats;
   int parentId;

  CategoryChildModel({required this.cats,required this.parentId});
}
import 'package:ai_score/provider/base_provider.dart';

import '../json/category_list.dart';
import '../model/category_list_model.dart';

class CategoryScreenProvider extends BaseProvider{

  List<CategoryList> categoryList = [];
  String categoryDropDownValue = "";
  String nameOfCategory ="";
  String? categoryDropDownValueId;

  getCategoryData() {
    var response = CategoryListModel.fromJson(categoryData);
    categoryList.addAll(response.categoryList);
    categoryDropDownValue = categoryList[0].categoryNumber!;
  }
  onSelected(value) {
    categoryDropDownValue = value;
    notifyListeners();
  }








}
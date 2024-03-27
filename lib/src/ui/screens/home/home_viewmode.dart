import 'package:flutter/material.dart';
import 'package:task/src/core/models/coments_model.dart';
import 'package:task/src/core/services/api_service.dart';
import 'package:task/src/utils/toast.dart';

class HomeProvider extends ChangeNotifier {
  late ApiService apiService;
  List<CommentModel> list = [];
  bool isLoading = false;
  HomeProvider(this.apiService) {
    getComment();
  }

// get all comments
  void getComment() async {
    isLoading = true;
    try {
      list = await apiService.getComment();
      isLoading = false;
    } catch (e) {
      isLoading = false;
      Toast.showToast(text: e.toString());
    }
    notifyListeners();
  }

// delete comment
  void deleteComment(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}

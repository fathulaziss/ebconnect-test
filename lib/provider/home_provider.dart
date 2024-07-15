import 'package:ebconnect_test/models/home_menu_model.dart';
import 'package:ebconnect_test/models/resolution_data_model.dart';
import 'package:ebconnect_test/models/restore_data_model.dart';
import 'package:ebconnect_test/repository/home_repository.dart';
import 'package:ebconnect_test/widgets/show_dialog.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<HomeMenuModel> _listMenu = [];

  List<HomeMenuModel> get listMenu => _listMenu;

  RestoreDataModel _restoreData = RestoreDataModel();

  RestoreDataModel get restoreData => _restoreData;

  ResolutionDataModel _resolutionData = ResolutionDataModel();

  ResolutionDataModel get resolutionData => _resolutionData;

  Future<void> fetchMenu(BuildContext context) async {
    await HomeRepository.fetchMenu(
      onSuccess: (List<HomeMenuModel> data) {
        _listMenu = data;
        notifyListeners();
      },
      onError: (String errorMessage) {
        showToast(context, message: errorMessage);
      },
    );
  }

  void setRestoreData(dynamic value) {
    if (value != null) {
      _restoreData = value;
      notifyListeners();
    }
  }

  void setResolutionData(dynamic value) {
    if (value != null) {
      _resolutionData = value;
      notifyListeners();
    }
  }
}

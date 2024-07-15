import 'dart:developer';

import 'package:ebconnect_test/models/home_menu_model.dart';
import 'package:ebconnect_test/services/database_service.dart';
import 'package:flutter/material.dart';

class HomeRepository {
  static Future<void> fetchMenu({
    required ValueSetter<List<HomeMenuModel>> onSuccess,
    required ValueSetter<String> onError,
  }) async {
    try {
      final dbConnection = await DatabaseService.createConnection();
      final res = await dbConnection.query(
        'SELECT * FROM group_question WHERE company_id =? AND deleted_at is NULL AND is_pmt =? AND parent_id is null ORDER BY parent_id DESC, ordering',
        [27, false],
      );

      if (res.isNotEmpty) {
        final listMenu = <HomeMenuModel>[];
        for (var item in res) {
          listMenu.add(HomeMenuModel.fromMap(item.fields));
        }
        onSuccess(listMenu);
        log("check listMenu : $listMenu");
      } else {
        onError("Data Kosong");
      }
    } catch (e) {
      onError("$e");
      log('Error fetchMenu : $e');
      rethrow;
    }
  }
}

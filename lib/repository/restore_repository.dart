import 'dart:developer';

import 'package:ebconnect_test/models/restore_form_model.dart';
import 'package:ebconnect_test/services/database_service.dart';
import 'package:flutter/material.dart';

class RestoreRepository {
  static Future<void> fetchForm({
    required int groupQuestionId,
    required ValueSetter<List<RestoreFormModel>> onSuccess,
    required ValueSetter<String> onError,
  }) async {
    try {
      final dbConnection = await DatabaseService.createConnection();

      final res = await dbConnection.query(
        'SELECT * FROM group_question WHERE company_id =? AND deleted_at is NULL AND is_pmt =? AND parent_id =? ORDER BY parent_id DESC, ordering',
        [27, false, groupQuestionId],
      );

      if (res.isNotEmpty) {
        final listForm = <RestoreFormModel>[];
        for (var item in res) {
          listForm.add(RestoreFormModel.fromMap(item.fields));
        }
        onSuccess(listForm);
        log("check listForm : $listForm");
      } else {
        onError("Data Kosong");
      }
    } catch (e) {
      onError("$e");
      log('Error fetchForm Restore : $e');
      rethrow;
    }
  }
}

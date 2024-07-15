import 'dart:developer';

import 'package:ebconnect_test/models/resolution_form_model.dart';
import 'package:ebconnect_test/services/database_service.dart';
import 'package:flutter/material.dart';

class ResolutionRepository {
  static Future<void> fetchForm({
    required int groupQuestionId,
    required ValueSetter<List<ResolutionFormModel>> onSuccess,
    required ValueSetter<String> onError,
  }) async {
    try {
      final dbConnection = await DatabaseService.createConnection();

      final res = await dbConnection.query(
        'SELECT * FROM group_question WHERE company_id =? AND deleted_at is NULL AND is_pmt =? AND parent_id =? ORDER BY parent_id DESC, ordering',
        [27, false, groupQuestionId],
      );

      if (res.isNotEmpty) {
        final listForm = <ResolutionFormModel>[];
        for (var item in res) {
          listForm.add(ResolutionFormModel.fromMap(item.fields));
        }
        onSuccess(listForm);
        log("check listForm : $listForm");
      } else {
        onError("Data Kosong");
      }
    } catch (e) {
      onError("$e");
      log('Error fetchForm Resolution : $e');
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:ebconnect_test/models/restore_data_model.dart';
import 'package:ebconnect_test/models/restore_form_model.dart';
import 'package:ebconnect_test/repository/restore_repository.dart';
import 'package:ebconnect_test/services/camera_service.dart';
import 'package:ebconnect_test/services/location_service.dart';
import 'package:ebconnect_test/services/navigation_service.dart';
import 'package:ebconnect_test/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class RestoreProvider extends ChangeNotifier {
  List<RestoreFormModel> _listFormModel = [];

  List<RestoreFormModel> get listFormModel => _listFormModel;

  String _address = '';

  String get address => _address;

  double _latitude = 0;

  double get latitude => _latitude;

  double _longitude = 0;

  double get longitude => _longitude;

  String _date = '';

  String get date => _date;

  String _time = '';

  String get time => _time;

  String _description = '';

  String get description => _description;

  final List<String> _photos = [];

  List<String> get photos => _photos;

  Future<void> fetchForm(
    BuildContext context, {
    required int groupQuestionId,
  }) async {
    await RestoreRepository.fetchForm(
      groupQuestionId: groupQuestionId,
      onSuccess: (List<RestoreFormModel> data) {
        _listFormModel = data;
        notifyListeners();
      },
      onError: (String errorMessage) {
        showToast(context, message: errorMessage);
      },
    );
  }

  Future<void> checkIn(BuildContext context) async {
    final result = await LocationService.getLocation();
    if (result != null) {
      _latitude = result.latitude ?? 0;
      _longitude = result.longitude ?? 0;
      try {
        final placemarks =
            await placemarkFromCoordinates(_latitude, _longitude);

        if (placemarks.isNotEmpty) {
          _address =
              '${placemarks[0].street}${placemarks[0].administrativeArea}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].country}';
        }
        final dateNow = DateTime.now();
        final dateConvert =
            DateFormat('dd-MMM-yyyy HH:mm:ss').format(dateNow).split(' ');
        _date = dateConvert[0];
        _time = dateConvert[1];

        if (context.mounted) {
          showDialogCheckIn(
            context,
            title: "Check In",
            address: address,
            latitude: latitude,
            longitude: longitude,
            date: date,
            time: time,
          );
        }

        notifyListeners();
        log('latitude : $latitude\nlongitude : $longitude\naddress : $address\ndate : $date\ntime : $time');
      } catch (e) {
        if (context.mounted) {
          showToast(
            context,
            message: "Check In Gagal, Gagal Mendapatkan Adress",
            backgroundColor: Colors.red,
          );
        }
      }
    }
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  Future<void> takePhoto(BuildContext context) async {
    if (photos.length < 20) {
      final result = await CameraService.takePhoto();
      if (result != null) {
        _photos.add(result);
        notifyListeners();
      }
    } else {
      showToast(
        context,
        message: 'Maximal 20 photos',
        backgroundColor: Colors.yellow,
      );
    }
  }

  void save(BuildContext context) {
    if (address.isEmpty) {
      showToast(
        context,
        message: "Belum melakukan Check In / Gagal Check In",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    if (description.isEmpty) {
      showToast(
        context,
        message: "Belum mengisi deskripsi",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    if (photos.isEmpty) {
      showToast(
        context,
        message: "Belum melakukan foto",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    final data = RestoreDataModel(
      address: address,
      latitude: latitude,
      longitude: longitude,
      date: date,
      time: time,
      description: description,
      photos: photos,
    );

    NavigationService.pop(result: data);
  }
}

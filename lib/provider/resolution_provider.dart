import 'dart:developer';

import 'package:ebconnect_test/models/resolution_data_model.dart';
import 'package:ebconnect_test/models/resolution_form_model.dart';
import 'package:ebconnect_test/repository/resolution_repository.dart';
import 'package:ebconnect_test/services/location_service.dart';
import 'package:ebconnect_test/services/navigation_service.dart';
import 'package:ebconnect_test/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class ResolutionProvider extends ChangeNotifier {
  List<ResolutionFormModel> _listFormModel = [];

  List<ResolutionFormModel> get listFormModel => _listFormModel;

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

  List<String> _listSiteVisitPurpose = ['Investigasi', 'Koordinasi', 'Escort'];

  List<String> get listSiteVisitPurpose => _listSiteVisitPurpose;

  String _selectSiteVisitPurpose = '';

  String get selectSiteVisitPurpose => _selectSiteVisitPurpose;

  String _name = '';

  String get name => _name;

  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  List<String> _roles = ['Investigasi', 'Koordinasi', 'Escort'];

  List<String> get roles => _roles;

  String _selectRole = '';

  String get selectRole => _selectRole;

  String _activityLog = '';

  String get activityLog => _activityLog;

  List<String> _listSiteAccessible = ['Yes', 'No'];

  List<String> get listSiteAccessible => _listSiteAccessible;

  String _selectSiteAccessible = '';

  String get selectSiteAccessible => _selectSiteAccessible;

  Future<void> fetchForm(
    BuildContext context, {
    required int groupQuestionId,
  }) async {
    await ResolutionRepository.fetchForm(
      groupQuestionId: groupQuestionId,
      onSuccess: (List<ResolutionFormModel> data) {
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

  void setSelectedSiteVisitPurpose(Object? value) {
    if (value != null) {
      final data = value as String;
      _selectSiteVisitPurpose = data;
      notifyListeners();
    }
  }

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setSelectedRole(Object? value) {
    if (value != null) {
      final data = value as String;
      _selectRole = data;
      notifyListeners();
    }
  }

  void setLogActivity(String value) {
    _activityLog = value;
    notifyListeners();
  }

  void setSelectedSiteAccessible(Object? value) {
    if (value != null) {
      final data = value as String;
      _selectSiteAccessible = data;
      notifyListeners();
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

    if (selectSiteVisitPurpose.isEmpty) {
      showToast(
        context,
        message: "Belum memilih Site Visit Purpose",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    if (name.isEmpty) {
      showToast(
        context,
        message: "Belum mengisi nama",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    if (phoneNumber.isEmpty) {
      showToast(
        context,
        message: "Belum mengisi nomor telepon",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    if (selectRole.isEmpty) {
      showToast(
        context,
        message: "Belum memilih Role",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    if (activityLog.isEmpty) {
      showToast(
        context,
        message: "Belum mengisi Activity Log",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    if (selectSiteAccessible.isEmpty) {
      showToast(
        context,
        message: "Belum memilih Is Site Accessible",
        backgroundColor: Colors.yellow,
      );
      return;
    }

    final data = ResolutionDataModel(
      address: address,
      latitude: latitude,
      longitude: longitude,
      date: date,
      time: time,
      siteVisitPurpose: selectSiteVisitPurpose,
      name: name,
      phoneNumber: phoneNumber,
      role: selectRole,
      activityLog: activityLog,
      isSiteAccessible: selectSiteAccessible,
    );

    NavigationService.pop(result: data);
  }
}

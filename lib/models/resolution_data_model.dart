class ResolutionDataModel {
  ResolutionDataModel({
    this.address,
    this.latitude,
    this.longitude,
    this.date,
    this.time,
    this.siteVisitPurpose,
    this.name,
    this.phoneNumber,
    this.role,
    this.activityLog,
    this.isSiteAccessible,
  });

  String? address;
  double? latitude;
  double? longitude;
  String? date;
  String? time;
  String? siteVisitPurpose;
  String? name;
  String? phoneNumber;
  String? role;
  String? activityLog;
  String? isSiteAccessible;

  @override
  String toString() {
    return 'ResolutionDataModel(address: $address, latitude: $latitude, longitude: $longitude, date: $date, time: $time, site_visit_purpose: $siteVisitPurpose, name: $name, phone_number: $phoneNumber, role: $role, activity_log: $activityLog, is_site_accessible: $isSiteAccessible)';
  }
}

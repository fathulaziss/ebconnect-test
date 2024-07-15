class RestoreDataModel {
  RestoreDataModel({
    this.address,
    this.latitude,
    this.longitude,
    this.date,
    this.time,
    this.description,
    this.photos,
  });

  String? address;
  double? latitude;
  double? longitude;
  String? date;
  String? time;
  String? description;
  List<String>? photos;

  @override
  String toString() {
    return 'RestoreDataModel(address: $address, latitude: $latitude, longitude: $longitude, date: $date, time: $time, description: $description, photos: $photos)';
  }
}

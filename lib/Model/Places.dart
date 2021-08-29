
class Place{
  String? placeId;
  String? placeTitle;
  String? categoryTitle;
  String? address;
  String? phone;
  String? website;
  int? distance;
  String? coverPhotoUrl;
  double? latitude;
  double? longitude;

  Place({
    this.placeId,
    this.placeTitle,
    this.categoryTitle,
    this.address,
    this.phone,
    this.website,
    this.distance,
    this.coverPhotoUrl,
    this.latitude,
    this.longitude
  });

  Place.fromJson(Map<String, dynamic> json){
    placeId = json['placeId'];
    placeTitle = json['placeTitle'];
    categoryTitle = json['categoryTitle'];
    address = json['address'];
    phone = json['phone'];
    website = json['website'];
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

}
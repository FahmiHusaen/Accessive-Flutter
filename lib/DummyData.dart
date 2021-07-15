import 'package:flutter_appbb/Model/PlaceFacility.dart';

import 'Model/placeCategory.dart';

List<PlaceFacility> PlaceFacilityFilterDummyList = [
  PlaceFacility(placeFacilityId: "xxx01", facilityTypeName: "Ramp",
      facilityTypeAvailableIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp%20Icon.png?alt=media&token=b2b20116-2dac-4f08-b193-7e0cc982b740",
      facilityTypeDesc: "Derajat bidang miring 30 derajat dengan lebar minimal 750 mm"),
  PlaceFacility(placeFacilityId: "xxx02", facilityTypeName: "Elevator",
      facilityTypeAvailableIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator%20Icon.png?alt=media&token=52e9f3ad-e55a-4631-9737-a274d29371b5",
      facilityTypeDesc: "Ruang manuver 150 x 150 cm"),
  PlaceFacility(placeFacilityId: "xxx01", facilityTypeName: "Toilet Aksesibel",
      facilityTypeAvailableIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FRamp%20Icon.png?alt=media&token=b2b20116-2dac-4f08-b193-7e0cc982b740",
      facilityTypeDesc: "Toilet yang dapat diakses dengan akses tanpa tangga dan ruang manuver 150cm x 150cm. Lebar bukaan pintu minimal 75cm. Ruang transfer dengan rel dropdown tersedia dan rel pegangan yang dipasang di dinding di kedua sisi toilet."
  ),
  PlaceFacility(placeFacilityId: "xxx02", facilityTypeName: "Tampat Parkir",
      facilityTypeAvailableIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/Access%20Facility%20Icon%2FElevator%20Icon.png?alt=media&token=52e9f3ad-e55a-4631-9737-a274d29371b5",
      facilityTypeDesc: "Parkir dalam, memiliki kapasitas beberapa kendaraan roda 4 / memiliki tanda biru khusus disabilitas."
  ),
];

final List<PlaceCategory> placeCategoryDummyList = [
  PlaceCategory(categoryName: "Rumah Sakit", categoryId: 001),
  PlaceCategory(categoryName: "Restoran", categoryId: 002),
  PlaceCategory(categoryName: "Toko", categoryId: 003),
  PlaceCategory(categoryName: "Tempat Wisata", categoryId: 001),
  PlaceCategory(categoryName: "Universitas", categoryId: 002),
  PlaceCategory(categoryName: "Museum", categoryId: 003),
  PlaceCategory(categoryName: "SPBU", categoryId: 001),
  PlaceCategory(categoryName: "ATM", categoryId: 002),
  PlaceCategory(categoryName: "Hotel", categoryId: 003)
];
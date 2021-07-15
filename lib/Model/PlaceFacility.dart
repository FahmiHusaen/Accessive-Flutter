import 'package:meta/meta.dart';

class PlaceFacility{
  final String? placeFacilityId;
  final String? facilityTypeName;
  final String? facilityTypeAvailableIcon;
  final String? facilityTypeDesc;
  bool isChecked;

  PlaceFacility({
    @required this.placeFacilityId,
    @required this.facilityTypeName,
    @required this.facilityTypeAvailableIcon,
    @required this.facilityTypeDesc,
    this.isChecked = false
  });

}
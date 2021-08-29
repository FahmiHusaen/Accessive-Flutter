import 'package:meta/meta.dart';

class Facility{
  String? facilityId;
  String? facilityTypeTitle;
  String? facilityTypeDesc;
  String? facilityTypeIcon;
  String? facilityTypeCode;
  bool isChecked = false;

  Facility({
    this.facilityId,
    this.facilityTypeTitle,
    this.facilityTypeDesc,
    this.facilityTypeIcon,
    this.facilityTypeCode
  });

  Facility.clone(Facility newPlaceFacility){
  this.facilityId = newPlaceFacility.facilityId;
  this.facilityTypeTitle = newPlaceFacility.facilityTypeTitle ;
  this.facilityTypeDesc = newPlaceFacility.facilityTypeDesc;
  this.facilityTypeIcon = newPlaceFacility.facilityTypeIcon;
  this.facilityTypeCode = newPlaceFacility.facilityTypeCode;
  this.isChecked = newPlaceFacility.isChecked;
  }

}
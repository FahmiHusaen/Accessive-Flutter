import 'package:flutter_appbb/Model/Facility.dart';

import 'Model/Guide.dart';
import 'Model/Places.dart';
import 'Model/Category.dart';

List<Facility> PlaceFacilityFilterDummyList = [
  Facility(facilityId: "xxx01", facilityTypeTitle: "Ramp",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F1.ramp.png?alt=media&token=32dffd49-a4a3-4747-8f28-cc92e08d4946",
      facilityTypeDesc: "Bidang miring tanpa step untuk ketempat lebih tinggi.", facilityTypeCode: "edd2"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Elevator",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F4.elevator.png?alt=media&token=3341ab97-3f0f-4e48-9ca1-d7ae5c858f4e",
      facilityTypeDesc: "Elevator / Lift untuk naik ke lantai atas.", facilityTypeCode: "e212"),
  Facility(facilityId: "xxx01", facilityTypeTitle: "Parkir Disabilitas",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F7.disability-parking.png?alt=media&token=8062aa18-3d5c-4ec4-818c-08cd1b1ee4a7",
      facilityTypeDesc: "Parkir dengan tanda biru khusus untuk disabilitas.",
      facilityTypeCode: "rf89"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Parkir Luar",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F8.outside-parking.png?alt=media&token=c4d47eb8-7b18-4358-9bcb-e0f43b7378aa",
      facilityTypeDesc: "Parkir di luar atau di jalan sekitar lokasi.",
      facilityTypeCode: "w245"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Titik Pengantaran",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F12.drop-off-point.png?alt=media&token=3298bc98-031f-4d85-8837-70d0d522309d",
      facilityTypeDesc: "Titik untuk menurunkan penumpang sementara.",
      facilityTypeCode: "w245"),
];

final List<Guide> UGMGuideList = [
  Guide("xxx01", "Lokasi Tempat",
       "Berada di Timur Jalan Kolektor" + "\n\nTempat terlihat sangat familiar" + "\n\nTerdapat Pedestrian di sekitar lokasi",
      "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-guide-icon-accessive%2F1.location.png?alt=media&token=9aad8c67-8136-4e7f-bb7e-d5e496053e7b",
      [
        'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FLokasi%20Tempat%20(2).jpg?alt=media&token=55843858-1403-4a71-87c6-b46447f6c095',
        'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FLokasi%20Tempat%20(3).jpg?alt=media&token=61b6679d-2837-46bd-99ee-15ce6a96524e',
      ]
  ),
  Guide("xxx02", "Parkir",
      "Parkir Luas" + "\n\nBerada di selatan dan utara lokasi",
      "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-guide-icon-accessive%2F2.parking.png?alt=media&token=1438a999-9949-46bd-9df0-c0af5f26ffef",
      [
        'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FParkir.jpg?alt=media&token=0d3d2146-b732-4879-a219-d0c7c33dca82',
        'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FParkir%203.jpg?alt=media&token=a4d4b801-3c63-43fe-a389-7dacac605957',
      ]
  ),
  Guide("xxx01", "Pintu Masuk",
      "Terdapat tangga dengan 11 step \n\nPintu manual \n\nTerdapat Ramp \n\nPintu masuk lebar",
      "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-guide-icon-accessive%2F3.entrance.png?alt=media&token=38e2f755-7843-44e2-be45-10c0a30d8bd8",
      [
        'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FPintu%20Masuk.jpg?alt=media&token=c56e0d58-b864-4a81-b868-3652cc94d4f7',
        'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FPintu%20Masuk%204.jpg?alt=media&token=32b75d37-8e96-433a-998d-d10631e841f9',
      ]
  ),
  Guide("xxx02", "Layanan Informasi", "Ketinggian loket tidak bisa dijangkau pengguna Kursi Roda \n\nTidak terdapat Ruang Tunggu \n\nLokasi berada di sayap utara",
      "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-guide-icon-accessive%2F4.front-office.png?alt=media&token=c1c20b08-e6ea-4b0b-99c6-77a8c0f3ed32",
      [
        'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FLayanan%20Informasi.jpg?alt=media&token=5ce4cf35-bfda-45fc-8928-8fc78deb33aa',
        'https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FLayanan%20Informasi%20(2).jpg?alt=media&token=dbf62304-8b08-43f0-8ea6-820350fea330',
      ]
  ),
];

final List<List<Guide>> GuideDummyList = [
  UGMGuideList, UGMGuideList, UGMGuideList
];

List<List<Facility>> RealFacilityDummyList = [
  UGMFacilityDummyList,
  GSPFacilityDummyList,
  FilsafatFacilityDummyList
];

List<Facility> UGMFacilityDummyList = [
  Facility(facilityId: "xxx01", facilityTypeTitle: "Ramp",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F1.ramp.png?alt=media&token=32dffd49-a4a3-4747-8f28-cc92e08d4946",
      facilityTypeDesc: "Bidang miring tanpa step untuk ketempat lebih tinggi.", facilityTypeCode: "edd2"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Elevator",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F4.elevator.png?alt=media&token=3341ab97-3f0f-4e48-9ca1-d7ae5c858f4e",
      facilityTypeDesc: "Elevator / Lift untuk naik ke lantai atas.", facilityTypeCode: "e212"),
  Facility(facilityId: "xxx01", facilityTypeTitle: "Parkir Disabilitas",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F7.disability-parking.png?alt=media&token=8062aa18-3d5c-4ec4-818c-08cd1b1ee4a7",
      facilityTypeDesc: "Parkir dengan tanda biru khusus untuk disabilitas.",
      facilityTypeCode: "rf89"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Parkir Luar",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F8.outside-parking.png?alt=media&token=c4d47eb8-7b18-4358-9bcb-e0f43b7378aa",
      facilityTypeDesc: "Parkir di luar atau di jalan sekitar lokasi.",
      facilityTypeCode: "w245"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Titik Pengantaran",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F12.drop-off-point.png?alt=media&token=3298bc98-031f-4d85-8837-70d0d522309d",
      facilityTypeDesc: "Titik untuk menurunkan penumpang sementara.",
      facilityTypeCode: "w245"),
];

List<Facility> GSPFacilityDummyList = [
  Facility(facilityId: "xxx01", facilityTypeTitle: "Ramp",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F1.ramp.png?alt=media&token=32dffd49-a4a3-4747-8f28-cc92e08d4946",
      facilityTypeDesc: "Bidang miring tanpa step untuk ketempat lebih tinggi.", facilityTypeCode: "edd2"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Toilet Aksesibel",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F2.toilet.png?alt=media&token=aae9d71c-cf7a-45ed-aa2c-00be3b56d1b0",
      facilityTypeDesc: "Toilet dengan ruang manuver luas.", facilityTypeCode: "e212"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Elevator",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F4.elevator.png?alt=media&token=3341ab97-3f0f-4e48-9ca1-d7ae5c858f4e",
      facilityTypeDesc: "Elevator / Lift untuk naik ke lantai atas.", facilityTypeCode: "e212"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Parkir Luar",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F8.outside-parking.png?alt=media&token=c4d47eb8-7b18-4358-9bcb-e0f43b7378aa",
      facilityTypeDesc: "Parkir di luar atau di jalan sekitar lokasi.",
      facilityTypeCode: "w245"
  ),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Titik Pengantaran",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F12.drop-off-point.png?alt=media&token=3298bc98-031f-4d85-8837-70d0d522309d",
      facilityTypeDesc: "Titik untuk menurunkan penumpang sementara.",
      facilityTypeCode: "w245"
  ),
];

List<Facility> FilsafatFacilityDummyList = [
  Facility(facilityId: "xxx01", facilityTypeTitle: "Ramp",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F1.ramp.png?alt=media&token=32dffd49-a4a3-4747-8f28-cc92e08d4946",
      facilityTypeDesc: "Bidang miring tanpa step untuk ketempat lebih tinggi.", facilityTypeCode: "edd2"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Toilet Aksesibel",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F2.toilet.png?alt=media&token=aae9d71c-cf7a-45ed-aa2c-00be3b56d1b0",
      facilityTypeDesc: "Toilet dengan ruang manuver luas.", facilityTypeCode: "e212"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Elevator",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F4.elevator.png?alt=media&token=3341ab97-3f0f-4e48-9ca1-d7ae5c858f4e",
      facilityTypeDesc: "Elevator / Lift untuk naik ke lantai atas.", facilityTypeCode: "e212"),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Parkir Luar",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F8.outside-parking.png?alt=media&token=c4d47eb8-7b18-4358-9bcb-e0f43b7378aa",
      facilityTypeDesc: "Parkir di luar atau di jalan sekitar lokasi.",
      facilityTypeCode: "w245"
  ),
  Facility(facilityId: "xxx02", facilityTypeTitle: "Titik Pengantaran",
      facilityTypeIcon: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/sample-new-facility-icon-accessive%2F12.drop-off-point.png?alt=media&token=3298bc98-031f-4d85-8837-70d0d522309d",
      facilityTypeDesc: "Titik untuk menurunkan penumpang sementara.",
      facilityTypeCode: "w245"
  ),
];

final List<Category> placeCategoryDummyList = [
  Category(categoryTitle: "Rumah Sakit", categoryId: 001, categoryCode: "2433", categoryIcon: "thisUrl"),
  Category(categoryTitle: "Restoran", categoryId: 002, categoryCode: "4324", categoryIcon: "thisUrl"),
  Category(categoryTitle: "Toko", categoryId: 003, categoryCode: "cx56", categoryIcon: "thisUrl"),
  Category(categoryTitle: "Tempat Wisata", categoryId: 003, categoryCode: "ghy5", categoryIcon: "thisUrl"),
  Category(categoryTitle: "Universitas", categoryId: 004, categoryCode: "66gg", categoryIcon: "thisUrl"),
  Category(categoryTitle: "Museum", categoryId: 005, categoryCode: "iij9", categoryIcon: "thisUrl"),
  Category(categoryTitle: "SPBU", categoryId: 006, categoryCode: "a124", categoryIcon: "thisUrl"),
  Category(categoryTitle: "ATM", categoryId: 007, categoryCode: "kp77", categoryIcon: "thisUrl"),
  Category(categoryTitle: "Hotel", categoryId: 008, categoryCode: "uio8", categoryIcon: "thisUrl"),
];

final List<Place> placeDummyList = [
  Place(placeId: "xxx01", placeTitle: "Universitas Gadjah Mada", categoryTitle: "Universitas",
      coverPhotoUrl: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FUGM%2FPintu%20Masuk%202.jpg?alt=media&token=3e246c33-dc78-4472-a0bd-4e3d9a4c2601",
      address: "Bulaksumur, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281", phone: "(0274) 6492599", website: "ugm.ac.id", distance: 21, latitude: 1.1, longitude: 1.1),
  Place(placeId: "xxx02", placeTitle: "Grha Sabha Pramana UGM", categoryTitle: "Auditorium",
      coverPhotoUrl: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FGSP%2FLokasi%20Tempat%20(2)%20(1).jpg?alt=media&token=cb892608-9318-4ca1-93e1-deb60b7b9ab0",
      address: "Jl. Sosio Humaniora No.1, Karang Malang, Caturtunggal, Kecamatan Depok, Kabupaten Sleman, DI Yogyakarta", phone: "(0274) 549659", website: "residence.ugm.ac.id/gsp", distance: 21, latitude: 1.1, longitude: 1.1),
  Place(placeId: "xxx03", placeTitle: "Fakultas Filsafat UGM", categoryTitle: "Rumah Sakit",
      coverPhotoUrl: "https://firebasestorage.googleapis.com/v0/b/accessive-655f9.appspot.com/o/guide-photos-accessive%2FFilsafat%2FLokasi%20Tempat.jpg?alt=media&token=fd516b06-a877-4e94-a924-f282cf572862",
      address: "Kronggahan, Gamping, Sleman, Yogyakarta", phone: "081215747812", website: "ugm.ac.id", distance: 21, latitude: 1.1, longitude: 1.1),
];
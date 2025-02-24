import 'package:get_it/get_it.dart';
import 'package:flymefy/core/di/locator.dart';
import 'package:flymefy/core/service/permission.dart';
import 'package:flymefy/core/service/pick_files.dart';
import 'package:flymefy/core/service/picker_photos.dart';


// addUpdatePropertyFactory() {
//   if (!GetIt.I.isRegistered<AddPropertyRepository>()) {
//     instance
//         .registerFactory<AddPropertyRepository>(() => AddPropertyRepositoryImpl(
//               clientApi: instance(),
//               networkInfo: instance(),
//             ));
//   }

//   if (!GetIt.I.isRegistered<GetCategoriesUseCase>()) {
//     instance.registerFactory<GetCategoriesUseCase>(
//         () => GetCategoriesUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetAmenitiesByCategoryIdUseCase>()) {
//     instance.registerFactory<GetAmenitiesByCategoryIdUseCase>(
//         () => GetAmenitiesByCategoryIdUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetFeaturesByCategoryIdUseCase>()) {
//     instance.registerFactory<GetFeaturesByCategoryIdUseCase>(
//         () => GetFeaturesByCategoryIdUseCase(repository: instance()));
//   }
//   //PermissionHandling
//   if (!GetIt.I.isRegistered<PermissionHandling>()) {
//     instance
//         .registerFactory<PermissionHandling>(() => PermissionHandlingImpl());
//   }

//   //ImagePickering
//   if (!GetIt.I.isRegistered<ImagePickering>()) {
//     instance.registerFactory<ImagePickering>(() => ImagePickerImpl(instance()));
//   }

//   //ImagePickering
//   if (!GetIt.I.isRegistered<FilePickerService>()) {
//     instance
//         .registerFactory<FilePickerService>(() => FilePickerImpl(instance()));
//   }

//   //getExtraOptionsByExtraIdUseCase
//   if (!GetIt.I.isRegistered<GetExtraOptionsByExtraIdUseCase>()) {
//     instance.registerFactory<GetExtraOptionsByExtraIdUseCase>(
//         () => GetExtraOptionsByExtraIdUseCase(repository: instance()));
//   }

//   //getExtraUseCase
//   if (!GetIt.I.isRegistered<GetExtraUseCase>()) {
//     instance.registerFactory<GetExtraUseCase>(
//         () => GetExtraUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetLatLngByPlaceIdUseCase>()) {
//     instance.registerFactory<GetLatLngByPlaceIdUseCase>(
//         () => GetLatLngByPlaceIdUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<SearchLocationUseCase>()) {
//     instance.registerFactory<SearchLocationUseCase>(
//         () => SearchLocationUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetCitiesUseCase>()) {
//     instance.registerFactory<GetCitiesUseCase>(
//         () => GetCitiesUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetDirectionsUseCase>()) {
//     instance.registerFactory<GetDirectionsUseCase>(
//         () => GetDirectionsUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<GetUnitSettingDetailsUseCase>()) {
//     instance.registerFactory<GetUnitSettingDetailsUseCase>(
//         () => GetUnitSettingDetailsUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetRegionsUseCase>()) {
//     instance.registerFactory<GetRegionsUseCase>(
//         () => GetRegionsUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<AddUnitUseCase>()) {
//     instance.registerFactory<AddUnitUseCase>(
//         () => AddUnitUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetUnitDetailsUseCase>()) {
//     instance.registerFactory<GetUnitDetailsUseCase>(
//         () => GetUnitDetailsUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitAminitesUseCase>()) {
//     instance.registerFactory<UpdateUnitAminitesUseCase>(
//         () => UpdateUnitAminitesUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitFeaturesUseCase>()) {
//     instance.registerFactory<UpdateUnitFeaturesUseCase>(
//         () => UpdateUnitFeaturesUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitExtraUseCase>()) {
//     instance.registerFactory<UpdateUnitExtraUseCase>(
//         () => UpdateUnitExtraUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitImagesUseCase>()) {
//     instance.registerFactory<UpdateUnitImagesUseCase>(
//         () => UpdateUnitImagesUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitLocationUseCase>()) {
//     instance.registerFactory<UpdateUnitLocationUseCase>(
//         () => UpdateUnitLocationUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitPricesUseCase>()) {
//     instance.registerFactory<UpdateUnitPricesUseCase>(
//         () => UpdateUnitPricesUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitStatusUseCase>()) {
//     instance.registerFactory<UpdateUnitStatusUseCase>(
//         () => UpdateUnitStatusUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitSettingsUseCase>()) {
//     instance.registerFactory<UpdateUnitSettingsUseCase>(
//         () => UpdateUnitSettingsUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<DeleteMyUnitImageUseCase>()) {
//     instance.registerFactory<DeleteMyUnitImageUseCase>(
//         () => DeleteMyUnitImageUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnitDetailsUseCase>()) {
//     instance.registerFactory<UpdateUnitDetailsUseCase>(
//         () => UpdateUnitDetailsUseCase(repository: instance()));
//   }

//   //PermissionHandling
//   if (!GetIt.I.isRegistered<PermissionHandling>()) {
//     instance
//         .registerFactory<PermissionHandling>(() => PermissionHandlingImpl());
//   }

//   // getLateEntryUseCase

//   if (!GetIt.I.isRegistered<GetLateEntryUseCase>()) {
//     instance.registerFactory<GetLateEntryUseCase>(
//         () => GetLateEntryUseCase(repository: instance()));
//   }

//   //updateTourismPermitUseCase
//   if (!GetIt.I.isRegistered<UpdateTourismPermitUseCase>()) {
//     instance.registerFactory<UpdateTourismPermitUseCase>(
//         () => UpdateTourismPermitUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<PropertyDetailsCubit>()) {
//     instance.registerFactory<PropertyDetailsCubit>(() => PropertyDetailsCubit(
//           getCategoriesUseCase: instance(),
//           getAmenitiesByCategoryIdUseCase: instance(),
//           getFeaturesByCategoryIdUseCase: instance(),
//           imagePicker: instance(),
//           getExtraOptionsByExtraIdUseCase: instance(),
//           addUnitUseCase: instance(),
//           getLatLngByPlaceIdUseCase: instance(),
//           searchLocationUseCase: instance(),
//           getCitiesUseCase: instance(),
//           getDirectionsUseCase: instance(),
//           getRegionsUseCase: instance(),
//           getUnitDetailsUseCase: instance(),
//           getUnitSettingDetailsUseCase: instance(),
//           updateUnitAminitesUseCase: instance(),
//           updateUnitFeaturesUseCase: instance(),
//           updateUnitExtraUseCase: instance(),
//           updateUnitImagesUseCase: instance(),
//           updateUnitLocationUseCase: instance(),
//           updateUnitPricesUseCase: instance(),
//           updateUnitStatusUseCase: instance(),
//           updateUnitSettingsUseCase: instance(),
//           deleteMyUnitImageUseCase: instance(),
//           updateUnitDetailsUseCase: instance(),
//           permissionHandling: instance(),
//           getLateEntryUseCase: instance(),
//           filePickerService: instance(),
//           updateTourismPermitUseCase: instance(),
//         ));
//   }
// }

// void getMyPropertyFactory() {
//   if (!GetIt.I.isRegistered<AddPropertyRepository>()) {
//     instance
//         .registerFactory<AddPropertyRepository>(() => AddPropertyRepositoryImpl(
//               clientApi: instance(),
//               networkInfo: instance(),
//             ));
//   }

//   if (!GetIt.I.isRegistered<HomeRespository>()) {
//     instance.registerFactory<HomeRespository>(() => HomeRepositoryImpl(
//           authApi: instance(),
//           networkInfo: instance(),
//         ));
//   }
//   if (!GetIt.I.isRegistered<GetMyPropertyUseCase>()) {
//     instance.registerFactory<GetMyPropertyUseCase>(
//         () => GetMyPropertyUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<home.AddToWishListUseCase>()) {
//     instance.registerFactory<home.AddToWishListUseCase>(
//         () => home.AddToWishListUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<GetUnitStatusesUseCase>()) {
//     instance.registerFactory<GetUnitStatusesUseCase>(
//         () => GetUnitStatusesUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<MyPrepertyCubit>()) {
//     instance.registerFactory<MyPrepertyCubit>(() => MyPrepertyCubit(
//           getMyPropertyUseCase: instance(),
//           addToWishListUseCase: instance(),
//           getUnitStatusesUseCase: instance(),
//         ));
//   }
// }

// void getMyPropertyCalanderFactory() {
//   if (!GetIt.I.isRegistered<AddPropertyRepository>()) {
//     instance
//         .registerFactory<AddPropertyRepository>(() => AddPropertyRepositoryImpl(
//               clientApi: instance(),
//               networkInfo: instance(),
//             ));
//   }

//   if (!GetIt.I.isRegistered<GetMyPropertyUseCase>()) {
//     instance.registerFactory<GetMyPropertyUseCase>(
//         () => GetMyPropertyUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetUnitCalenderUseCase>()) {
//     instance.registerFactory<GetUnitCalenderUseCase>(
//         () => GetUnitCalenderUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<ToggleUnAvailableDateUseCase>()) {
//     instance.registerFactory<ToggleUnAvailableDateUseCase>(
//         () => ToggleUnAvailableDateUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<home.AddToWishListUseCase>()) {
//     instance.registerFactory<home.AddToWishListUseCase>(
//         () => home.AddToWishListUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<ChangeUnitDayPriceUseCase>()) {
//     instance.registerFactory<ChangeUnitDayPriceUseCase>(
//         () => ChangeUnitDayPriceUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetUnitStatusesUseCase>()) {
//     instance.registerFactory<GetUnitStatusesUseCase>(
//         () => GetUnitStatusesUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<CalanderCubit>()) {
//     instance.registerFactory<CalanderCubit>(() => CalanderCubit(
//           getMyPropertyUseCase: instance(),
//           getUnitCalenderUseCase: instance(),
//           toggleUnAvailableDateUseCase: instance(),
//           addToWishListUseCase: instance(),
//           changeUnitDayPriceUseCase: instance(),
//           getUnitStatusesUseCase: instance(),
//         ));
//   }
// }

// //detials unit
// void getDetailsPropertyFactory() {
//   if (!GetIt.I.isRegistered<AddPropertyRepository>()) {
//     instance
//         .registerFactory<AddPropertyRepository>(() => AddPropertyRepositoryImpl(
//               clientApi: instance(),
//               networkInfo: instance(),
//             ));
//   }

//   if (!GetIt.I.isRegistered<GetMyPropertyDetailsUseCase>()) {
//     instance.registerFactory<GetMyPropertyDetailsUseCase>(
//         () => GetMyPropertyDetailsUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<UpdateUnavailableDateUseCase>()) {
//     instance.registerFactory<UpdateUnavailableDateUseCase>(
//         () => UpdateUnavailableDateUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<ShowPropertyUnitsCubit>()) {
//     instance
//         .registerFactory<ShowPropertyUnitsCubit>(() => ShowPropertyUnitsCubit(
//               getMyPropertyDetailsUseCase: instance(),
//               updateUnavailableDateUseCase: instance(),
//             ));
//   }
// }

// void getReservationsFactory() {
//   if (!GetIt.I.isRegistered<HomeRespository>()) {
//     instance.registerFactory<HomeRespository>(() => HomeRepositoryImpl(
//           authApi: instance(),
//           networkInfo: instance(),
//         ));
//   }

//   if (!GetIt.I.isRegistered<GetReservationsUseCase>()) {
//     instance
//         .registerFactory<GetReservationsUseCase>(() => GetReservationsUseCase(
//               repository: instance(),
//             ));
//   }

//   if (!GetIt.I.isRegistered<GetBookingTenantUseCase>()) {
//     instance.registerFactory<GetBookingTenantUseCase>(
//         () => GetBookingTenantUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<ApproveOrRejectReservationUseCase>()) {
//     instance.registerFactory<ApproveOrRejectReservationUseCase>(
//         () => ApproveOrRejectReservationUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<GetReservationStatusesUseCase>()) {
//     instance.registerFactory<GetReservationStatusesUseCase>(
//         () => GetReservationStatusesUseCase(repository: instance()));
//   }
// //
//   if (!GetIt.I.isRegistered<ReservationsCubit>()) {
//     instance.registerFactory<ReservationsCubit>(() => ReservationsCubit(
//           getReservationUseCase: instance(),
//           getBookingUseCase: instance(),
//           approveOrRejectReservationUseCase: instance(),
//           getReservationStatusesUseCase: instance(),
//         ));
//   }
// }

// void getFavsFactory() {
//   if (!GetIt.I.isRegistered<home.GetWishListUseCase>()) {
//     instance.registerFactory<home.GetWishListUseCase>(
//         () => home.GetWishListUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<home.AddToWishListUseCase>()) {
//     instance.registerFactory<home.AddToWishListUseCase>(
//         () => home.AddToWishListUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<FavsCubit>()) {
//     instance.registerFactory<FavsCubit>(() => FavsCubit(
//         getWishListUseCase: instance(), addToWishListUseCase: instance()));
//   }
// }

// void getFavsFactory() {
//   if (!GetIt.I.isRegistered<home.GetWishListUseCase>()) {
//     instance.registerFactory<home.GetWishListUseCase>(
//         () => home.GetWishListUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<home.AddToWishListUseCase>()) {
//     instance.registerFactory<home.AddToWishListUseCase>(
//         () => home.AddToWishListUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<FavsCubit>()) {
//     instance.registerFactory<FavsCubit>(() => FavsCubit(
//         getWishListUseCase: instance(), addToWishListUseCase: instance()));
//   }
// }
// void calenderReservationFactory() {
//   if (!GetIt.I.isRegistered<AddPropertyRepository>()) {
//     instance
//         .registerFactory<AddPropertyRepository>(() => AddPropertyRepositoryImpl(
//               networkInfo: instance(),
//               clientApi: instance(),
//             ));
//   }
//   if (!GetIt.I.isRegistered<ConfirmReservationPaymentUseCase>()) {
//     instance.registerFactory<ConfirmReservationPaymentUseCase>(
//         () => ConfirmReservationPaymentUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<GetReservationDetailsUseCase>()) {
//     instance.registerFactory<GetReservationDetailsUseCase>(
//         () => GetReservationDetailsUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<GetBookingDetailsUseCase>()) {
//     instance.registerFactory<GetBookingDetailsUseCase>(
//         () => GetBookingDetailsUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<ApproveOrRejectReservationUseCase>()) {
//     instance.registerFactory<ApproveOrRejectReservationUseCase>(
//         () => ApproveOrRejectReservationUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<CalenderReservationscCubit>()) {
//     instance.registerFactory<CalenderReservationscCubit>(
//         () => CalenderReservationscCubit(
//               getReservationDetailsUseCase: instance(),
//               getBookingDetailsUseCase: instance(),
//               approveOrRejectReservationUseCase: instance(),
//             ));
//   }
// }

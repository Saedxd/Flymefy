import 'package:flymefy/features/Home/data/repository_impl/home_repository_impl.dart';
import 'package:flymefy/features/Home/domain/repository/home_repository.dart';
import 'package:flymefy/features/Home/domain/usecase/flight_book_usecase.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:flymefy/core/service/permission.dart';
import 'package:flymefy/core/service/picker_photos.dart';
import 'locator.dart';

void flightsSearchRegistery() {
  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerFactory<HomeRepository>(() => HomeRepositoryImpl(
          clientApi: instance(),
          networkInfo: instance(),
          appPreferences: instance(),
        ));
  }

  if (!GetIt.I.isRegistered<GetFlightsFromSearch>()) {
    instance.registerFactory<GetFlightsFromSearch>(
        () => GetFlightsFromSearch(repository: instance()));
  }

  if (!GetIt.I.isRegistered<FlightBookCubit>()) {
    instance.registerFactory<FlightBookCubit>(
        () => FlightBookCubit(getFlightsFromSearch: instance()));
  }
}


// void bookingRequestFactory() {
//   if (!GetIt.I.isRegistered<HomeRespository>()) {
//     instance.registerFactory<HomeRespository>(() => HomeRepositoryImpl(
//           authApi: instance(),
//           networkInfo: instance(),
//         ));
//   }
//   if (!GetIt.I.isRegistered<BookingRequestUseCase>()) {
//     instance.registerFactory<BookingRequestUseCase>(
//         () => BookingRequestUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<BookingCheckOutUseCase>()) {
//     instance.registerFactory<BookingCheckOutUseCase>(
//         () => BookingCheckOutUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<BookingRequestCubit>()) {
//     instance.registerFactory<BookingRequestCubit>(() => BookingRequestCubit(
//           bookingRequestUseCase: instance(),
//           bookingCheckOutUseCase: instance(),
//           checkOutBookingFinishUseCase: instance(),
//         ));
//   }
//   if (!GetIt.I.isRegistered<BookingCheckOutUseCase>()) {
//     instance.registerFactory<BookingCheckOutUseCase>(
//         () => BookingCheckOutUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<FirePromoCodeUseCase>()) {
//     instance.registerFactory<FirePromoCodeUseCase>(
//         () => FirePromoCodeUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<CheckOutBookingFinishUseCase>()) {
//     instance.registerFactory<CheckOutBookingFinishUseCase>(
//         () => CheckOutBookingFinishUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<BookingCheckOutCubit>()) {
//     instance.registerFactory<BookingCheckOutCubit>(() => BookingCheckOutCubit(
//           bookingCheckOutUseCase: instance(),
//           firePromoCodeUseCase: instance(),
//           checkOutBookingFinishUseCase: instance(),
//         ));
//   }
// }

// void bookingCheckoutRequestFactory() {
//   if (!GetIt.I.isRegistered<HomeRespository>()) {
//     instance.registerFactory<HomeRespository>(() => HomeRepositoryImpl(
//           authApi: instance(),
//           networkInfo: instance(),
//         ));
//   }
//   if (!GetIt.I.isRegistered<BookingCheckOutUseCase>()) {
//     instance.registerFactory<BookingCheckOutUseCase>(
//         () => BookingCheckOutUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<FirePromoCodeUseCase>()) {
//     instance.registerFactory<FirePromoCodeUseCase>(
//         () => FirePromoCodeUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<CheckOutBookingFinishUseCase>()) {
//     instance.registerFactory<CheckOutBookingFinishUseCase>(
//         () => CheckOutBookingFinishUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<BookingCheckOutCubit>()) {
//     instance.registerFactory<BookingCheckOutCubit>(() => BookingCheckOutCubit(
//           bookingCheckOutUseCase: instance(),
//           firePromoCodeUseCase: instance(),
//           checkOutBookingFinishUseCase: instance(),
//         ));
//   }
// }

// void reservationsDetailsFactory() {
//   if (!GetIt.I.isRegistered<HomeRespository>()) {
//     instance.registerFactory<HomeRespository>(() => HomeRepositoryImpl(
//           authApi: instance(),
//           networkInfo: instance(),
//         ));
//   }
//   if (!GetIt.I.isRegistered<AddPropertyRepository>()) {
//     instance
//         .registerFactory<AddPropertyRepository>(() => AddPropertyRepositoryImpl(
//               networkInfo: instance(),
//               clientApi: instance(),
//             ));
//   }
//   if (!GetIt.I.isRegistered<ApproveOrRejectReservationUseCase>()) {
//     instance.registerFactory<ApproveOrRejectReservationUseCase>(
//         () => ApproveOrRejectReservationUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<GetReservationDetailsUseCase>()) {
//     instance.registerFactory<GetReservationDetailsUseCase>(
//         () => GetReservationDetailsUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<GetBookingDetailsUseCase>()) {
//     instance.registerFactory<GetBookingDetailsUseCase>(
//         () => GetBookingDetailsUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<SubmitReviewUseCase>()) {
//     instance.registerFactory<SubmitReviewUseCase>(
//         () => SubmitReviewUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<SubmitComplainUseCase>()) {
//     instance.registerFactory<SubmitComplainUseCase>(
//         () => SubmitComplainUseCase(repository: instance()));
//   }
//   if (!GetIt.I.isRegistered<GetComplainTypesUseCase>()) {
//     instance.registerFactory<GetComplainTypesUseCase>(
//         () => GetComplainTypesUseCase(repository: instance()));
//   } //ImagePickering

//   if (!GetIt.I.isRegistered<PermissionHandling>()) {
//     instance
//         .registerFactory<PermissionHandling>(() => PermissionHandlingImpl());
//   }
//   if (!GetIt.I.isRegistered<ImagePickering>()) {
//     instance.registerFactory<ImagePickering>(() => ImagePickerImpl(instance()));
//   }

//   if (!GetIt.I.isRegistered<CancelReservationRentedUseCase>()) {
//     instance.registerFactory<CancelReservationRentedUseCase>(
//         () => CancelReservationRentedUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<CancelReservationTenantUseCase>()) {
//     instance.registerFactory<CancelReservationTenantUseCase>(
//         () => CancelReservationTenantUseCase(repository: instance()));
//   }

//   if (!GetIt.I.isRegistered<ReservationDetailsCubit>()) {
//     instance
//         .registerFactory<ReservationDetailsCubit>(() => ReservationDetailsCubit(
//               getReservationDetailsUseCase: instance(),
//               getBookingDetailsUseCase: instance(),
//               approveOrRejectReservationUseCase: instance(),
//               submitReviewUseCase: instance(),
//               submitComplainUseCase: instance(),
//               complainTypesResponseUseCase: instance(),
//               imagePicker: instance(),
//               cancelReservationRentedUseCase: instance(),
//               cancelReservationTenantUseCase: instance(),
//             ));
//   }
// }

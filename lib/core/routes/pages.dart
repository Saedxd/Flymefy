import 'package:flutter/material.dart';
import 'package:flymefy/Screens/NavigationSCreen/navigation_screen.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/di/home_factory.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/features/Home/presentation/AirportCabsScreens/airport_cabs_screen.dart';
import 'package:flymefy/features/Home/presentation/AirportCabsScreens/cab_search_screen.dart';
import 'package:flymefy/features/Home/presentation/AirportCabsScreens/cab_terminal_screen1.dart';
import 'package:flymefy/features/Home/presentation/AirportCabsScreens/cab_terminal_screen2.dart';
import 'package:flymefy/features/Home/presentation/AirportCabsScreens/select_travell_date_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/calender_screens/multi_city_calender_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/calender_screens/one_way_calender_screen.dart';
import 'package:flymefy/features/Home/presentation/DrawerScreen/language_screen.dart';
import 'package:flymefy/features/Home/presentation/DrawerScreen/setting_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/AddTravellerScreen/add_traveller_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/ApplyPromoCodeScreen/apply_promocode_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/CheckInBaggageScreen/check_in_baggage_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/FareBreakUpScreen1/fare_break_up_screen1.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/RefundPolicyScreen/refund_policy_tab_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/contact_information_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/FlightDetailScreen1/flight_detail_screen1.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightDetailScreen/flight_detail_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/calender_screens/round_trip_calender_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/from_to_screens/flight_from_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/main_screen/flight_search_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/from_to_screens/flight_to_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/FlightSearchScreen/offer_make_your_trip_screen.dart';
import 'package:flymefy/features/Home/presentation/FlightBookScreen/flight_book_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/budget_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/duration_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/edit_your_search_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/explore_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/holiday_package_detail_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/holiday_package_review_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/holiday_package_traveller_detail_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/holiday_packages_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/hotel_choice_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/package_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/search_destination_screen.dart';
import 'package:flymefy/features/Home/presentation/HolidayPackagesScreen/suitable_screen.dart';
import 'package:flymefy/features/Home/presentation/HomeStayScreen/home_stay_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/coupon_code_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/hotel_and_homestay.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/hotel_detail_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/hotel_detail_search_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/hotel_review_booking_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/hotel_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/localitiy_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/popular_filter_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/price_range_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/property_type_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/rate_plan_detail_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/select_gust_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/HotelsScreen/select_room_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/hotel_and_home_stay_tab_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/search_city_screen.dart';
import 'package:flymefy/features/Home/presentation/HotelAndHomeStayScreens/select_checkin_date_screen.dart';
import 'package:flymefy/features/Home/presentation/OffersScreen/offer_detail_screen.dart';
import 'package:flymefy/features/Home/presentation/OffersScreen/offer_screen.dart';
import 'package:flymefy/features/Home/presentation/OutStationCabsScreen/out_station_cab_from_to_screen.dart';
import 'package:flymefy/features/Home/presentation/OutStationCabsScreen/out_station_cab_screen.dart';
import 'package:flymefy/features/Home/presentation/SelfDriveCarsScreen/search_pickup_area_screen.dart';
import 'package:flymefy/features/Home/presentation/SelfDriveCarsScreen/self_drive_cars_screen.dart';
import 'package:flymefy/features/Home/presentation/SelfDriveCarsScreen/self_drive_cars_select_dates_screen.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/review_booking_screen.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/train_and_bus_detail_screen.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/train_and_bus_from_screen.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/train_and_bus_modify_search_screen.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/train_and_bus_screen.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/train_and_bus_search_screen.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/train_and_bus_search_screen2.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/train_and_bus_to_screen.dart';
import 'package:flymefy/features/Home/presentation/TrainAndBusScreen/traveller_detail_screen.dart';
import 'package:flymefy/features/Home/presentation/VisaServicesScreen/add_document_screen.dart';
import 'package:flymefy/features/Home/presentation/VisaServicesScreen/apply_tourist_visa_screen.dart';
import 'package:flymefy/features/Home/presentation/VisaServicesScreen/enter_destination_screen.dart';
import 'package:flymefy/features/Home/presentation/VisaServicesScreen/see_visa_process_screen.dart';
import 'package:flymefy/features/Home/presentation/VisaServicesScreen/select_visa_type_screen.dart';
import 'package:flymefy/features/Home/presentation/home_search_screen.dart';
import 'package:flymefy/features/SplashScreen/splash_screen.dart';
import 'package:flymefy/features/auth/presentation/full_name_screens/full_name_screen.dart';
import 'package:flymefy/features/auth/presentation/login_screens/login_screen.dart';
import 'package:flymefy/features/auth/presentation/otp_screens/otp_screen.dart';
import 'package:flymefy/features/general/presernatation/screen/filter/sort_and_filter_screens/sort_and_filter_screen.dart';
import 'package:flymefy/features/general/presernatation/screen/no_route_found/no_route_found.dart';
import 'package:flymefy/features/my_trip/presentation/my_trips_screens/my_trip_screen.dart';
import 'package:flymefy/features/notification/presentation/screen/notification_screen.dart';
import 'package:flymefy/features/payment_methods/presentation/mobile_wallet_screens/mobile_wallet_screen.dart';
import 'package:flymefy/features/payment_methods/presentation/net_banking_screens/net_banking_screen.dart';
import 'package:flymefy/features/payment_methods/presentation/pay_by_card_screens/pay_by_card_screen.dart';
import 'package:flymefy/features/payment_methods/presentation/pay_by_upi_screens/pay_by_upi_screen.dart';
import 'package:flymefy/features/payment_methods/presentation/select_method_screens/select_payment_method_screen.dart';
import 'package:flymefy/features/profile/presentation/edit_profile/edit_profile_screen.dart';
import 'package:flymefy/features/profile/presentation/gift_card_screens/my_giftcard_screen.dart';
import 'package:flymefy/features/profile/presentation/my_account_screen/my_account_screen.dart';
import 'package:flymefy/features/profile/presentation/wishlist_screen/my_wishlist_screen.dart';
import 'package:flymefy/features/referral/presentation/referral_screens/refferal_screen.dart';
import 'package:flymefy/features/seats_meals/presentation/seats_meals_addone_tab_screens/seats_meals_addone_tab_screen.dart';
import 'package:flymefy/features/select_country/presentation/select_country_screens/select_country_screen.dart';
import 'package:flymefy/features/welcome/presentation/WelcomeScreen/welcome_screen1.dart';
import 'package:flymefy/features/welcome/presentation/WelcomeScreen/welcome_screen2.dart';
import 'package:flymefy/features/welcome/presentation/Where2GoScreen/booking_option_screen.dart';
import 'package:flymefy/features/welcome/presentation/Where2GoScreen/international_select_city_screen.dart';
import 'package:flymefy/features/welcome/presentation/Where2GoScreen/where2go_search_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    print(" settings  name${settings.name}");

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );

      case Routes.navigationScreen:
        return MaterialPageRoute(
          builder: (_) => NavigationScreen(),
          settings: settings,
        );

      case Routes.cabTerminalScreen2:
        return MaterialPageRoute(
          builder: (_) => CabTerminalScreen2(),
          settings: settings,
        );

      case Routes.holidayPackageTravellerDetailScreen:
        return MaterialPageRoute(
          builder: (_) => HolidayPackageTravellerDetailScreen(),
          settings: settings,
        );

      case Routes.selectCountryScreen:
        return MaterialPageRoute(
          builder: (_) => SelectCountryScreen(),
          settings: settings,
        );

      case Routes.homeSearchSCreen:
        return MaterialPageRoute(
          builder: (_) => HomeSearchSCreen(),
          settings: settings,
        );

      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
          settings: settings,
        );

      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(),
          settings: settings,
        );

      case Routes.referralScreen:
        return MaterialPageRoute(
          builder: (_) => ReferralScreen(),
          settings: settings,
        );

      case Routes.fullNameScreen:
        return MaterialPageRoute(
          builder: (_) => FullNameScreen(),
          settings: settings,
        );

      case Routes.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => NotificationScreen(),
          settings: settings,
        );

      case Routes.cabSearchScreen:
        return MaterialPageRoute(
          builder: (_) => CabSearchScreen(),
          settings: settings,
        );

      case Routes.homeStayScreen:
        return MaterialPageRoute(
          builder: (_) => HomeStayScreen(),
          settings: settings,
        );

      case Routes.outStationCabScreen:
        return MaterialPageRoute(
          builder: (_) => OutStationCabScreen(),
          settings: settings,
        );

      case Routes.flightSearchScreen:
        flightsSearchRegistery();
        return MaterialPageRoute(
          builder: (_) => MainFlightSearchScreen(),
          settings: settings,
        );

      case Routes.trainAndBusScreen:
        return MaterialPageRoute(
          builder: (_) => TrainAndBusScreen(),
          settings: settings,
        );

      case Routes.hotelAndHomeStayTabScreen:
        return MaterialPageRoute(
          builder: (_) => HotelAndHomeStayTabScreen(),
          settings: settings,
        );

      case Routes.holidayPackagesScreen:
        return MaterialPageRoute(
          builder: (_) => HolidayPackagesScreen(),
          settings: settings,
        );

      case Routes.airportCabsScreen:
        return MaterialPageRoute(
          builder: (_) => AirportCabsScreen(),
          settings: settings,
        );

      case Routes.selectTravelDateScreen:
        return MaterialPageRoute(
          builder: (_) => SelectTravelDateScreen(),
          settings: settings,
        );

      case Routes.sortAndFilterScreen:
        return MaterialPageRoute(
          builder: (_) => SortAndFilterScreen(),
          settings: settings,
        );

      case Routes.cabTerminalScreen1:
        return MaterialPageRoute(
          builder: (_) => CabTerminalScreen1(),
          settings: settings,
        );

      case Routes.languageScreen:
        return MaterialPageRoute(
          builder: (_) => LanguageScreen(),
          settings: settings,
        );

      case Routes.flightDetailScreen:
        return MaterialPageRoute(
          builder: (_) => FlightDetailScreen(),
          settings: settings,
        );

      case Routes.oneWaycalenderScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'] as FlightBookCubit;

        return MaterialPageRoute(
          builder: (_) => OneWayCalender(
            cubit: cubit,
          ),
          settings: settings,
        );

      case Routes.roundTripCalender:
        final args = settings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'] as FlightBookCubit;
        final type = args['type'] as String;

        return MaterialPageRoute(
          builder: (_) => RoundTripCalender(
            cubit: cubit,
            type: type,
          ),
          settings: settings,
        );
      case Routes.multiCityCalender:
        final args = settings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'] as FlightBookCubit;
        final index = args['index'] as int;

        return MaterialPageRoute(
          builder: (_) => MultiCityCalender(
            cubit: cubit,
            index: index,
          ),
          settings: settings,
        );

      case Routes.flightDetailScreen1:
        return MaterialPageRoute(
          builder: (_) => FlightDetailScreen1(),
          settings: settings,
        );

      case Routes.seatsMealsAddOneTabScreen:
        return MaterialPageRoute(
          builder: (_) => SeatsMealsAddOneTabScreen(),
          settings: settings,
        );

      case Routes.refundPolicyTabScreen:
        return MaterialPageRoute(
          builder: (_) => RefundPolicyTabScreen(),
          settings: settings,
        );

      case Routes.checkInBaggageScreen:
        return MaterialPageRoute(
          builder: (_) => CheckInBaggageScreen(),
          settings: settings,
        );

      case Routes.applyPromoCodeScreen:
        return MaterialPageRoute(
          builder: (_) => ApplyPromoCodeScreen(),
          settings: settings,
        );

      case Routes.addTravellerScreen:
        return MaterialPageRoute(
          builder: (_) => AddTravellerScreen(),
          settings: settings,
        );

      case Routes.fareBreakUpScreen1:
        return MaterialPageRoute(
          builder: (_) => FareBreakUpScreen1(),
          settings: settings,
        );

      case Routes.flightBookScreen:
        return MaterialPageRoute(
          builder: (_) => FlightBookScreen(),
          settings: settings,
        );

      case Routes.offerMakeYourTripScreen:
        return MaterialPageRoute(
          builder: (_) => OfferMakeYourTripScreen(),
          settings: settings,
        );

      case Routes.contactInformationScreen:
        return MaterialPageRoute(
          builder: (_) => ContactInformationScreen(),
          settings: settings,
        );

      case Routes.holidayPackageDetailScreen:
        return MaterialPageRoute(
          builder: (_) => HolidayPackageDetailScreen(),
          settings: settings,
        );

      case Routes.packageDetailScreen:
        return MaterialPageRoute(
          builder: (_) => PackageDetailScreen(),
          settings: settings,
        );

      // case Routes.selectRoomAndGuestScreen:
      //   return MaterialPageRoute(
      //     builder: (_) =>  SelectRoomAndGuestScreen(),
      //     settings: settings,
      //   );

      // case Routes.startFromScreen:
      //   return MaterialPageRoute(
      //     builder: (_) =>  StartFromScreen(),
      //     settings: settings,
      //   );

      case Routes.searchDestinationScreen:
        return MaterialPageRoute(
          builder: (_) => SearchDestinationScreen(),
          settings: settings,
        );

      case Routes.holidayPackageReviewScreen:
        return MaterialPageRoute(
          builder: (_) => HolidayPackageReviewScreen(),
          settings: settings,
        );

      case Routes.hotelScreen:
        return MaterialPageRoute(
          builder: (_) => HotelScreen(),
          settings: settings,
        );

      case Routes.hotelDetailSearchScreen:
        return MaterialPageRoute(
          builder: (_) => HotelDetailSearchScreen(),
          settings: settings,
        );

      case Routes.selectCheckInDateScreen:
        return MaterialPageRoute(
          builder: (_) => SelectCheckInDateScreen(),
          settings: settings,
        );

      case Routes.ratePlanDetailScreen:
        return MaterialPageRoute(
          builder: (_) => RatePlanDetailScreen(),
          settings: settings,
        );

      case Routes.couponCodeScreen:
        return MaterialPageRoute(
          builder: (_) => CouponCodeScreen(),
          settings: settings,
        );

      case Routes.selectGuestScreen:
        return MaterialPageRoute(
          builder: (_) => SelectGuestScreen(),
          settings: settings,
        );

      case Routes.selectPaymentMethodScreen:
        return MaterialPageRoute(
          builder: (_) => SelectPaymentMethodScreen(),
          settings: settings,
        );

      case Routes.hotelAndHomeStay:
        return MaterialPageRoute(
          builder: (_) => HotelAndHomeStay(),
          settings: settings,
        );

      case Routes.hotelDetailScreen:
        return MaterialPageRoute(
          builder: (_) => HotelDetailScreen(),
          settings: settings,
        );

      case Routes.selectRoomScreen:
        return MaterialPageRoute(
          builder: (_) => SelectRoomScreen(),
          settings: settings,
        );

      case Routes.hotelReviewBookingScreen:
        return MaterialPageRoute(
          builder: (_) => HotelReviewBookingScreen(),
          settings: settings,
        );

      case Routes.offerDetailScreen:
        return MaterialPageRoute(
          builder: (_) => OfferDetailScreen(),
          settings: settings,
        );

      case Routes.outStationCabFromToScreen:
        return MaterialPageRoute(
          builder: (_) => OutStationCabFromToScreen(),
          settings: settings,
        );

      case Routes.searchPickUpAreaScreen:
        return MaterialPageRoute(
          builder: (_) => SearchPickUpAreaScreen(),
          settings: settings,
        );

      case Routes.selfDriveCarsSelectTravelDateScreen:
        return MaterialPageRoute(
          builder: (_) => SelfDriveCarsSelectTravelDateScreen(),
          settings: settings,
        );

      case Routes.reviewBookingScreen:
        return MaterialPageRoute(
          builder: (_) => ReviewBookingScreen(),
          settings: settings,
        );

      case Routes.trainAndBusSearchScreen2:
        return MaterialPageRoute(
          builder: (_) => TrainAndBusSearchScreen2(),
          settings: settings,
        );

      case Routes.trainAndBusModifySearchScreen:
        return MaterialPageRoute(
          builder: (_) => TrainAndBusModifySearchScreen(),
          settings: settings,
        );

      case Routes.trainAndBusSearchScreen:
        return MaterialPageRoute(
          builder: (_) => TrainAndBusSearchScreen(),
          settings: settings,
        );

      case Routes.trainAndBusDetailScreen:
        return MaterialPageRoute(
          builder: (_) => TrainAndBusDetailScreen(),
          settings: settings,
        );

      case Routes.travellerDetailScreen:
        return MaterialPageRoute(
          builder: (_) => TravellerDetailScreen(),
          settings: settings,
        );

      case Routes.addDocumentScreen:
        return MaterialPageRoute(
          builder: (_) => AddDocumentScreen(),
          settings: settings,
        );

      case Routes.enterDestinationScreen:
        return MaterialPageRoute(
          builder: (_) => EnterDestinationScreen(),
          settings: settings,
        );

      case Routes.selectVisaTypeScreen:
        return MaterialPageRoute(
          builder: (_) => SelectVisaTypeScreen(),
          settings: settings,
        );

      case Routes.seeVisaProcessScreen:
        return MaterialPageRoute(
          builder: (_) => SeeVisaProcessScreen(),
          settings: settings,
        );

      case Routes.editYourSearchScreen:
        return MaterialPageRoute(
          builder: (_) => EditYourSearchScreen(),
          settings: settings,
        );

      case Routes.exploreScreen:
        return MaterialPageRoute(
          builder: (_) => ExploreScreen(""),
          settings: settings,
        );
      case Routes.welcomeScreen1:
        return MaterialPageRoute(
          builder: (_) => WelcomeScreen1(),
          settings: settings,
        );

      case Routes.welcomeScreen2:
        return MaterialPageRoute(
          builder: (_) => WelcomeScreen2(),
          settings: settings,
        );

      case Routes.logInScreen:
        return MaterialPageRoute(
          builder: (_) => LogInScreen(),
          settings: settings,
        );

      case Routes.bookingOptionScreen:
        return MaterialPageRoute(
          builder: (_) => BookingOptionScreen(),
          settings: settings,
        );

      case Routes.internationalSelectCityScreenScreen:
        return MaterialPageRoute(
          builder: (_) => InternationalSelectCityScreenScreen(),
          settings: settings,
        );

      // case Routes.internationalDetailScreen1:
      //   return MaterialPageRoute(
      //     builder: (_) =>  InternationalDetailScreen1(),
      //     settings: settings,
      //   );

      case Routes.where2GoSearchScreen:
        return MaterialPageRoute(
          builder: (_) => Where2GoSearchScreen(),
          settings: settings,
        );

      case Routes.myTripScreen:
        return MaterialPageRoute(
          builder: (_) => MyTripScreen(),
          settings: settings,
        );

      case Routes.myAccountScreen:
        return MaterialPageRoute(
          builder: (_) => MyAccountScreen(),
          settings: settings,
        );

      case Routes.offerScreen:
        return MaterialPageRoute(
          builder: (_) => OfferScreen(),
          settings: settings,
        );

      case Routes.selfDriveCarsScreen:
        return MaterialPageRoute(
          builder: (_) => SelfDriveCarsScreen(),
          settings: settings,
        );

      case Routes.applyTouristVisaScreen:
        return MaterialPageRoute(
          builder: (_) => ApplyTouristVisaScreen(),
          settings: settings,
        );

      // case Routes.internationalScreen:
      //   return MaterialPageRoute(
      //     builder: (_) =>  InternationalScreen(),
      //     settings: settings,
      //   );

      case Routes.flightFromScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'] as FlightBookCubit;
        final onIataClicked = args['onIataClicked'] as Function(FlightDetails);
        final type = args['type'] as String;
        final index = args['index'] ?? 0;
        return MaterialPageRoute(
          builder: (_) => FlightsFrom(
            cubit: cubit,
            onIataClicked: onIataClicked,
            type: type,
            index: index,
          ),
          settings: settings,
        );

      case Routes.flightToScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'] as FlightBookCubit;
        final onIataClicked = args['onIataClicked'] as Function(FlightDetails);
        final type = args['type'] as String;
        final index = args['index'] ?? 0;
        return MaterialPageRoute(
          builder: (_) => FlightsTo(
            cubit: cubit,
            onIataClicked: onIataClicked,
            type: type,
            index: index,
          ),
          settings: settings,
        );

      case Routes.payByUpiScreen:
        return MaterialPageRoute(
          builder: (_) => PayByUpiScreen(),
          settings: settings,
        );

      case Routes.payByCardScreen:
        return MaterialPageRoute(
          builder: (_) => PayByCardScreen(),
          settings: settings,
        );

      case Routes.mobileWalletScreen:
        return MaterialPageRoute(
          builder: (_) => MobileWalletScreen(),
          settings: settings,
        );

      case Routes.netBankingScreen:
        return MaterialPageRoute(
          builder: (_) => NetBankingScreen(),
          settings: settings,
        );

      case Routes.searchCityScreen:
        return MaterialPageRoute(
          builder: (_) => SearchCityScreen(),
          settings: settings,
        );

      case Routes.popularFilterScreen:
        return MaterialPageRoute(
          builder: (_) => PopularFilterScreen(),
          settings: settings,
        );

      case Routes.priceRangeScreen:
        return MaterialPageRoute(
          builder: (_) => PriceRangeScreen(),
          settings: settings,
        );

      case Routes.localityScreen:
        return MaterialPageRoute(
          builder: (_) => LocalityScreen(),
          settings: settings,
        );

      case Routes.propertyTypeScreen:
        return MaterialPageRoute(
          builder: (_) => PropertyTypeScreen(),
          settings: settings,
        );

      case Routes.trainAndBusFromScreen:
        return MaterialPageRoute(
          builder: (_) => TrainAndBusFromScreen(),
          settings: settings,
        );

      case Routes.trainAndBusToScreen:
        return MaterialPageRoute(
          builder: (_) => TrainAndBusToScreen(),
          settings: settings,
        );

      case Routes.suitableScreen:
        return MaterialPageRoute(
          builder: (_) => SuitableScreen(),
          settings: settings,
        );

      case Routes.budgetScreen:
        return MaterialPageRoute(
          builder: (_) => BudgetScreen(),
          settings: settings,
        );

      case Routes.durationScreen:
        return MaterialPageRoute(
          builder: (_) => DurationScreen(),
          settings: settings,
        );

      case Routes.hotelChoiceScreen:
        return MaterialPageRoute(
          builder: (_) => HotelChoiceScreen(),
          settings: settings,
        );

      case Routes.myWishListScreen:
        return MaterialPageRoute(
          builder: (_) => MyWishListScreen(),
          settings: settings,
        );

      case Routes.myGiftCardScreen:
        return MaterialPageRoute(
          builder: (_) => MyGiftCardScreen(),
          settings: settings,
        );

      case Routes.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => NotificationScreen(),
          settings: settings,
        );

      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
          settings: settings,
        );

      // case Routes.login:
      //   loginPersionalUseFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const LoignPersionalUsingScreen(),
      //     settings: settings,
      //   );

      // case Routes.register:
      //   regiterPersionalUseFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const RegisterPersionalUsingScreen(),
      //     settings: settings,
      //   );

      // case Routes.forgotPasswordPhoneNumber:
      //   forgetPasswordFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetPasswordPhoneNumberScreen(),
      //     settings: settings,
      //   );

      // case Routes.changePassword:
      //   changePasswordFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const ChangePasswordScreen(),
      //     settings: settings,
      //   );
      // case Routes.changePhone:
      //   changePhoneFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const ChangePhoneScreen(),
      //     settings: settings,
      //   );

      // case Routes.validateRegisterOTP:
      //   otpRegisterFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final registerData = args['registerData'] as RegisterData;

      //   return MaterialPageRoute(
      //     builder: (_) => OTPRegisterScreen(
      //       registerData: registerData,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.forgetPasswordOTPScreen:
      //   otpFactory();
      //   forgetPasswordFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final phone = args['phone'] as String;
      //   final countryCode = args['countryCode'] as String;
      //   final type = args['type'] as String;
      //   final changeNumberOtpCode =
      //       args['changeNumberOtpCode']?.toString() ?? '';
      //   return MaterialPageRoute(
      //     builder: (_) => OTPScreen(
      //       phone: phone,
      //       countryCode: countryCode,
      //       type: type,
      //       changeNumberOtpCode: changeNumberOtpCode,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.forgetPasswordReset:
      //   otpFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final phone = args['phone'] as String;
      //   final countryCode = args['countryCode'] as String;
      //   final code = args['code'] as String;

      //   return MaterialPageRoute(
      //     builder: (_) => ForgetPasswordResetScreen(
      //       phone: phone,
      //       countryCode: countryCode,
      //       code: code,
      //     ),
      //     settings: settings,
      //   );

      // //faqs
      // case Routes.helpCenter:
      //   helpCenterFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const HelpCenterScreen(),
      //     settings: settings,
      //   );

      // case Routes.editProfile:
      //   editProfileFactory();

      //   final args = settings.arguments as Map<String, dynamic>;
      //   final user = args['user'] as UserAppInfo;
      //   return MaterialPageRoute(
      //     builder: (_) => EditProfileScreen(
      //       user: user,
      //     ),
      //     settings: settings,
      //   );

      // //notifi

      // case Routes.notificationDetails:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final item = args['notification'] as NotificationItem;

      //   return MaterialPageRoute(
      //     builder: (_) => NotificationsDetailsScreen(
      //       notificationItem: item,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.successScreen:
      //   final args = settings.arguments;
      //   String route = Routes.home;
      //   String successMessage = AppStrings.success;
      //   String subTitleSuccessMessage = AppStrings.success;
      //   String buttonText = AppStrings.tohome;
      //   if (args != null) {
      //     final args = settings.arguments as Map<String, dynamic>;
      //     route = args['route'] as String;
      //     successMessage = args['successMessage'] as String;
      //     subTitleSuccessMessage = args['subTitleSuccessMessage'] as String;
      //     buttonText = args['buttonText'] as String;
      //   }
      //   return MaterialPageRoute(
      //     builder: (_) => SuccessScreen(
      //       route: route,
      //       successMessage: successMessage,
      //       subTitleSuccessMessage: subTitleSuccessMessage,
      //       buttonText: buttonText,
      //     ),
      //     settings: settings,
      //   );
      // case Routes.successScreenRegister:
      //   final args = settings.arguments;
      //   String route = Routes.home;
      //   String successMessage = AppStrings.success;
      //   String subTitleSuccessMessage = AppStrings.success;
      //   String buttonText = AppStrings.tohome;
      //   if (args != null) {
      //     final args = settings.arguments as Map<String, dynamic>;
      //     route = args['route'] as String;
      //     successMessage = args['successMessage'] as String;
      //     subTitleSuccessMessage = args['subTitleSuccessMessage'] as String;
      //     buttonText = args['buttonText'] as String;
      //   }
      //   return MaterialPageRoute(
      //     builder: (_) => SuccessScreen(
      //       route: route,
      //       successMessage: successMessage,
      //       subTitleSuccessMessage: subTitleSuccessMessage,
      //       buttonText: buttonText,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.notification:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final onTap = args['onTap'] as void Function(int);
      //   return MaterialPageRoute(
      //     builder: (_) => NotificationsScreen(
      //       onTap: onTap,
      //     ),
      //     settings: settings,
      //   );

      // //home
      // case Routes.home:
      //   whereToFactory();

      //   return MaterialPageRoute(
      //     builder: (_) => const ScaffoldWithNestedNavigation(
      //       currentIndex: 2,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.favorites:
      //   return MaterialPageRoute(
      //     builder: (_) => const ScaffoldWithNestedNavigation(
      //       currentIndex: 1,
      //     ),
      //     settings: settings,
      //   );
      // case Routes.menu:
      //   homeFactory();
      //   MenuScreenFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const ScaffoldWithNestedNavigation(
      //       currentIndex: 4,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.photoView:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final image = args['image'] as String;
      //   return MaterialPageRoute(
      //     builder: (_) => PhotoViewScreen(
      //       url: image,
      //     ),
      //     settings: settings,
      //   );

      // // case Routes.chat:
      // //   chatUsersFactory();
      // //   return MaterialPageRoute(
      // //     builder: (_) => const ChatsScreen(),
      // //     settings: settings,
      // //   );

      // // case Routes.messages:
      // //   final args = settings.arguments as Map<String, dynamic>;
      // //   final user = args['user'] as ChatRoom;

      // //   chatMessagesFactory();
      // //   return MaterialPageRoute(
      // //     builder: (_) => public.ChatMessagesScreen(
      // //       user: user,
      // //     ),
      // //     settings: settings,
      // //   );
      // // case Routes.showAllImages:
      // //   final args = settings.arguments as Map<String, dynamic>;
      // //   final images = args['images'] as List<String>;
      // //   return MaterialPageRoute(
      // //     builder: (_) => ShowAllImages(
      // //       images: images,
      // //     ),
      // //     settings: settings,
      // //   );

      // //successPage

      // case Routes.permssion:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final permission = args['permission'] as Permission;
      //   return MaterialPageRoute(
      //     builder: (_) => PermssionScreen(permission: permission),
      //     settings: settings,
      //   );

      // //addPromoCode
      // //promoCode
      // case Routes.addPromoCode:
      //   addPromoCodeFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final edit = args['edit'] as bool;
      //   final promoCode = args['promoCode'] as PromoCode;
      //   return MaterialPageRoute(
      //       builder: (_) =>
      //           AddPromoCodeScreen(edit: edit, promoCode: promoCode),
      //       settings: settings);

      // // case Routes.selectPropertyAddingPromoCode:
      // //   final args = settings.arguments as Map<String, dynamic>;
      // //   final cubit = args['cubit'] as AddPromoCodeCubit;
      // //   return MaterialPageRoute(
      // //       builder: (_) => PromoCodeSelectMyPropeteryScreen(
      // //             addPromoCodeCubit: cubit,
      // //           ),
      // //       settings: settings);

      // case Routes.promoCode:
      //   myPromoCodeFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const PromoCodeScreen(),
      //     settings: settings,
      //   );

      // //============================ start case add property ====================

      // case Routes.updateMenuUnit:
      //   addUpdatePropertyFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final level = args['level'] as int;
      //   final cubit = args['cubit'] as PropertyDetailsCubit;
      //   return MaterialPageRoute(
      //     builder: (_) => ScreenUpdateUnit(
      //       level: level,
      //       cubit: cubit,
      //     ),
      //     settings: settings,
      //   );
      // case Routes.addUnitScreen:
      //   addUpdatePropertyFactory();

      //   return MaterialPageRoute(
      //     builder: (_) => ScreenAddProperty(),
      //     settings: settings,
      //   );

      // // case Routes.detailsUnit:
      // //   getDetailsPropertyFactory();
      // //   final args = settings.arguments as Map<String, dynamic>;
      // //   final id = args['id'] as int;
      // //   return MaterialPageRoute(
      // //     builder: (_) => ShowPropertyUnitsScreen(id: id),
      // //     settings: settings,
      // //   );
      // //======================= start case add property ====================
      // case Routes.showCalander:
      //   getMyPropertyCalanderFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final unitName = args['unitName'] as String;
      //   final unitId = args['unitId'] as int;
      //   // final midweekPrice = args['midweekPrice'] as String;
      //   // final thursdayPrice = args['thursdayPrice'] as String;
      //   // final fridayPrice = args['fridayPrice'] as String;
      //   // final saturdayPrice = args['saturdayPrice'] as String;
      //   // final holidayPrices =
      //   //     args['holidayPrices'] ?? {} as Map<String, String>;
      //   return MaterialPageRoute(
      //     builder: (_) => CalenderScreen(
      //       unitName: unitName,
      //       unitId: unitId,
      //       // midweekPrice: midweekPrice,
      //       // thursdayPrice: thursdayPrice,
      //       // fridayPrice: fridayPrice,
      //       // saturdayPrice: saturdayPrice,
      //       // holidayPrices: holidayPrices,
      //     ),
      //     settings: settings,
      //   );
      // //============================ end case add property ====================
      // case Routes.whereTo:
      //   whereToFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const WhereToScreen(),
      //     settings: settings,
      //   );
      // case Routes.whereToResult:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final cubit = args['cubit'] as WhereToCubit;
      //   final filterSearch = args['filterSearch'] as FilterSearch;
      //   return MaterialPageRoute(
      //     builder: (_) => ResultsWhereToScreen(
      //       cubit: cubit,
      //       filterSearch: filterSearch,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.showUnitsDetails:
      //   showUnitDetailsFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final id = args['id'] as int;
      //   final isTenent = args['isTenent'] as bool;
      //   final bookingRequest = args['bookingRequest'] ?? BookingRequest();

      //   return MaterialPageRoute(
      //     builder: (_) => ShowUnitsDetailsScreen(
      //       id: id,
      //       isTenent: isTenent,
      //       bookingRequest: bookingRequest ?? BookingRequest(),
      //     ),
      //     settings: settings,
      //   );
      // //ReviewsScreen
      // case Routes.reviews:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final reviews = args['reviews'] as RatingTenant;
      //   return MaterialPageRoute(
      //     builder: (_) => ReviewsScreen(
      //       ratingTenant: reviews,
      //     ),
      //     settings: settings,
      //   );
      // //booking
      // case Routes.booking:
      //   bookingRequestFactory(); // "property":state.propertyDetails
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final request = args['request'] as BookingRequest;
      //   final unitDetails = args['property'] as UnitTenantDetails;
      //   final cubit = args['cubit'] as ShowUnitsDetailsCubit;
      //   return MaterialPageRoute(
      //     builder: (_) => BookingRequestScreen(
      //       request: request,
      //       unitDetails: unitDetails,
      //       cubit: cubit,
      //     ),
      //     settings: settings,
      //   );
      // // case Routes.paymentCheckoutBooking:
      // //   bookingCheckoutRequestFactory();
      // //   final args = settings.arguments as Map<String, dynamic>;
      // //   final request = args['booking'] as BookingRequest;
      // //   return MaterialPageRoute(
      // //     builder: (_) => PaymentCheckoutBookingScreen(
      // //       request: request,
      // //     ),
      // //     settings: settings,
      // //   );
      // case Routes.reservationsDetails:
      //   reservationsDetailsFactory();
      //   bookingRequestFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final id = args['id'] as int;
      //   return MaterialPageRoute(
      //     builder: (_) => ReservationsDetailsScreen(id: id),
      //     settings: settings,
      //   );
      // case Routes.successBooking:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final id = args['id'] as int;
      //   return MaterialPageRoute(
      //     builder: (_) => SuccessBookingScreen(
      //       id: id,
      //     ),
      //     settings: settings,
      //   );
      // case Routes.bookingDetails:
      //   reservationsDetailsFactory();
      //   bookingRequestFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final id = args['id'] as int;
      //   return MaterialPageRoute(
      //     builder: (_) => BookingTenantDetailsScreen(
      //       id: id,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.PropertiesScreen:
      //   PropertiesScreenFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final id = args['id'] as int;
      //   final cityName = args['cityName'] as String;
      //   return MaterialPageRoute(
      //     builder: (_) => PropertiesScreen(
      //       cityID: id,
      //       cityName: cityName,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.pointsDetails:
      //   termsConditionsPolicyFactory();

      //   return MaterialPageRoute(
      //     builder: (_) => const PointsBenifitsScreen(),
      //     settings: settings,
      //   );

      // case Routes.cancellationOfReservationPolicy:
      //   termsConditionsPolicyFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const CancelReservationPolicyScreen(),
      //     settings: settings,
      //   );

      // case Routes.selfCheckIn:
      //   termsConditionsPolicyFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const SelfCheckInScreen(),
      //     settings: settings,
      //   );
      // case Routes.unitSetting:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final item = args['item'] as UnitSettingDetail;
      //   return MaterialPageRoute(
      //     builder: (_) => UnitSetting(
      //       item: item,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.insuranceDetails:
      //   termsConditionsPolicyFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const InsurancePolicyScreen(),
      //     settings: settings,
      //   );

      // case Routes.termsAndConditions:
      //   termsConditionsPolicyFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const TermsConditionsScreen(),
      //     settings: settings,
      //   );
      // case Routes.privacyPolicy:
      //   termsConditionsPolicyFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => const PrivacyPolicyScreen(),
      //     settings: settings,
      //   );

      // case Routes.pointsPage:
      //   getPointsDetailsFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final propertyy = args['propertyy'] as UnitItemHomeTanent;

      //   return MaterialPageRoute(
      //     builder: (_) => PointsPage(
      //       propertyy: propertyy,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.chatMessagesScreen:
      //   SupportChatFactory();
      //   // final args = settings.arguments as Map<String, dynamic>;
      //   // final id = args['id'] as int;
      //   return MaterialPageRoute(
      //     builder: (_) => const ChatMessagesScreen(),
      //     settings: settings,
      //   );

      // case Routes.wallet:
      //   walletScreenFactory();

      //   return MaterialPageRoute(
      //     builder: (_) => const WalletScreen(),
      //     settings: settings,
      //   );

      // case Routes.searchDestination:
      //   //walletScreenFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final cubit = args['cubit'] as WhereToCubit;
      //   return MaterialPageRoute(
      //     builder: (_) => SearchDestinationScreen(
      //       cubit: cubit,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.addUnitGeneralInfo:
      //   return MaterialPageRoute(
      //     builder: (_) => const AddUnitGeneralInfo(),
      //     settings: settings,
      //   );

      // case Routes.addUpdateProperty:
      //   addUpdatePropertyFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final id = args['id'] as int;

      //   return MaterialPageRoute(
      //     builder: (_) => PropertyUpdateScreen(
      //       id: id,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.bookingDetailsScreen:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final request = args['request'] as BookingRequest;

      //   final unitDetails = args['unitDetails'] as UnitTenantDetails;

      //   return MaterialPageRoute(
      //     builder: (_) => BookingDetailsScreen(
      //       request: request,
      //       unitDetails: unitDetails,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.unitChatMessagesScreen:
      //   getUnitChatMessagesTenantFactory();
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final id = args['id'] as String;
      //   final name = args['name'] as String;
      //   final image = args['image'] as String;
      //   final unitChatId = args['unitChatId'] as String;
      //   return MaterialPageRoute(
      //     builder: (_) => UnitChatMessagesScreen(
      //       id: id,
      //       name: name,
      //       image: image,
      //       unitChatId: unitChatId,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.bothTypeChatsForRentedScreen:
      //   getUnitChatsBothTypeRentedFactory();

      //   return MaterialPageRoute(
      //     builder: (_) => const BothTypeChatsForRentedScreen(),
      //     settings: settings,
      //   );
      // case Routes.FullScreenUnitImages:
      //   final args = settings.arguments as Map<String, dynamic>;

      //   final cubit = args['cubit'] as ShowUnitsDetailsCubit;
      //   return MaterialPageRoute(
      //     builder: (_) => FullScreenUnitImages(
      //       cubit: cubit,
      //     ),
      //     settings: settings,
      //   );
      // case Routes.OptionsAmentiesFeaturesScreen:
      //   final args = settings.arguments as Map<String, dynamic>;

      //   final cubit = args['cubit'] as ShowUnitsDetailsCubit;
      //   return MaterialPageRoute(
      //     builder: (_) => OptionsAmentiesFeaturesScreen(
      //       cubit: cubit,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.PointsSeeMore:
      //   final args = settings.arguments as Map<String, dynamic>;

      //   final cubit = args['cubit'] as HomeCubit;
      //   return MaterialPageRoute(
      //     builder: (_) => PointsSeeMore(
      //       cubit: cubit,
      //     ),
      //     settings: settings,
      //   );
      // case Routes.LastReviewsSeeMore:
      //   final args = settings.arguments as Map<String, dynamic>;

      //   final cubit = args['cubit'] as HomeCubit;
      //   return MaterialPageRoute(
      //     builder: (_) => LastReviewsSeeMore(
      //       cubit: cubit,
      //     ),
      //     settings: settings,
      //   );
      // case Routes.AllReviews:
      //   final args = settings.arguments as Map<String, dynamic>;

      //   final rating = args['rating'] as RatingTenant;
      //   final unitName = args['unitName'] as String;
      //   return MaterialPageRoute(
      //     builder: (_) => AllReviewsScreen(
      //       rating: rating,
      //       unitName: unitName,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.bestPlacesSeeMore:
      //   final args = settings.arguments as Map<String, dynamic>;

      //   final homeTenantState = args['HomeTenantState'] as HomeTenantState;
      //   return MaterialPageRoute(
      //     builder: (_) => BestPlacesSeeMore(
      //       state: homeTenantState,
      //     ),
      //     settings: settings,
      //   );

      // case Routes.chooseYourDestinationSeeMore:
      //   final args = settings.arguments as Map<String, dynamic>;

      //   final homeTenantState = args['HomeTenantState'] as HomeTenantState;
      //   return MaterialPageRoute(
      //     builder: (_) => ChooseYourDestinationPlacesSeeMore(
      //       state: homeTenantState,
      //     ),
      //     settings: settings,
      //   );
      // case Routes.FaqsScreen:
      //   termsConditionsPolicyFactory();
      //   return MaterialPageRoute(
      //     builder: (_) => FaqsScreen(),
      //     settings: settings,
      //   );
      // //
//
      default:
        return MaterialPageRoute(
          builder: (_) => NoRouteFoundScreen(settings: settings),
        );
    }
  }
}

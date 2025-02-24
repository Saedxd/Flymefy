import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/general/presernatation/screen/no_route_found/no_route_found.dart';
import 'package:flymefy/features/general/presernatation/screen/spalsh/splash_screen.dart';


class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
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

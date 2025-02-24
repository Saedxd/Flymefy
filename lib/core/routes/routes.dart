//class of all routes
sealed class Routes {
  //initial
  static const String splash = '/';
  //auth
  static const String login = '/loginPersionalUsing';
  //bussiness or user
  static const String register = '/registerPersionalUsing';

  static const String forgotPasswordPhoneNumber = '/forgotPasswordPhoneNumber';
  //addComplaintsAndSuggestions
  static const String addComplaintsAndSuggestions =
      '/addComplaintsAndSuggestions';
  //confirmCode
  static const String forgetPasswordOTPScreen = '/forgetPasswordOTP';
  static const String validateRegisterOTP = '/validateRegisterOTP';
  static const String forgetPasswordReset = '/ForgetPasswordReset';
  //showAllImages
  static const String showAllImages = '/showAllImages';
  static const String validatePhoneOTP = '/validatePhoneOTP';
  //changepassword
  static const String changePassword = '/changePassword';
  static const String changePhone = '/changePhone';
  static const String resetPassword = '/resetPassword';
  static const String helpCenter = '/helpCenter';

  //searchLocation
  static const String searchLocation = '/searchLocation';
  //home
  static const String home = '/home';
  static const String music = '/music';
  //galleries
  static const String galleries = '/galleries';
  static const String galleriesDetails = '/galleriesDetails';
  //sell car
  static const String sellCar = '/sellCar';
  //favorites
  static const String favorites = '/favorites';
  //menu
  static const String menu = '/menu';
  //profile
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';

  static const String changeEmail = '/changeEmail';

  //notification
  static const String notification = '/notification';
  static const String notificationDetails = '/notificationDetails';
  static const String successScreen = '/successScreen';
  static const String successScreenRegister = '/successScreenRegister';
  //setting

  //lang
  static const String lang = '/lang';

  //home
  //carDetails
  static const String carDetails = '/carDetails';

  //oldCars
  static const String oldCarsDetails = '/oldCarsDetails';
  static const String newCarsDetails = '/newCarsDetails';
  //browse car and search
  static const String browseAndSearchCar = '/browseAndSearchCar';
  //fliterBrowseAndSearchCar
  static const String fliterBrowseAndSearchCar = '/fliterBrowseAndSearchCar';
  //AllFilterScreen
  static const String allFilter = '/allFilter';
  //model and brand
  static const String modelAndBrandFilter = '/modelAndBrandFilter';

  // chat
  static const String chat = '/chat';
  static const String messages = '/messages';
  //mycars
  static const String myCars = '/myCars';
  //newCar
  static const String newCars = '/newCars';
  //usedCar
  static const String usedCars = '/usedCars';
  //السيارات المُباعة
  static const String soldCars = '/soldCars';
  //wallet
  static const String wallet = '/wallet';
  // static const String rechargeWallet = '/rechargeWallet';
  // static const String qrCodeWallet = '/qrCodeWallet';
  //offersAndPackages
  static const String offersAndPackages = '/offersAndPackages';
  // faq
  static const String faq = '/faq';
  //Complaints and suggestions
  static const String complaintsAndSuggestions = '/complaintsAndSuggestions';
  static const String complaintDetails = '/complaintDetails';
  static const String enterComplaint = '/enterComplaint';

  //about
  static const String aboutUs = '/aboutUs';

  ///view photo
  static const String photoView = '/photoView';

  // successPage;

  // chat
  static const String upgradeAds = '/upgradeAds';

  static const String editCar = '/editCar';

  static const String permssion = '/permssion';

  //addPromoCode
  //promoCode
  static const String addPromoCode = '/addPromoCode';
  static const String selectPropertyAddingPromoCode =
      '/selectPropertyAddingPromoCode';
  static const String promoCode = '/promoCode';
  //editPromoCode
  // static const String editPromoCode = '/editPromoCode';
// ============================add Propertery routes =============================
//firstpage choose location
  static const String chooseLocationAddProperty = '/chooseLocationAddProperty';
  static const String confrimLocationAddProperty =
      '/confrimLocationAddProperty';
  static const String updateMenuUnit = '/addPropertyAddDetails';
  static const String addPropertyAddPhotos = '/addPropertyAddPhotos';
  static const String addPropertyPrices = '/addPropertyPrices';
  static const String addPropertyFacilities = '/addPropertyFacilities';
  static const String detailsUnit = '/detailsUnit';
  static const String reviewsUnit = '/reviewsUnit';
  //UpdateUnitScreen
  static const String updateUnit = '/updateUnit';

  static const String updateChooseLocationAddProperty =
      '/updateChooseLocationAddProperty';
  static const String updateConfrimLocationAddProperty =
      '/updateConfrimLocationAddProperty';
  static const String updatePropertyAddDetails = '/updatePropertyAddDetails';
  static const String updatePropertyAddPhotos = '/updatePropertyAddPhotos';
  static const String updatePropertyPrices = '/updatePropertyPrices';
  static const String updatePropertyFacilities = '/updatePropertyFacilities';

  //showCalnder
  static const String showCalander = '/showCalander';

  //whereTo
  static const String whereTo = '/whereTo';
  static const String whereToResult = '/whereToResult';
  //ShowUnitsDetailsScreen
  static const String showUnitsDetails = '/showUnitsDetails';
  // ReviewsScreen
  static const String reviews = '/reviews';

  //booking
  static const String booking = '/booking';
  static const String bookingDetails = '/bookingDetails';
  //paymentCheckoutBooking
  static const String paymentCheckoutBooking = '/paymentCheckoutBooking';
  //successBooking
  static const String successBooking = '/successBooking';
  //reservationsDetails
  static const String reservationsDetails = '/reservationsDetails';
  static const String cancellationOfReservationPolicy =
      '/cancellationOfReservationPolicy';
  static const String PropertiesScreen = '/PropertiesScreen';

  static const String termsAndConditions = '/terms';
  static const String privacyPolicy = '/privacyPolicy';
  static const String selfCheckIn = '/selfCheckIn';
  static const String unitSetting = '/unitSetting';
  static const String cancellationOfReservDetails = "/cancellationPolicy";
  static const String insuranceDetails = "/insurancePolicy";
  static const String pointsDetails = "/pointBenefit";

  static const String pointsPage = '/pointsPage';

  static const String calenderReservations = '/calenderReservations';
  //
  static const String chatMessagesScreen = '/ChatMessagesScreen';
  static const String searchDestination = '/searchDestination';
  static const String addUnitGeneralInfo = '/AddUnitGeneralInfo';
  static const String addUpdateProperty = '/addUpdateProperty';
  static const String bookingDetailsScreen = "/BookingDetailsScreen";

  static const String unitChatMessagesScreen = "/UnitChatMessagesScreen";

  static const String bothTypeChatsForRentedScreen =
      "/BothTypeChatsForRentedScreen";
  static const String addUnitScreen = "/addUnitScreen";
  static const String FullScreenUnitImages = "/FullScreenUnitImages";
  static const String OptionsAmentiesFeaturesScreen =
      "/OptionsAmentiesFeaturesScreen";

  static const String PointsSeeMore = "/PointsSeeMore";
  static const String LastReviewsSeeMore = "/LastReviewsSeeMore";
  static const String AllReviews = "/AllReviews";
  static const String bestPlacesSeeMore = "/bestPlacesSeeMore";
  static const String chooseYourDestinationSeeMore =
      "/chooseYourDestinationSeeMore";
      static const String FaqsScreen = "/FaqsScreen";
  //addunt
}

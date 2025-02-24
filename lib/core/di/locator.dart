import 'dart:io';



import '../app_export.dart';

final instance = GetIt.instance;
Future<void> initAppServicesGetIt() async {
  await general();
  showDialogAndSnackbar();
  authentication();
  langauge();

  notifications();
  launchUrl();
}

Future<void> general() async {
  //internet connection
  instance.registerLazySingleton(() => InternetConnection());
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: instance()));

  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton(() => sharedPreferences);

  AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding);
  IOSOptions getIOSOptions() => const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: true);
  instance.registerLazySingleton<FlutterSecureStorage>(() =>
      FlutterSecureStorage(
          iOptions: getIOSOptions(), aOptions: getAndroidOptions()));

  instance.registerLazySingleton<AppPreferences>(() => AppPreferencesImpl(
        sharedPreferences: instance(),
        secureStorage: instance(),
      ));
  // remote
  instance.registerLazySingleton<IDioFactory>(() => DioFactoryImpl(
        appPreferences: instance(),
      ));
  final dio = await instance<IDioFactory>().getDio();

  instance.registerLazySingleton<ClientApi>(() => ClientApiImpl(
        dio: dio,
      ));

  instance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
      networkInfo: instance(),
      appPreferences: instance(),
      clientApi: instance()));
}

void notifications() {
  instance.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpls(
            apiClient: instance(),
            networkInfo: instance(),
          ));

  instance.registerLazySingleton<GetNotificationsUseCase>(
      () => GetNotificationsUseCase(repository: instance()));

  instance.registerLazySingleton<ReadingNotificationUseCase>(
      () => ReadingNotificationUseCase(repository: instance()));

  instance.registerLazySingleton<NotificationCubit>(() => NotificationCubit(
      readingNotificationUseCase: instance(),
      getNotificationsUseCase: instance()));
}

//authentications
void authentication() {
  instance.registerLazySingleton<GetAuthenticationUseCase>(
      () => GetAuthenticationUseCase(repository: instance()));

  instance.registerLazySingleton<ChangeAuthenticationUseCase>(
      () => ChangeAuthenticationUseCase(repository: instance()));

  instance.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(repository: instance()));
  instance.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(repository: instance()));
  instance.registerLazySingleton<StoreCountryIsoCode>(
      () => StoreCountryIsoCode(repository: instance()));

  instance.registerLazySingleton<AuthenticationCubit>(() => AuthenticationCubit(
      changeAuthenticationUseCase: instance(),
      getUserUseCase: instance(),
      logoutUseCase: instance(),
      getAuthenticationUseCase: instance(),
      storeCountryIsoCode: instance()));
}

void langauge() {
  instance.registerLazySingleton<GetLangUseCase>(
      () => GetLangUseCase(repository: instance()));
  instance.registerLazySingleton<CashLangUseCase>(
      () => CashLangUseCase(repository: instance()));
  instance.registerLazySingleton<LangaugeCubit>(() =>
      LangaugeCubit(getLangUseCase: instance(), cashLangUseCase: instance()));
}

//SEARCH

void showDialogAndSnackbar() {
  instance.registerLazySingleton<IShowAlertMessage>(ShowAlertMessageImpl.new);
}

Future<void> firebaseInit() async {
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      // name: DefaultFirebaseOptions.ios.projectId,
      // options: DefaultFirebaseOptions.currentPlatform,
    );

    // request permission android
    // await FirebaseMessaging.instance.requestPermission(

    //     sound: true, badge: true, alert: true, provisional: false);

    instance.registerLazySingleton<LocalNotification>(
        () => LocalNotificationImpl()..initializeLocalNotificationSetting());
  }
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
    );

    // request permission android
    await FirebaseMessaging.instance.requestPermission(
        sound: true, badge: true, alert: true, provisional: false);

    instance.registerLazySingleton<LocalNotification>(
        () => LocalNotificationImpl()..initializeLocalNotificationSetting());
  }
}

void launchUrl() {
  instance.registerLazySingleton<LauncherUrls>(() => LaunchUrlsImpl());
}

import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/resources_manager/theme.dart';
import 'package:flymefy/core/routes/pages.dart';
import 'package:flymefy/core/service/localization/app_localizations_setup.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get navigator => navigatorKey.currentState!;

class AppProductionStartPoint extends StatelessWidget {
  final AppRouter appRouter;
  const AppProductionStartPoint({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => instance<LangaugeCubit>()..getLang(),
        ),

        //AUTH
        BlocProvider(
          create: (_) => instance<AuthenticationCubit>()..getAuthentication(),
        ),
    
        //notification
        BlocProvider(
          create: (_) => instance<NotificationCubit>(),
        ),
      ],
      child: FlymefyAppMaterailProduction(
        appRouter: appRouter,
      ),
    );
  }
}

class FlymefyAppMaterailProduction extends StatefulWidget {
  final AppRouter appRouter;

  const FlymefyAppMaterailProduction({
    super.key,
    required this.appRouter,
  });

  @override
  State<FlymefyAppMaterailProduction> createState() =>
      _FlymefyAppMaterailProductionState();
}

class _FlymefyAppMaterailProductionState extends State<FlymefyAppMaterailProduction>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangaugeCubit, LangaugeState>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallBack,
          builder: (context, child) {
            return MultiBlocListener(listeners: [
              BlocListener<AuthenticationCubit, AuthenticationState>(
                listenWhen: (previous, current) =>
                    previous.appAuthenticationLevel !=
                    current.appAuthenticationLevel,
                listener: (context, state) {
                  if (state.appAuthenticationLevel ==
                      AppAuthenticationLevel.authenticated) {
                    while (navigator.canPop()) {
                      navigator.pop();
                    }
                    navigator.pushNamedAndRemoveUntil(
                        Routes.home, (Route<dynamic> route) => false);
                  } else if (state.appAuthenticationLevel ==
                      AppAuthenticationLevel.visitor) {
                    while (navigator.canPop()) {
                      navigator.pop();
                    }
                    navigator.pushNamedAndRemoveUntil(
                      Routes.home,
                      (Route<dynamic> route) => false,
                    );
                  } else if (state.appAuthenticationLevel ==
                          AppAuthenticationLevel.unAuthenticated ||
                      state.appAuthenticationLevel ==
                          AppAuthenticationLevel.blocked) {
                    while (navigator.canPop()) {
                      navigator.pop();
                    }
                    navigator.pushNamedAndRemoveUntil(
                      Routes.login,
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    while (navigator.canPop()) {
                      navigator.pop();
                    }
                    navigator.pushNamedAndRemoveUntil(
                        Routes.splash, (Route<dynamic> route) => false);
                  }
                },
              ),
              BlocListener<NotificationCubit, NotificationState>(
                listener: (context, state) {
                  if (state.flowStateApp == FlowStateApp.newNotification) {
                    instance<LocalNotification>()
                        .showNotification(state.currentNotification);
                  }
                },
              ),
            ], child: child!);
          },
          navigatorKey: navigatorKey,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          onGenerateRoute: widget.appRouter.generateRoute,
          locale: state.locale,
          theme: ThemeManager().getLightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}

Future<void> initAppProduction() async {
  WidgetsFlutterBinding.ensureInitialized();
  // responsive ui
  //await ScreenUtil.ensureScreenSize();
  // firebase configuration
  await firebaseInit();
  // service locator
  await initAppServicesGetIt();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    instance<NotificationCubit>().showNotification(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) =>
      instance<NotificationCubit>().showNotification);

  //FlutterNativeSplash.remove();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async =>
    instance<NotificationCubit>().showNotification;

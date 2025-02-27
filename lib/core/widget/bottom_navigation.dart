import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/widget/appbar.dart';

import '../di/factory_locator.dart';
import '../di/property_factory.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  final int currentIndex;
  const ScaffoldWithNestedNavigation({Key? key, required this.currentIndex})
      : super(
          key: key ?? const ValueKey('ScaffoldWithNestedNavigation'),
        );

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation> with WidgetsBindingObserver {
  int currentIndex = 0;
  bool showNotification = true;
  bool showMusic = false;
  bool showChat = false;
  bool isTenant = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    changeIndex();
    getUserData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void getUserData() {
    setState(() {
      isTenant = context.read<AuthenticationCubit>().state.user.isTenant;
    });
  }

  void changeIndex() {
    setState(() {
      currentIndex = widget.currentIndex;
    });
  }

  void changeIndexAsIWant(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  String getTitle() {
    switch (currentIndex) {
      case 2:
        return trans(context, AppStrings.home);
      case 1:
        return trans(
            context, isTenant ? AppStrings.favorite : AppStrings.myProperties);
      case 0:
        return trans(
            context, isTenant ? AppStrings.booking : AppStrings.reservations);
      case 3:
        return trans(context, isTenant ? AppStrings.chat : AppStrings.calendar);
      default:
        return trans(context, AppStrings.more);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MainNavgaitionWidget(
        child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
          listenWhen: (previous, current) =>
              previous.user.isTenant != current.user.isTenant,
          listener: (context, state) {
            isTenant = state.user.isTenant;
            setState(() {});
          },
          builder: (context, state) {
            return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) async {
                  log('didPop: $didPop, result: $result');
                  if (didPop) return;

                  instance<IShowAlertMessage>().ShowAsktoConfirm(
                      context, AppStrings.areyouExitFromApp, () {
                    SystemNavigator.pop();
                  });
                },
                child: Scaffold(
                  appBar:  null,
                  backgroundColor: const Color(0xFFFFFFFF),
                  body: Container(
                    padding: EdgeInsets.zero, // Remove any default padding
                    margin: EdgeInsets.zero, // Remove any default margin
                    child: Body(
                      index: currentIndex,
                    
                    ),
                  ),
                  bottomNavigationBar: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF82A9BC)
                                .withOpacity(0.5), // Shadow color
                            blurRadius: 10.0, // Softening the shadow
                            spreadRadius: 1.0, // How much the shadow spreads
                            offset:
                                const Offset(0, 2), // Position of the shadow
                          ),
                        ],
                      ),
                      child: NavigationBarTheme(
                        data: NavigationBarThemeData(
                          labelTextStyle:
                              WidgetStateProperty.resolveWith((states) {
                            if (states.contains(WidgetState.selected)) {
                              return TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.primaryColor,
                              );
                            }
                            return TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff787377),
                            );
                          }),
                        ),
                        child: NavigationBar(
                          height: 67,
                          animationDuration: const Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          elevation: 3,
                          shadowColor: const Color(0xFF82A9BC).withOpacity(1),
                          selectedIndex: currentIndex,
                          indicatorColor: ColorManager.whiteColor,
                          labelBehavior:
                              NavigationDestinationLabelBehavior.alwaysShow,
                          destinations: [
                            NavigationDestination(
                              label: trans(
                                  context,
                                  isTenant
                                      ? AppStrings.booking
                                      : AppStrings.reservations),
                              icon: getImageBottomNav(
                                  isTenant
                                      ? Assets.assetsImgCalendarPlus02
                                      : Assets.assetsImgCalendarPlus02,
                                  0),
                            ),
                            NavigationDestination(
                              label: trans(
                                  context,
                                  isTenant
                                      ? AppStrings.favorite
                                      : AppStrings.properties),
                              icon: getImageBottomNav(
                                  isTenant
                                      ? Assets.assetsImgLove
                                      : Assets.assetsImgPropertiesSvg,
                                  1),
                            ),
                            NavigationDestination(
                              label: trans(context, AppStrings.home),
                              icon: getImageBottomNav(
                                  Assets.assetsImgLogowithoutWord, 2),
                            ),
                            // Stack(
                            //   children: [
                            NavigationDestination(
                              enabled:
                                  // isTenant ? false :
                                  true,
                              label: trans(
                                  context,
                                  isTenant
                                      ? AppStrings.chat
                                      : AppStrings.calendar),
                              icon: getImageBottomNav(
                                  isTenant
                                      ? Assets.assetsImgChat
                                      : Assets.assetsImgCalenderSvg,
                                  3),
                            ),
                            NavigationDestination(
                              label: trans(context, AppStrings.more),
                              icon: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: getImageBottomNav(
                                      Assets.assetsImgMoreSvg, 4)),
                            ),
                          ],
                          onDestinationSelected: (index) {
                            currentIndex = index;
                            if (isTenant) {
                              changeValueIndexIsTenant(currentIndex);
                            } else {
                              changeValueIndexIsNotTenant(currentIndex);
                            }
                          },
                          indicatorShape: null,
                        ),
                      )),
                ));
          },
        ),
      );
    });
  }

  void changeValueIndexIsNotTenant(int currentIndex) {
    if (currentIndex == 2) {
      showNotification = true;
      showMusic = false;
      showChat = false;
      context.read<AuthenticationCubit>().getUser();
    } else if (currentIndex == 1) {
      showNotification = false;
      showMusic = false;
      showChat = false;
    } else if (currentIndex == 0) {
      showNotification = true;
      showMusic = false;
      showChat = false;
    } else if (currentIndex == 3) {
      showNotification = true;
      showMusic = false;
      showChat = false;
    } else {
      showNotification = true;
      showMusic = false;
      showChat = false;
      context.read<AuthenticationCubit>().getUser();
    }

    setState(() {
      this.currentIndex = currentIndex;
    });
  }

  void changeValueIndexIsTenant(int currentIndex) {
    // context.read<AuthenticationCubit>().getUser();

    if (currentIndex == 2) {
      showNotification = true;
      showMusic = false;
      showChat = false;
      context.read<AuthenticationCubit>().getUser();
    } else if (currentIndex == 1) {
      showNotification = true;
      showMusic = false;
      showChat = false;
    } else if (currentIndex == 0) {
      showNotification = true;
      showMusic = false;
      showChat = false;
    } else if (currentIndex == 3) {
      showNotification = true;
      showMusic = false;
      showChat = false;
      // Navigator.pushNamed(context, Routes.chat);
    } else {
      showNotification = true;
      showMusic = false;
      showChat = false;
      context.read<AuthenticationCubit>().getUser();
    }
    setState(() {
      this.currentIndex = currentIndex;
    });
  }

  Widget getImageBottomNav(String image, int index) {
    return image.toSvgAssetImage(
        fromLogin: true,
        height: index == 2
            ? 32
            : image == Assets.assetsImgLove || index == 4
                ? 20
                : 24,
        color: currentIndex == index
            ? ColorManager.primaryColor
            : const Color(0xFF787377),
        fit: BoxFit.contain,
        width: AppSize.appSize22);
  }
}

class Body extends StatelessWidget {
  final int index;
  
  const Body(
      {super.key,
      required this.index,
      });

  @override
  Widget build(BuildContext context) {
      switch (index) {
        case 2:

          //   homeTenantFactory();

          return Container();
        case 1:
          //  getFavsFactory();

          return Container();
        case 0:
          //  getReservationsFactory();
          return Container();
        case 3:
          // allChatsForAllUnitsForTenantFactory();
          return Container();
        default:
          //  MenuScreenFactory();
          return Container();
      }

    }
  }



class BottomNavBarButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color color;
  final double height;
  final Color colortext;
  final double fontSize;
  final double? width;
  final FontWeight fontWeight;
  final bool isLoading;
  final double radius;
  const BottomNavBarButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = ColorManager.primaryColor,
      this.height = 45,
      this.width,
      this.colortext = Colors.white,
      this.isLoading = false,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500,
      this.radius = AppSize.appSize8});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      child: trans(context, title).toEelevatedButton(
        radius: radius,
        height: height,
        context,
        onTap,
        isLoading: isLoading,
        color: color,
        colortext: colortext,
        fontSize: fontSize,
        fontWeight: fontWeight,
        width: MediaQuery.of(context).size.width,
      ),
    ).paddingSymmetric(horizontal: 16);
  }
}

class BottomNavBarButtonWithIcon extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color color;
  final double height;
  final Color colortext;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isLoading;
  final String IconPath;
  const BottomNavBarButtonWithIcon(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = ColorManager.primaryColor,
      this.height = 45,
      this.colortext = Colors.white,
      this.isLoading = false,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500,
      required this.IconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      width: 247,
      height: 52,
      child: Row(
        children: [
          title.toEelevatedButton(
            height: height,
            context,
            onTap,
            isLoading: isLoading,
            color: ColorManager.primaryColor,
            colortext: colortext,
            fontSize: fontSize,
            fontWeight: fontWeight,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 16);
  }
}

// to button in bottom navigation bar next and back

class BottomNavBarButtonNextBack extends StatelessWidget {
  final String titleOk;
  final String titleBack;
  final Function()? onTapOk;
  final Function()? onTapBack;
  final Color color;
  final double height;
  final Color colortext;
  final double fontSize;
  final double padding;
  final FontWeight fontWeight;
  final bool isLoading;
  const BottomNavBarButtonNextBack(
      {super.key,
      this.titleOk = AppStrings.next,
      this.titleBack = AppStrings.back,
      this.onTapOk,
      this.padding = 16,
      this.onTapBack,
      this.color = ColorManager.primaryColor,
      this.height = 45,
      this.colortext = Colors.white,
      this.isLoading = false,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      height: height,
      child: [
        titleBack.toEelevatedButtonWithBorder(
          height: 45,
          context,
          onTapBack ??
              () {
                Navigator.pop(context);
              },
          borderColor: ColorManager.primaryColor,
          color: ColorManager.whiteColor,
          colortext: ColorManager.primaryColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          width: MediaQuery.of(context).size.width / 2 - 24,
        ),
        titleOk.toEelevatedButton(
          height: 45,
          context,
          onTapOk,
          isLoading: isLoading,
          color: ColorManager.primaryColor,
          colortext: colortext,
          fontSize: fontSize,
          fontWeight: fontWeight,
          width: MediaQuery.of(context).size.width / 2 - 24,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).paddingSymmetric(horizontal: padding);
  }
}

class BottomNavBarSaveButtonBack extends StatelessWidget {
  final String titleOk;
  final String titleBack;
  final Function()? onTapOk;
  final Function()? onTapBack;
  final Color color;
  final double height;
  final Color colortext;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isLoading;
  final double padding;
  const BottomNavBarSaveButtonBack(
      {super.key,
      this.titleOk = AppStrings.save,
      this.titleBack = AppStrings.cancel,
      this.padding = 16,
      this.onTapOk,
      this.onTapBack,
      this.color = ColorManager.primaryColor,
      this.height = 55,
      this.colortext = Colors.white,
      this.isLoading = false,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      height: height,
      child: [
        titleOk.toEelevatedButton(
          height: 45,
          context,
          onTapOk,
          isLoading: isLoading,
          color: ColorManager.primaryColor,
          colortext: ColorManager.whiteColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          width: MediaQuery.of(context).size.width / 2 - 24,
        ),
        titleBack.toEelevatedButtonWithBorder(
          height: 45,
          context,
          onTapBack ??
              () {
                Navigator.pop(context);
              },
          borderColor: ColorManager.primaryColor,
          color: ColorManager.whiteColor,
          colortext: ColorManager.primaryColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          width: MediaQuery.of(context).size.width / 2 - 24,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).paddingSymmetric(horizontal: padding);
  }
}

Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = true,
  bool showDragHandle = true,
  Duration duration = const Duration(milliseconds: 300),
  Curve curve = Curves.easeInOut,
  Curve reverseCurve = Curves.easeInOut,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    showDragHandle: showDragHandle,
    sheetAnimationStyle: AnimationStyle(
      curve: curve,
      reverseCurve: reverseCurve,
      duration: duration,
      reverseDuration: duration,
    ),
    transitionAnimationController: AnimationController(
      duration: duration,
      vsync: Navigator.of(context),
    )..forward(),
    builder: builder,
  );
}

class MainPageHeader extends StatefulWidget {
  const MainPageHeader({
    Key? key,
    required this.title,
    required this.onTapBack,
    required this.onStatusSelected,
    required this.showFilter,
    required this.data,
  }) : super(key: key);

  final String title;
  final VoidCallback onTapBack;
  final Function(String selectedId) onStatusSelected;
  final bool showFilter;
  final Map<String, String> data;

  @override
  _MainPageHeaderState createState() => _MainPageHeaderState();
}

class _MainPageHeaderState extends State<MainPageHeader> {
  late Map<String, String> _data; // Modifiable map copy
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();

    // Create a modifiable copy of the map
    _data = Map<String, String>.from(widget.data);

    // Add initial data dynamically
    _data.putIfAbsent(
      "0",
      () => context.isArabic ? "الكل" : "All",
    );

    // Set the initial selected status to "0"
    _selectedStatus = "0";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 28,
            width: MediaQuery.of(context).size.width - 55,
            child: Row(
              children: [
                // Back button
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 27,
                  ),
                  onPressed: widget.onTapBack, // Call onTapBack when pressed
                ),

                // Page title
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Color(0xff1C1F26),
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ).marginOnly(top: 3),

                // Dropdown menu
                if (widget.showFilter)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PopupMenuButton<String>(
                        elevation: 3,
                        offset: const Offset(0, 30),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding:
                            const EdgeInsets.only(left: 0, top: 5, right: 0),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 25,
                          color: Colors.black,
                        ),
                        onSelected: (String value) {
                          setState(() {
                            _selectedStatus = value;
                          });
                          widget.onStatusSelected(value);
                        },
                        itemBuilder: (BuildContext context) {
                          return _data.entries.map((entry) {
                            return PopupMenuItem<String>(
                              height: 30,
                              padding: EdgeInsets.zero,
                              value: entry.key,
                              child: Container(
                                height: 30,
                                color: _selectedStatus == entry.key
                                    ? Color(0xffAD5F74)
                                    : Colors.white,
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(
                                        entry.value,
                                        style: TextStyle(
                                          color: _selectedStatus == entry.key
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: context.isArabic
                                            ? TextAlign.right
                                            : TextAlign.left,
                                      ).paddingSymmetric(horizontal: 10),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                      // Display the selected status in a container
                      if (_selectedStatus != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xffAD5F74),
                          ),
                          child: Text(
                            _data[_selectedStatus] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ).marginOnly(top: 5),
                    ],
                  ),
              ],
            ).paddingSymmetric(horizontal: 8),
          ),
        ],
      ),
    );
  }
}

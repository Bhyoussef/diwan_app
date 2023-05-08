import 'package:diwanapp/app/constants/assets_constants.dart';
import 'package:diwanapp/app/constants/constants.dart';
import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/widgets/SafeAreaRedTopWhiteBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItem {
  final String title;
  final String picPath;
  final Function onPressed;

  DrawerItem({
    required this.title,
    required this.picPath,
    required this.onPressed,
  });
}

List<DrawerItem> drawerItems(BuildContext context, int index) {
  return [
    DrawerItem(
      title: 'home'.tr,
      picPath: Assets.services,
      onPressed: () {
        _closeDrawer(context);
        if (index != homeIndex) {
          _navigateToScreen(
            context,
            AppRoutes.homeScreen,
          );
        }
      },
    ),
    DrawerItem(
      title: 'profile'.tr,
      picPath: Assets.profile,
      onPressed: () {
        _closeDrawer(context);
        if (index != profileIndex) {
          _navigateToScreen(
            context,
            AppRoutes.profileScreen,
          );
        }
      },
    ),
    DrawerItem(
      title: 'services'.tr,
      picPath: Assets.services,
      onPressed: () {
        _closeDrawer(context);
        if (index != servicesIndex) {
          Navigator.of(context).pushNamed(
            AppRoutes.servicesScreen,
            arguments: true,
          );
        }
      },
    ),
    DrawerItem(
      title: 'management_area'.tr,
      picPath: Assets.managementArea,
      onPressed: () {
        _closeDrawer(context);
        if (index != managementIndex) {
          Navigator.of(context).pushNamed(
            AppRoutes.managementScreen,
            arguments: true,
          );
        }
      },
    ),
    DrawerItem(
      title: 'notifications'.tr,
      picPath: Assets.notifications,
      onPressed: () {
        _closeDrawer(context);
        if (index != notificationsIndex) {
          _navigateToScreen(
            context,
            AppRoutes.notificationsScreen,
          );
        }
      },
    ),
    DrawerItem(
      title: 'contact'.tr,
      picPath: Assets.support,
      onPressed: () {
        _closeDrawer(context);
        if (index != contactIndex) {
          _navigateToScreen(
            context,
            AppRoutes.contactScreen,
          );
        }
      },
    ),
    DrawerItem(
      title: 'logout'.tr,
      picPath: Assets.logout,
      onPressed: () {
        _closeDrawer(context);
        SharedData.clearStorage();
        Navigator.of(context).pushReplacementNamed(
          AppRoutes.loginScreen,
        );
      },
    ),
  ];
}

_closeDrawer(BuildContext context) {
  Navigator.of(context).pop();
}

_navigateToScreen(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

class HomeDrawer extends StatefulWidget {
  final int index;
  const HomeDrawer({Key? key, required this.index}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String _firstName = '';
  String _lastName = '';
  @override
  void initState() {
    SharedData.getFromStorage('USER_FIRST_NAME', 'string')
        .then((firstName) async {
      _firstName = firstName;
    });
    SharedData.getFromStorage('USER_LAST_NAME', 'string')
        .then((lastName) async {
      _lastName = lastName;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeAreaRedTopWhiteBody(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 247, 247, 247),
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/drawer_avatar.png',
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(width: 13),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'name',
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 30),
                child: Column(
                  children: drawerItems(context, widget.index)
                      .map(
                        (item) => InkWell(
                          onTap: () {
                            item.onPressed();
                          },
                          splashColor:
                              AppColor.primaryRedColor.withOpacity(0.23),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  child: Image.asset(
                                    item.picPath,
                                    height: 24,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  item.title,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:diwanapp/app/constants/assets_constants.dart';
import 'package:diwanapp/app/constants/constants.dart';
import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:diwanapp/app/views/home/ServicesCardGrid.dart';
import 'package:diwanapp/app/views/home/drawer/homeDrawer.dart';
import 'package:diwanapp/app/views/home/homeServices.dart';
import 'package:diwanapp/app/widgets/AppBarStandard.dart';
import 'package:diwanapp/app/widgets/BottomTextureOnly.dart';
import 'package:diwanapp/app/widgets/PadawinButton.dart';
import 'package:diwanapp/app/widgets/SafeAreaRedTopWhiteBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const HomeDrawer(index: homeIndex),
        body: SafeAreaRedTopWhiteBody(
          child: BottomTextureOnly(
            child: CustomScrollView(
              slivers: [
                AppBarStandard(
                  title: 'home'.tr,
                  isHome: true,
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'services'.tr,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                            AppRoutes.servicesScreen,
                            arguments: false,
                          ),
                          child: Row(
                            children: [
                              Text('see_all'.tr),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.arrow_forward_outlined,
                                size: 15,
                                color: AppColor.primaryRedColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ServicesCardGrid(
                  homeServices: homeServices(
                    context,
                    items: [
                      offersIndex,
                      coursesIndex,
                      contactDirectoryIndex,
                      certificatesIndex
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 20,
                    right: 20,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        PadiwanButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.managementScreen,
                              arguments: false,
                            );
                          },
                          text: 'management_area'.tr,
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          left: -40,
                          child: Image.asset(
                            Assets.settingsIcon,
                            height: 98,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

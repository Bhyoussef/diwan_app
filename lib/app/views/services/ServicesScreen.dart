import 'package:diwanapp/app/constants/constants.dart';
import 'package:diwanapp/app/views/home/ServicesCardGrid.dart';
import 'package:diwanapp/app/views/home/drawer/homeDrawer.dart';
import 'package:diwanapp/app/views/home/homeServices.dart';
import 'package:diwanapp/app/widgets/AppBarStandard.dart';
import 'package:diwanapp/app/widgets/BottomTextureOnly.dart';
import 'package:diwanapp/app/widgets/SafeAreaRedTopWhiteBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fromMenu = ModalRoute.of(context)!.settings.arguments as bool;

    return Scaffold(
      drawer: const HomeDrawer(index: servicesIndex),
      body: SafeAreaRedTopWhiteBody(
        child: BottomTextureOnly(
          child: CustomScrollView(
            slivers: [
              AppBarStandard(title: 'services'.tr, isHome: fromMenu),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                sliver: ServicesCardGrid(
                  homeServices: homeServices(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

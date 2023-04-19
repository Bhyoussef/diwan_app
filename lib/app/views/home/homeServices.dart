import 'package:diwanapp/app/constants/assets_constants.dart';
import 'package:diwanapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeService {
  final String title;
  final String picPath;
  final String namedRoute;

  HomeService(
      {required this.title, required this.picPath, required this.namedRoute});
}

List<HomeService> homeServices(BuildContext context, {List<int>? items}) {
  final allServices = [
    ///1 Only for Qatari
    HomeService(
      title: 'loan_request'.tr,
      picPath: Assets.advanceRequestIcon,
      namedRoute: AppRoutes.loanRequestScreen,
    ),

    ///2 Only for Qatari
    HomeService(
      title: 'school_allowance'.tr,
      picPath: Assets.schoolAllowanceIcon,
      namedRoute: AppRoutes.schoolAllowanceScreen,
    ),

    ///3
    HomeService(
      title: 'leave_request'.tr,
      picPath: Assets.attendanceIcon,
      namedRoute: AppRoutes.leaveRequestListScreen,
    ),

    ///4
    HomeService(
      title: 'certificates'.tr,
      picPath: Assets.certificateIcon,
      namedRoute: AppRoutes.certificateScreen,
    ),

    ///6
    HomeService(
      title: 'attendance'.tr,
      picPath: Assets.attendanceIcon,
      namedRoute: AppRoutes.attendanceScreen,
    ),

    ///7
    HomeService(
      title: 'offers'.tr,
      picPath: Assets.offersIcon,
      namedRoute: AppRoutes.offersScreen,
    ),

    ///8
    HomeService(
      title: 'courses'.tr,
      picPath: Assets.coursesIcon,
      namedRoute: AppRoutes.coursesScreen,
    ),
  ];

  if (items != null) {
    List<HomeService> selectedServices = [];
    for (int index in items) {
      selectedServices.add(allServices[index]);
    }
    return selectedServices;
  }

  return allServices;
}

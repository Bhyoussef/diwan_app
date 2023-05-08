import 'package:diwanapp/app/views/home/HomeScreen.dart';
import 'package:diwanapp/app/views/language/LanguageScreen.dart';
import 'package:diwanapp/app/views/login/LoginScreen.dart';
import 'package:diwanapp/app/views/services/ServicesScreen.dart';
import 'package:diwanapp/app/views/services/pages/advance_requests/AdvanceRequestScreen.dart';
import 'package:diwanapp/app/views/services/pages/attendance/AttendanceScreen.dart';
import 'package:diwanapp/app/views/services/pages/certificates/CertificateScreen.dart';
import 'package:diwanapp/app/views/services/pages/certificates/HRCertificateScreen.dart';
import 'package:diwanapp/app/views/services/pages/courses/CoursesScreen.dart';
import 'package:diwanapp/app/views/services/pages/leave_requests/LeaveRequest.dart';
import 'package:diwanapp/app/views/services/pages/leave_requests/LeaveRequestList.dart';
import 'package:diwanapp/app/views/services/pages/loan_requests/LoanListScreen.dart';
import 'package:diwanapp/app/views/services/pages/loan_requests/LoanRequestScreen.dart';
import 'package:diwanapp/app/views/services/pages/offers/OffersScreen.dart';
import 'package:diwanapp/app/views/services/pages/school_allowances/SchoolAllowanceRequestScreen.dart';
import 'package:diwanapp/app/views/services/pages/school_allowances/SchoolAllowancesListScreen.dart';
import 'package:diwanapp/app/views/splash/SplashScreen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.initial;

  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => const LanguageScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.servicesScreen,
      page: () => const ServicesScreen(),
    ),
    GetPage(
      name: AppRoutes.loanRequestScreen,
      page: () => const LoanRequestScreen(),
    ),
    GetPage(
      name: AppRoutes.loanListScreen,
      page: () => const LoanListScreen(),
    ),
    GetPage(
      name: AppRoutes.leaveRequestListScreen,
      page: () => const LeaveRequestListScreen(),
    ),
    GetPage(
      name: AppRoutes.leaveRequestScreen,
      page: () => const LeaveRequestScreen(),
    ),
    GetPage(
      name: AppRoutes.certificateScreen,
      page: () => const CertificateScreen(),
    ),
    GetPage(
      name: AppRoutes.hrCertificateScreen,
      page: () => const HRCertificateScreen(),
    ),
    GetPage(
      name: AppRoutes.schoolAllowanceScreen,
      page: () => const SchoolAllowanceRequestScreen(),
    ),
    GetPage(
      name: AppRoutes.schoolAllowanceRequestScreen,
      page: () => const SchoolAllowanceListScreen(),
    ),
    GetPage(
      name: AppRoutes.advanceRequestScreen,
      page: () => const AdvanceRequestScreen(),
    ),
    GetPage(
      name: AppRoutes.coursesScreen,
      page: () => const CoursesScreen(),
    ),
    GetPage(
      name: AppRoutes.offersScreen,
      page: () => const OffersScreen(),
    ),
    GetPage(
      name: AppRoutes.attendanceScreen,
      page: () => const AttendanceScreen(),
    ),
  ];
}

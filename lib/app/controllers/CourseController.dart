import 'package:diwanapp/app/helpers/shared_preferences.dart';
import 'package:diwanapp/app/models/courses_list_model.dart';
import 'package:diwanapp/app/services/course_service.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  final CouresService _coursesService = CouresService();

  late List<CoursesList> coursesList = <CoursesList>[].obs;
  late CoursesList courseDetails;

  var isLoading = false.obs;
  var isLoadingDetails = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future loadAllCourses() async {
    isLoading(true);
    var userId;
    SharedData.getFromStorage('EMPLOYEE_ID', 'string').then((id) async {
      var response = await _coursesService.getCoursesList(id);

      if (response != null) {
        for (var course in response) {
          coursesList.add(course);
        }
      }
    });

    isLoading(false);
  }

  Future loadCourseDetails(id) async {
    isLoadingDetails(true);
    var response = await _coursesService.getCourseDetails(id);

    if (response != null) {
      isLoadingDetails(false);
      courseDetails = response[0];

      update();
    }
    isLoadingDetails(false);
  }
}

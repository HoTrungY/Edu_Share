import 'package:edu_share/models/course_model.dart';
import 'package:edu_share/models/remind_model.dart';
import 'package:edu_share/service/remote/course_services.dart';
import 'package:edu_share/service/remote/todo_services.dart';
import 'package:edu_share/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeVM extends BaseViewModel {
  final messageController = TextEditingController();
  PageController pageController = PageController();
  ScrollController scrollController = ScrollController();
  FocusNode messFocus = FocusNode();
  CourseServices courseServices = CourseServices();
  RemindServices todoServices = RemindServices();
  List<CourseModel> coursesLearning = [];
  List<CourseModel> coursesMoblie = [];
  List<CourseModel> coursesWeb = [];
  List<CourseModel> coursesAI = [];
  List<CourseModel> coursesData = [];
  List<CourseModel> coursesDesign = [];
  List<CourseModel> coursesLanguage = [];
  List<RemindModel> todos = [];
  int selectIndex = 0;
  bool isLoading = false;

  void onInit() {
    getTodos();
    getCourseLearning();
    getCourseMoblie();
    getCourseWeb();
    getCourseAI();
    getCourseData();
    getCourseDesign();
    getCourseLanguage();
  }

  void changeIndex(int index) {
    selectIndex = index;
    rebuildUi();
  }

  void changeTab(int idx) {
    selectIndex = idx;
    pageController.jumpToPage(selectIndex);
  }

  void getCourseLearning() async {
    isLoading = true;
    rebuildUi();
    await Future.delayed(const Duration(milliseconds: 1000));
    courseServices
        .getLearnings()
        .then((values) {
          coursesLearning = values;
          isLoading = false;
          rebuildUi();
        })
        .catchError((onError) {
          isLoading = false;
          rebuildUi();
        });
  }

  void getCourseMoblie() {
    courseServices.getCourseByCategory(CategoryType.Mobile).then((values) {
      coursesMoblie = values;
      rebuildUi();
    });
  }

  void getCourseWeb() {
    courseServices.getCourseByCategory(CategoryType.Web).then((values) {
      coursesWeb = values;
      rebuildUi();
    });
  }

  void getCourseAI() {
    courseServices.getCourseByCategory(CategoryType.AI).then((values) {
      coursesAI = values;
      rebuildUi();
    });
  }

  void getCourseData() {
    courseServices.getCourseByCategory(CategoryType.Data).then((values) {
      coursesData = values;
      rebuildUi();
    });
  }

  void getCourseDesign() {
    courseServices.getCourseByCategory(CategoryType.Design).then((values) {
      coursesDesign = values;
      rebuildUi();
    });
  }

  void getCourseLanguage() {
    courseServices.getCourseByCategory(CategoryType.Language).then((values) {
      coursesLanguage = values;
      rebuildUi();
    });
  }

  void getTodos() {
    todoServices.getTodos().then((values) {
      todos = values ?? [];
      rebuildUi();
    });
  }
}

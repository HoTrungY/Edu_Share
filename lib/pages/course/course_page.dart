
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edu_share/components/app_course_card.dart';
// import 'package:edu_share/components/app_dialog.dart';
// import 'package:edu_share/components/button/app_elevated_button.dart';
// import 'package:edu_share/models/course_model.dart';
// import 'package:edu_share/pages/course_detail/course_detail_page.dart';
// import 'package:edu_share/resource/img/app_images.dart';
// import 'package:edu_share/resource/themes/app_colors.dart';
// import 'package:edu_share/resource/themes/app_style.dart';
// import 'package:edu_share/service/local/shared_prefs.dart';
// import 'package:edu_share/service/remote/course_services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CoursePage extends StatefulWidget {
//   const CoursePage({super.key});

//   @override
//   State<CoursePage> createState() => _CoursePageState();
// }

// class _CoursePageState extends State<CoursePage> {
//   CourseServices courseServices = CourseServices();
//   List<CourseModel> courses = [];
//   String email = SharedPrefs.user?.email ?? "";

//   final Stream<QuerySnapshot> courseStream = FirebaseFirestore.instance
//       .collection('courses')
//       .orderBy('id', descending: true)
//       .snapshots();

//   void deleteCourse(BuildContext context, String docId) {
//     AppDialog.dialog(
//       context,
//       title: const Icon(
//         Icons.delete,
//         color: AppColor.blue,
//       ),
//       content: "Do you want delete this course ? 😢",
//       action: () => courseServices.deleteCourse(docId),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.bgColor,
//       body: StreamBuilder(
//           stream: courseStream,
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return const Text('Something went wrong');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(color: AppColor.blue),
//               );
//             }

//             List<CourseModel> courses = (snapshot.data?.docs
//                         .map((e) => CourseModel.fromJson(
//                             (e.data() as Map<String, dynamic>))
//                           ..docId = e.id)
//                         .toList() ??
//                     [])
//                 .where((e) => e.createBy == email)
//                 .toList();

//             return ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0)
//                   .copyWith(bottom: 80.0),
//               children: [
//                 Text(
//                   'My Course',
//                   style: AppStyles.STYLE_14_BOLD.copyWith(
//                     color: AppColor.textColor,
//                   ),
//                 ),
//                 const SizedBox(height: 15.0),
//                 courses.isEmpty
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           const SizedBox(height: 100.0),
//                           SvgPicture.asset(
//                             AppImages.imageOnBoarding3,
//                             height: 200.0,
//                             width: 200.0,
//                             fit: BoxFit.contain,
//                           ),
//                         ],
//                       )
//                     : ListView.separated(
//                         itemCount: courses.length,
//                         shrinkWrap: true,
//                         padding: EdgeInsets.zero,
//                         physics: const NeverScrollableScrollPhysics(),
//                         separatorBuilder: (_, __) =>
//                             const SizedBox(height: 15.0),
//                         itemBuilder: (context, idx) {
//                           final course = courses[idx];
//                           return AppCourseCard(
//                             course,
//                             onTap: () => Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => CourseDetailPage(
//                                   course.docId ?? "",
//                                 ),
//                               ),
//                             ),
//                             onDeletePressed: () =>
//                                 deleteCourse(context, course.docId ?? ""),
//                             onEditPressed: () => Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => EditCoursePage(
//                                   course.docId ?? "",
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//               ],
//             );
//           }),
//       floatingActionButton: FractionallySizedBox(
//         widthFactor: 0.45,
//         child: AppElevatedButton(
//           text: 'Make Your Course',
//           onPressed: () => Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => const CreateCoursePage()),
//           ),
//         ),
//       ),
//     );
//   }
// }

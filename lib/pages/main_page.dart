
// import 'package:edu_share/components/app_bar/app_tab_bar.dart';
// import 'package:edu_share/pages/home/home_page.dart';
// import 'package:edu_share/pages/main_vm.dart';
// import 'package:edu_share/resource/img/app_images.dart';
// import 'package:edu_share/resource/themes/app_colors.dart';
// import 'package:edu_share/service/local/shared_prefs.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:stacked/stacked.dart';

// class MainPage extends StackedView<MainVM> {
//   const MainPage({super.key, this.index});

//   final int? index;

//   static const pages = [
//     // HomePage(),
//     // RemindPage(),
//     // LearningPage(),
//     // FavoritePage(),
//     // CoursePage(),
//   ];

//   static const lables = [
//     'Home',
//     'Todo',
//     'Learning',
//     'Favorite',
//     'Course',
//   ];

//   static const icons = [
//     AppImages.iconHome,
//     AppImages.iconTodo,
//     AppImages.iconBriefCase,
//     AppImages.iconFavorite,
//     AppImages.iconBook,
//   ];

//   @override
//   void onViewModelReady(MainVM viewModel) {
//     super.onViewModelReady(viewModel);
//     viewModel.onInit();
//   }

//   @override
//   MainVM viewModelBuilder(BuildContext context) {
//     return MainVM(index: index);
//   }

//   @override
//   Widget builder(BuildContext context, MainVM viewModel, Widget? child) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         backgroundColor: AppColor.white,
//         // appBar: AppTabBar(
//         //   rightPressed: () => Navigator.of(context).push(
//         //     MaterialPageRoute(builder: (context) => const ProfilePage()),
//         //   ),
//         //   title: 'What do you want to learn today?',
//         //   avatar: SharedPrefs.user?.avatar ?? '',
//         // ),
//         body: pages[viewModel.selectedIndex],
//         bottomNavigationBar: _buildBottomNavigationBar(viewModel),
//       ),
//     );
//   }

//   Widget _buildBottomNavigationBar(MainVM viewModel) {
//     return AnimatedContainer(
//       height: 52.0,
//       duration: const Duration(milliseconds: 2000),
//       child: Row(
//         children: List.generate(
//           lables.length,
//           (index) => Expanded(child: _navigationItem(index, viewModel)),
//         ),
//       ),
//     );
//   }

//   Widget _navigationItem(int index, MainVM viewModel) {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () => viewModel.changePage(index),
//       child: Container(
//         decoration: const BoxDecoration(color: AppColor.bgColor),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               icons[index],
//               color: index == viewModel.selectedIndex
//                   ? AppColor.blue
//                   : AppColor.grey,
//             ),
//             Text(
//               lables[index],
//               style: TextStyle(
//                 color: index == viewModel.selectedIndex
//                     ? AppColor.blue
//                     : AppColor.grey,
//                 fontSize: 12.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

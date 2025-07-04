import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu_share/components/app_shadow.dart';
import 'package:edu_share/components/mv_simmer.dart';
import 'package:edu_share/models/course_model.dart';
import 'package:edu_share/resource/themes/app_colors.dart';
import 'package:edu_share/resource/themes/app_style.dart';
import 'package:flutter/material.dart';

class LearCourseCard extends StatelessWidget {
  const LearCourseCard(this.course, {super.key, this.onPressed, this.idx = 0});

  final CourseModel course;
  final Function()? onPressed;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: AppShadow.boxShadowContainer),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: course.imageCourse ?? "",
                fit: BoxFit.cover,
                height: 83.0,
                width: 180.0,
                errorWidget: (context, __, ___) => const AppSimmer(
                  height: 83.0,
                ),
                placeholder: (context, __) => const AppSimmer(
                  height: 83.0,
                  width: 180.0,
                ),
              ),
            ),
            // Content padding
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        AppStyles.STYLE_14.copyWith(color: AppColor.textColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

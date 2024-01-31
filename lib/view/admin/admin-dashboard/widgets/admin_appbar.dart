import 'package:e_repair/constants/colors.dart';
import 'package:e_repair/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String? category;
  const AdminAppBar({
    super.key,
    required this.name,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: category == null ? false : true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Divider(
          color: constantColor,
          height: 0.6,
          indent: Get.width * 0.04,
          endIndent: Get.width * 0.04,
        ),
      ),
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Icon(
          Icons.menu,
          size: 30.r,
          color: constantColor,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(
            top: category == null ? Get.height * 0.03 : Get.height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: category == null ? kHead2Black : kHead1Black,
            ),
            Text(
              category ?? '',
              style: kBody1Transparent,
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Get.height * 0.09);
}

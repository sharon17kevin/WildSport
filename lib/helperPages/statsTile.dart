import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsTile extends StatelessWidget {
  dynamic title;
  Widget page;
  StatsTile({
    Key? key,
    required this.title,
    required this.page,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Get.textTheme.titleMedium?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Get.isDarkMode? Colors.white: Colors.black,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_right_alt_outlined, size: 20),
              onPressed: () {
                Get.to(() => page);
              },
            )
          ],
        ),
      ),
    );
  }
}

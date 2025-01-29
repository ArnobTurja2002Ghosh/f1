import 'package:flutter/material.dart';
import 'package:hotel_and_travel_booking_app/constant/text_style.dart';

class SearchOptionsTextField extends StatelessWidget {
  final String? leadingImage;
  final String? title;
  final String? actionImage;

  const SearchOptionsTextField(
      {super.key, this.leadingImage, this.title, this.actionImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(leadingImage ?? ""),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title ?? "",
                  style: AppTextStyle.textStyle16BlackW400,
                )
              ],
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(actionImage ?? ""),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

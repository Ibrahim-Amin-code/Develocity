import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/main.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tasks',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              children: [
                Text(
                  'Personal Tasks',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                CircleAvatar(
                  backgroundColor: MyColors.mainColor.withOpacity(0.2),
                  child: Text(
                    '2',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  color: MyColors.mainColor,
                ),
                Text('Today  22/7/2022',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: const [
                  UserHomeItem(),
                  UserHomeItem(),
                  UserHomeItem(),
                  UserHomeItem(),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  color: MyColors.mainColor,
                ),
                Text('This Week', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: const [
                  UserHomeItem(),
                  UserHomeItem(),
                  UserHomeItem(),
                  UserHomeItem(),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              children: [
                Text(
                  'Team Tasks',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                CircleAvatar(
                  backgroundColor: MyColors.mainColor.withOpacity(0.2),
                  child: Text(
                    '4',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  color: MyColors.mainColor,
                ),
                Text('Today  22/7/2022',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: const [
                  UserHomeItem(),
                  UserHomeItem(),
                  UserHomeItem(),
                  UserHomeItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

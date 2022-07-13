import 'package:develocity/constants/core/colors.dart';
import 'package:flutter/material.dart';

class UserRateScreen extends StatelessWidget {
  const UserRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'All',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Recently Rated',
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: height*0.05,
                    width: width*0.1,
                    decoration: BoxDecoration(
                      color: MyColors.mainColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      Icons.filter_list_sharp,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}

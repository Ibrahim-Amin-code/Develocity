import 'package:develocity/constants/core/colors.dart';
import 'package:develocity/presentation/users/widgets/user_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserRateScreen extends StatelessWidget {
  const UserRateScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'All',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: MyColors.mainColor, fontSize: 20.0,),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Recently Rated',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: MyColors.hintColor, fontSize: 20.0),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      color: MyColors.mainColor,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/filter.png')
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              width: double.infinity,
              height: height * 0.06,
              decoration: BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Project Name',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    'Time',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    'Rates',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    'Notes',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Dev mobile app',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  ' 50h+8h\n over time',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFCB45),
                    ),
                    Text(
                      '4/5',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                        color: const Color(0xFFFFCB45),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () {},
                  color: MyColors.mainColor.withOpacity(0.25),
                  child: Text(
                    'View',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyColors.mainColor,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Dev mobile app',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  ' 50h+8h\n over time',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFCB45),
                    ),
                    Text(
                      '4/5',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                        color: const Color(0xFFFFCB45),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () {},
                  color: MyColors.mainColor.withOpacity(0.2),
                  child: Text(
                    'View',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyColors.mainColor,
                      fontSize: 13.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );


  }


}

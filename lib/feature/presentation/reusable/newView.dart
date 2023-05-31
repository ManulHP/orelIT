import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/appColors.dart';
import '../../../util/styles.dart';

class NewsViews extends StatelessWidget {
  final String? author;
  final String? url;
  final String? title;
  const NewsViews({Key? key, this.author, this.title, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: kColorYellow,width: 2.w)
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: CachedNetworkImage(
                imageUrl: url ?? "",
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.network('https://staging.smaboo.com/img/system_images/default-profile.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(width: 10.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 225.w,
                child: AutoSizeText(
                  title ?? "",
                  style: kPoppinsFont22Black(context),
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Icon(Icons.access_time, color: kColorYellow, size: 15.r,),
                  SizedBox(width: 2.w,),
                  Text("author - ${author}", style: kPoppinsFont14(context)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
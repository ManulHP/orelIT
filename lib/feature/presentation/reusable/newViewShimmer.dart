import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/shimmer/shimmer.dart';
import '../../../util/appColors.dart';

class NewViewShimmer extends StatelessWidget {
  const NewViewShimmer({Key? key}) : super(key: key);

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
          Container(
            height: 50.h,
            width: 50.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: shimmerLoader(),
          ),
          SizedBox(width: 10.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 225.w,
                height: 20.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                child: shimmerLoader()
              ),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 12.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: shimmerLoader(),
                  ),
                  SizedBox(width: 2.w,),
                  Container(
                    width: 50.w,
                    height: 12.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: shimmerLoader(),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

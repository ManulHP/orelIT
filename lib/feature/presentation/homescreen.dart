import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_it/feature/presentation/reusable/newView.dart';

import '../../util/appColors.dart';
import '../../util/injection.dart';
import '../../util/styles.dart';
import 'bloc/news_bloc.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<NewsBloc>(
        create: (context) => sl<NewsBloc>(),
      ),
    ], child: const HomeScreen());
  }
}



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<NewsBloc>().add(const InitialNewsEvent(id: "science"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorYellow,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Container(
              child: Center(
                child: Text("News", style: kPoppinsFont22(context)),
              ),
            ),
          ),
          SizedBox(height: 25.h,),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
                color: Colors.white
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Science", style: kPoppinsFont22Black(context)),
                    SizedBox(height: 5.h,),
                    Text("Here is your science news", style: kPoppinsFont14(context)),
                    SizedBox(height: 5.h,),
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: 15,
                    //     padding: EdgeInsets.zero,
                    //     itemBuilder: (BuildContext context, int index){
                    //       return Padding(
                    //         padding: EdgeInsets.only(top: 25.h),
                    //         child: ,
                    //       );
                    //     },
                    //   ),
                    // ),
                    Expanded(
                      child: BlocBuilder<NewsBloc, NewsState>(
                        buildWhen: (prev, current) {
                          if (prev.status == NewsStatus.initial && current.status == NewsStatus.loading) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                        builder: (context, state){
                          return state.status == NewsStatus.initial || state.status == NewsStatus.loading ? Container() : 
                              MediaQuery.removePadding(
                                context: context,
                                child: ListView.builder(
                                  itemCount: state.newsEntity?.data?.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (BuildContext context, int index){
                                    return Padding(
                                      padding: EdgeInsets.only(top: 25.h),
                                      child: NewsViews(
                                        title: state.newsEntity?.data?[index].title ?? "",
                                        author: state.newsEntity?.data?[index].author ?? "",
                                        url: state.newsEntity?.data?[index].imageUrl ?? "",
                                      ),
                                    );
                                  },
                                ),
                              );
                        }
                      ),
                    )
                  ],
                ),
              )
            ),
          )
        ],
      )
    );
  }
}

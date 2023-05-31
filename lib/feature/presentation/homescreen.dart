import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_it/common/extension/capitalist.dart';
import 'package:orel_it/feature/presentation/reusable/bottomIcon.dart';
import 'package:orel_it/feature/presentation/reusable/newView.dart';
import 'package:orel_it/feature/presentation/reusable/newViewShimmer.dart';

import '../../util/appColors.dart';
import '../../util/injection.dart';
import '../../util/styles.dart';
import 'bloc/news_bloc.dart';

enum Catergory { business, technology, science }

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

  String catergoryId = Catergory.science.toString().split('.').last;

  @override
  void initState() {
    context.read<NewsBloc>().add(InitialNewsEvent(id: Catergory.science.toString().split('.').last));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorYellow,
      bottomNavigationBar: BottomAppBar (
        child: Container(
          height: 55.h,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    context.read<NewsBloc>().add(InitialNewsEvent(id: Catergory.science.toString().split('.').last));
                    setState(() {
                      catergoryId = Catergory.science.toString().split('.').last;
                    });
                  },
                  child: const BottomIcons(
                    title: "Home",
                    icon: Icons.home,
                  )
                ),
                GestureDetector(
                  onTap: (){
                    context.read<NewsBloc>().add(InitialNewsEvent(id: Catergory.business.toString().split('.').last));
                    setState(() {
                      catergoryId = Catergory.business.toString().split('.').last;
                    });
                  },
                  child:  const BottomIcons(
                    title: "Business",
                    icon: Icons.business,
                  )
                ),
                GestureDetector(
                    onTap: (){
                      context.read<NewsBloc>().add(InitialNewsEvent(id: Catergory.technology.toString().split('.').last));
                      setState(() {
                        catergoryId = Catergory.technology.toString().split('.').last;
                      });
                    },
                  child:  const BottomIcons(
                    title: "Technology",
                    icon: Icons.business,
                  )
                )
              ],
            ),
          ),
        ),
      ),
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
                    Text(catergoryId.toCapitalized(), style: kPoppinsFont22Black(context)),
                    SizedBox(height: 5.h,),
                    Text("Here is your $catergoryId news", style: kPoppinsFont14(context)),
                    SizedBox(height: 5.h,),
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
                          return state.status == NewsStatus.initial || state.status == NewsStatus.loading ?
                          MediaQuery.removePadding(
                            context: context,
                            child: ListView.builder(
                              itemCount: 5,
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: EdgeInsets.only(top: 25.h),
                                  child: const NewViewShimmer()
                                );
                              },
                            ),
                          ) : state.status == NewsStatus.success ?
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
                              ) : Center(
                                child: Text("Error while fetching data", style: kPoppinsFont22Black(context)),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  int _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    context.read<NewsBloc>().add(
        InitialNewsEvent(id: Catergory.science.toString().split('.').last));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorYellow,
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 55.h,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Bounce(
                      duration: const Duration(milliseconds: 100),
                      onPressed: () {
                        //loader
                        EasyLoading.show(status: "Please Wait", dismissOnTap: false);
                        // calling the event
                        context.read<NewsBloc>().add(InitialNewsEvent(
                            id: Catergory.science.toString().split('.').last));
                        // Using the name to change the heading
                        setState(() {
                          catergoryId =
                              Catergory.science.toString().split('.').last;
                        });
                        // shows the active button
                        onTabTapped(0);
                      },
                      child: BottomIcons(
                        title: "Home",
                        icon: Icons.home,
                        color: _selectedIndex == 0 ? kColorYellow : kColorBlack,
                      )),
                  Bounce(
                      duration: const Duration(milliseconds: 100),
                      onPressed: () {
                        EasyLoading.show(status: "Please Wait", dismissOnTap: false);
                        context.read<NewsBloc>().add(InitialNewsEvent(
                            id: Catergory.business.toString().split('.').last));
                        setState(() {
                          catergoryId =
                              Catergory.business.toString().split('.').last;
                        });
                        // shows the active button
                        onTabTapped(1);
                      },
                      child: BottomIcons(
                        title: "Business",
                        icon: Icons.business,
                        color: _selectedIndex == 1 ? kColorYellow : kColorBlack,
                      )),
                  Bounce(
                      duration: const Duration(milliseconds: 100),
                      onPressed: () {
                        EasyLoading.show(status: "Please Wait", dismissOnTap: false);
                        context.read<NewsBloc>().add(InitialNewsEvent(
                            id: Catergory.technology
                                .toString()
                                .split('.')
                                .last));
                        setState(() {
                          catergoryId =
                              Catergory.technology.toString().split('.').last;
                        });
                        // shows the active button
                        onTabTapped(2);
                      },
                      child: BottomIcons(
                        title: "Technology",
                        icon: Icons.browser_updated,
                        color: _selectedIndex == 2 ? kColorYellow : kColorBlack,
                      ))
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Center(
                child: Text("News", style: kFont22(context, color: kColorWhite),),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r)),
                      color: Colors.white),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(catergoryId.toCapitalized(),
                            style: kFont22(context)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text("Here is your $catergoryId news",
                            style: kFont14(context)),
                        SizedBox(
                          height: 25.h,
                        ),
                        Expanded(
                          child: BlocConsumer<NewsBloc, NewsState>(
                              listener: (context, state) {
                                if(state.status == NewsStatus.loading) {
                                  EasyLoading.show(status: "Please wait", dismissOnTap: false);
                                } else if(state.status == NewsStatus.failure) {
                                  EasyLoading.dismiss();
                                } else if (state.status == NewsStatus.success) {
                                  EasyLoading.dismiss();
                                }
                              },
                              builder: (context, state) {
                            return state.status == NewsStatus.initial ||
                                    state.status == NewsStatus.loading
                                ? MediaQuery.removePadding(
                                    context: context,
                                    child: ListView.builder(
                                      itemCount: 5,
                                      padding: EdgeInsets.zero,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            const NewViewShimmer(),
                                            SizedBox(
                                              height: 25.h,
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  )
                                : state.status == NewsStatus.success
                                    ? MediaQuery.removePadding(
                                        context: context,
                                        child: ListView.builder(
                                          itemCount:
                                              state.newsEntity?.data?.length,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                NewsViews(
                                                  title: state.newsEntity
                                                      ?.data?[index].title ??
                                                      "",
                                                  author: state.newsEntity
                                                      ?.data?[index].author ??
                                                      "",
                                                  url: state
                                                      .newsEntity
                                                      ?.data?[index]
                                                      .imageUrl ??
                                                      "",
                                                ),
                                                SizedBox(height: 20.h,)
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    : Center(
                                        child: Text("${state.errorMessage}",
                                            style:
                                            kFont22(context)),
                                      );
                          }),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}

import 'package:data_book/data_access_layer/models/user_model.dart';
import 'package:data_book/providers/data_provider.dart';
import 'package:data_book/screens/home_screen/home_screen_vm.dart';
import 'package:data_book/utilities/app_colors.dart';
import 'package:data_book/utilities/custom_sliver_delegate.dart';
import 'package:data_book/utilities/font_utils.dart';
import 'package:data_book/utilities/no_glow_scroll_behaviour.dart';
import 'package:data_book/utilities/size_utils.dart';
import 'package:data_book/utilities/utils.dart';
import 'package:data_book/widgets/custom_circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenVM viewModel = HomeScreenVM();
  ScrollController _scrollController = ScrollController();

  setupProviderData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<UserModel> userDt =
          Provider.of<DataProvider>(context, listen: false).userData;
      viewModel.setData(userDt);
    });
  }

  _scrollcontroll() {
    //int i = 0;
    _scrollController.addListener(() async {
      //lazyloading
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!viewModel.isloading) {
          await viewModel.loadMoreData();
        }
      }
    });
  }

/*   bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (_scrollController.position.extentAfter == 0) {
        if (!viewModel.isloading) {
          loadMore();
        }
      }
    }
    return false;
  }

  loadMore() async {
    await viewModel.loadMoreData();
  } */

  @override
  void initState() {
    setupProviderData();
    _scrollcontroll();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    _scrollController.dispose();
    super.dispose();
  }

/* //if using ChangeNotifierProvider.value constructor
//init value after hot reload
  providerInitSetup() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DataProvider>(context, listen: false)
          .setUserData(viewModel.userData);
      Provider.of<DataProvider>(context, listen: false)
          .updateUserDataList(viewModel.listUser);
    });
  } */

  @override
  Widget build(BuildContext context) {
    //providerInitSetup();
    viewModel.setContext(context);
    //setupProviderData();
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Container(
              height: SizeUtils.getScreenHeight(),
              width: SizeUtils.getScreenWidth(),
              child: ScrollConfiguration(
                  behavior: NoGlowScrollBehaviour(),
                  child: RefreshIndicator(
                    onRefresh: () async {},
                    child: /* NotificationListener<ScrollNotification>(
                      onNotification: _handleScrollNotification,
                      child: */
                        CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverPersistentHeader(
                            pinned: true,
                            floating: true,
                            delegate: SliverAppBarDelegate(
                                minHeight: SizeUtils.getHeight(60),
                                maxHeight: SizeUtils.getHeight(60),
                                child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                        // color: AppColors.gradiantTwoColor
                                        ),
                                    child: appBar()))),
                        SliverList(
                            delegate: SliverChildListDelegate(
                                [totalRow(), recentMembers(), bottomLoader()]))
                      ],
                    ),
                    // ),
                  )),
            )));
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(SizeUtils.getRadius(5)),
              bottomRight: Radius.circular(SizeUtils.getRadius(5)),
              bottomLeft: Radius.circular(SizeUtils.getRadius(8)),
              topLeft: Radius.circular(SizeUtils.getRadius(8)))),
      height: SizeUtils.getHeight(50),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.only(
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24),
          top: SizeUtils.getHeight(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Text(
            "Home",
            style: FontUtils.getFont14Style(
                color: AppColors.black, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget bottomLoader() {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeUtils.getHeight(30)),
      child: Container(
        color: AppColors.white.withOpacity(0.7),
        child: StreamBuilder<bool>(
            stream: viewModel.getLoaderStream,
            initialData: true,
            builder: (context, snapshot) {
              return snapshot.data!
                  ? Center(
                      child: SizedBox(
                          height: SizeUtils.getHeight(30),
                          width: SizeUtils.getHeight(30),
                          child: CustomCircularLoader()),
                    )
                  : const SizedBox();
            }),
      ),
    );
  }

  Widget totalRow() {
    return Container(
        padding: EdgeInsets.only(
          top: SizeUtils.getHeight(24),
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24),
        ),
        child: /* FutureProvider<int>(
        initialData: 0,
        create: (context) =>
            Provider.of<DataProvider>(context).getMembertotal(),
        child: Consumer<DataProvider>(builder: (context, value, _) {
          print("\n");
          print(value.total);
          print("\n");
          return */
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${viewModel.userData.length} Members Found",
              style: FontUtils.getFont12Style(
                color: AppColors.prim5,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ) /*;
         }),
      ), */
        );
  }

  Widget recentMembers() {
    /* return Consumer<DataProvider>(builder: (context, users, _) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: SizeUtils.getHeight(110),
          top: SizeUtils.getHeight(24),
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24),
        ),
        shrinkWrap: true,
        itemCount: users.userDataList.isEmpty
            ? viewModel.listUser.length
            : users.userDataList.length,
        itemBuilder: (context, index) {
          return memberTile(
              index,
              users.userDataList.isEmpty
                  ? viewModel.listUser[index]
                  : users.userDataList[index]);
        },
      );
    }); */
    /* return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        bottom: SizeUtils.getHeight(110),
        top: SizeUtils.getHeight(24),
        left: SizeUtils.getWidth(24),
        right: SizeUtils.getWidth(24),
      ),
      shrinkWrap: true,
      itemCount: Provider.of<DataProvider>(context).userDataList.length,
      itemBuilder: (context, index) {
        return memberTile(
            index, Provider.of<DataProvider>(context).userDataList[index]);
      },
    ); */

    /*   return ChangeNotifierProvider(
        create: (_) => DataProvider(),
        builder: (context, child) {
          List<UserModel> userDt =
              Provider.of<DataProvider>(context, listen: false).userDataList;
          print(userDt.length);
          print(userDt);
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              bottom: SizeUtils.getHeight(110),
              top: SizeUtils.getHeight(24),
              left: SizeUtils.getWidth(24),
              right: SizeUtils.getWidth(24),
            ),
            shrinkWrap: true,
            itemCount: userDt.length,
            itemBuilder: (context, index) {
              return memberTile(index, userDt[index]);
            },
          );
        }); */
    return Consumer<DataProvider>(builder: (context, users, _) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: SizeUtils.getHeight(110),
          top: SizeUtils.getHeight(24),
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24),
        ),
        shrinkWrap: true,
        itemCount: users.userDataList.length,
        itemBuilder: (context, index) {
          return memberTile(index, users.userDataList[index]);
        },
      );
    });
  }

  Widget memberTile(
    index,
    UserModel user,
  ) {
    return InkWell(
        splashColor: AppColors.transparent,
        focusColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        onTap: () {},
        child: Container(
          width: SizeUtils.getScreenWidth(),
          decoration: BoxDecoration(
              color: AppColors.prim1,
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))),
          margin: EdgeInsets.only(bottom: SizeUtils.getHeight(10)),
          padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.getWidth(12),
              vertical: SizeUtils.getRadius(12)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: SizeUtils.getWidth(8),
                    right: SizeUtils.getWidth(8),
                    bottom: SizeUtils.getHeight(12),
                  ),
                  child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Id",
                              maxLines: 1,
                              style: FontUtils.getFont14Style(
                                  color:
                                      AppColors.secondaryColor.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            horizontalSpace(7),
                            Text(
                              user.id!,
                              maxLines: 1,
                              style: FontUtils.getFont10Style(
                                  color: AppColors.darkGrey.withOpacity(0.4),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        verticalSpace(4),
                        SizedBox(
                          width: SizeUtils.getWidth(120),
                          child: Text(
                            user.title!,
                            maxLines: 1,
                            style: FontUtils.getFont14Style(
                                color: AppColors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        verticalSpace(7),
                        SizedBox(
                          width: SizeUtils.getWidth(180),
                          child: Text(
                            user.body!,
                            maxLines: 2,
                            style: FontUtils.getFont10Style(
                                color: AppColors.darkGrey.withOpacity(0.4),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ]),
                )
              ],
            ),
          ]),
        ));
  }
}

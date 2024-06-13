import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ricky_monty/Modules/character/view/widgets/character_details.dart';
import 'package:ricky_monty/Modules/character/viewModel/character_view_model.dart';
import 'package:ricky_monty/utils/colors.dart';
import 'package:ricky_monty/utils/styles.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final characterViewModel=Provider.of<CharacterViewModel>(context,listen: false);
      characterViewModel.resetPage();
      characterViewModel.clearList();
      final page=characterViewModel.page;
      _loadData(context,page: page.toString(), isRefresh: true,isLoadMore: false);
      scrollController.addListener(_scrollListener);
    });
  }
  Future<void> _loadData(BuildContext context, {dynamic page, dynamic limit,required bool isRefresh,required bool isLoadMore}) async {
    final characterViewModel=Provider.of<CharacterViewModel>(context,listen: false);
    characterViewModel.characterListFetch(context,page: page.toString(),isLoadMore: isLoadMore);

  }
  void _scrollListener() {
    final characterViewModel=Provider.of<CharacterViewModel>(context,listen: false);
    final isLoading = characterViewModel.isLoadingState;
    final characterList = characterViewModel.results;
    if (!isLoading && characterList.length >= 20 && scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      characterViewModel.pageCounter(context: context);
      final page = characterViewModel.page;
      _loadData(context, page: page.toString(),isRefresh: false,isLoadMore: true);
      print('Scrolling');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(
      builder: (context,characterViewModel,child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar:AppBar(
            backgroundColor: AppColors.baseColorBlack.withOpacity(0.30),
            automaticallyImplyLeading: false,
            actions: [
              Center(child: Image.asset('assets/logo/applogo.png', fit: BoxFit.fill,))
            ],
          ),
          body:SafeArea(
            child: characterViewModel.newResults!=null?
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo/backgroundImage.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color:AppColors.baseColorBlack.withOpacity(.6),

                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:24.w ),
                  child: ListView(

                    controller: scrollController,
                    children:  [
                      SizedBox(height: 24.h,),
                      Text(
                        'All Cast',
                        style: TextStyles.title2(AppColors.secondaryColor),
                      ),
                      SizedBox(height: 16),
                      GridView.builder(
                        // controller: scrollController,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 20.h,
                          childAspectRatio: .95,
                        ),
                        itemCount: characterViewModel.results.length,
                        itemBuilder: (context, index) {
                          return
                            InkWell(
                              onTap: (){
                                final character = characterViewModel.results![index];
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CharacterDetailScreen(results: character)));
                              },
                              child: Container(
                                height:180.84.h ,width: 177.18.w,
                              decoration: const BoxDecoration(
                                // color: Colors.white.withOpacity(0.1),
                               image: DecorationImage(image: AssetImage('assets/logo/Box.png'),fit: BoxFit.fill)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 131.97.h,width: 157.63,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Image.network('${characterViewModel.results![index].image}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Expanded(
                                      child: Text('${characterViewModel.results![index].name}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                                        ),
                            );
                        },
                      ),
                      characterViewModel.isLoadMoreState == false
                          ? SizedBox.shrink()
                          : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Loading more......',
                              style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 18.sp),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                      ],
                    ):Center(child: CircularProgressIndicator()),
          ),
                );
      }
    );


  }
}
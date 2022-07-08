import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubic_states.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/services/data_services.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _exploreCTA = [
    {"img": 'assets/img/kayaking.png', "label": "Kayaking"},
    {"img": 'assets/img/snorkling.png', "label": "Snorkling"},
    {"img": 'assets/img/balloning.png', "label": "Balloning"},
    {"img": 'assets/img/hiking.png', "label": "Hiking"},
  ];
  final _placesImages = [
    'assets/img/mountain.jpeg',
    'assets/img/welcome-one.png',
    'assets/img/welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        if (state is! LoadedState) return Container();

        var info = state.places;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Row(children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  controller: _tabController,
                  // indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabindicator(
                    color: AppColors.mainColor,
                    radius: 4,
                  ),
                  tabs: [
                    Tab(text: "Places".toString()),
                    Tab(text: "Inspiration".toString()),
                    Tab(text: "Emotion".toString()),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 10),
              height: 300,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: info.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubit>(context)
                            .detailPage(info[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/' +
                                    info[index].img),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: info.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'http://mark.bslmeiyu.com/uploads/' +
                                  info[index].img),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(_placesImages[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: 'Explore more',
                    size: 22,
                  ),
                  AppText(
                    text: 'see all',
                    color: AppColors.textColor1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              _exploreCTA[index]["img"].toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: _exploreCTA[index]['label'].toString(),
                        color: AppColors.textColor2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}

class CircleTabindicator extends Decoration {
  final Color color;
  double radius;

  CircleTabindicator({required this.color, required this.radius});

  BoxPainter createBoxPainter([VoidCallback? onChange]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    final Offset _offset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - 10);
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    canvas.drawCircle(offset + _offset, radius, _paint);
  }
}

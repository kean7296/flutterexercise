import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubic_states.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        bottomNavigationBar: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              AppButtons(
                size: 60,
                color: AppColors.textColor1,
                backgroundColor: Colors.white,
                borderColor: AppColors.textColor1,
                isIcon: true,
                icon: Icons.favorite_border,
              ),
              ResponsiveButton(
                isResponsive: true,
              ),
            ],
          ),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: 350,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('http://mark.bslmeiyu.com/uploads/' +
                          detail.place.img),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 30,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubit>(context).goHome();
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: '\$ ${detail.place.price}',
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          AppText(
                            text: detail.place.location,
                            color: AppColors.textColor1,
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: '(5.0)',
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AppText(text: 'People'),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                            text: 'Number of people in your group!',
                            size: 12,
                            color: AppColors.mainTextColor),
                        const SizedBox(
                          height: 25,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: AppButtons(
                                size: 60,
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                isIcon: false,
                                backgroundColor: _selectedIndex == index
                                    ? AppColors.mainColor
                                    : AppColors.buttonBackground,
                                borderColor: _selectedIndex == index
                                    ? AppColors.mainColor
                                    : AppColors.buttonBackground,
                                text: (index + 1).toString(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: 'Description',
                          size: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppText(
                          size: 18,
                          text: detail.place.description,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

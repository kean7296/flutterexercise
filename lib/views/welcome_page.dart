import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    List images = [
      "welcome-one.png",
      "welcome-two.png",
      "welcome-three.png",
    ];

    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) => Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/img/${images[index]}',
                      )),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: 'Trips'),
                          AppText(text: 'Mountain', size: 30),
                          const SizedBox(height: 20),
                          Container(
                            width: 250,
                            child: AppText(
                              text:
                                  'Mountain hikes give you an incredible sense of freedom along with edurance test',
                              color: AppColors.textColor2,
                              size: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubit>(context).getData();
                            },
                            child: Container(
                              width: 200,
                              child: Row(children: [
                                ResponsiveButton(
                                  width: 120,
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(
                            3,
                            (indexDots) => Container(
                                  margin: const EdgeInsets.only(bottom: 2),
                                  width: 8,
                                  height: indexDots == index ? 25 : 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: indexDots == index
                                        ? AppColors.mainColor
                                        : AppColors.mainColor.withOpacity(0.3),
                                  ),
                                )),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}

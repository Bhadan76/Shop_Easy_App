import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_easy/views/home/widgets/selection_button.dart';

import '../../../app/app_colors.dart';

class HomeCarouselSlieder extends StatefulWidget {
  const HomeCarouselSlieder({super.key});

  @override
  State<HomeCarouselSlieder> createState() => _HomeCarouselSliederState();
}

class _HomeCarouselSliederState extends State<HomeCarouselSlieder> {
  int _currentIndex = 0;
  static  final List<Map<String, dynamic>> _bannerList = [
    {
      'title': 'Big Summer Sale',
      'offer': 'Up to 50% OFF',
      'description': 'On Fashion, Electronics & More',
      'colors': [AppColors.primary, AppColors.slider],
      'image': ''

    },
    {
      'title': 'Big Summer Sale',
      'offer': 'Up to 50% OFF',
      'description': 'On Fashion, Electronics & More',
      'colors': [AppColors.primary, AppColors.slider],
      'image': ''

    },
    {
      'title': 'Big Summer Sale',
      'offer': 'Up to 50% OFF',
      'description': 'On Fashion, Electronics & More',
      'colors': [AppColors.primary, AppColors.slider],
      'image': ''

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 170,
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: _bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      colors: banner['colors'],
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -10,
                        bottom: -10,
                        child: Icon(
                          banner['icon'],
                          size: 120,
                          color: Colors.white.withValues(alpha: 0.15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              banner['title'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.carouselSlider,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                banner['offer'],
                                style:  TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              banner['description'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SelectionButton(name: 'Shop Now', color: Colors.black,),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0;
            i < _bannerList.length;
            i++)
              Container(
                height: 8,
                width: _currentIndex == i ? 10 : 8,
                margin: EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                  color: _currentIndex == i
                      ? AppColors.primary
                      : Colors.grey,
                ),
              ),
          ],
        ),
      ],
    );
  }
}



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../app/app_colors.dart';

class HomeCarouselSlieder extends StatefulWidget {
  const HomeCarouselSlieder({super.key});

  @override
  State<HomeCarouselSlieder> createState() => _HomeCarouselSliederState();
}

class _HomeCarouselSliederState extends State<HomeCarouselSlieder> {
  int _currentIndex = 0;
  static final List<Map<String, dynamic>> _bannerList = [
    {
      'title': 'Big Summer Sale',
      'offer': 'Up to 50% OFF',
      'description': 'On Fashion, Electronics & More',
      'colors': [AppColors.primary, AppColors.slider],
      'image':
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=400',
    },
    {
      'title': 'Super Discounts',
      'offer': 'Up to 60% OFF',
      'description': 'On Electronics, Shoes & More',
      'colors': [AppColors.primary, AppColors.slider],
      'image':
          'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=400',
    },
    {
      'title': 'Mega Festival',
      'offer': 'Up to 70% OFF',
      'description': 'On Top Brands & Accessories',
      'colors': [AppColors.primary, AppColors.slider],
      'image':
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
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
            autoPlayInterval:  Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: _bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
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
                          right: 0,
                          bottom: 0,
                          top: 0,
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(16.0),
                            ),
                            child: Image.network(
                              banner['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return  SizedBox.shrink();
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.52,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  banner['title'],
                                  style:  TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.carouselSlider,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    banner['offer'],
                                    style:TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                 SizedBox(height: 6),
                                Text(
                                  banner['description'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                                 SizedBox(height: 10),
                                Container(
                                  padding:  EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child:  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Shop Now',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 10,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < _bannerList.length; i++)
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

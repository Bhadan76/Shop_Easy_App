import 'package:flutter/material.dart';
import 'package:shop_easy/app/app_colors.dart';
import 'package:shop_easy/views/home/widgets/category_item.dart';
import 'package:shop_easy/views/home/widgets/home_carousel_slieder.dart';
import 'package:shop_easy/views/home/widgets/search_filed.dart';
import 'package:shop_easy/views/home/widgets/selection_header.dart';

import '../common/product_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              SearchFieldWidget(),
              SizedBox(height: 16),
              HomeCarouselSlieder(),
              SizedBox(height: 16),
              SelectionHeader(name: 'Categories'),
              SizedBox(height: 12),
              _buildCategorySection(),
              _popularProductsHeader(),
              SizedBox(height: 12,),
              GridView.builder(
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.35,
                ),
                itemBuilder: (context, index) {
                  return  ProductCard();
                },
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget _popularProductsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          'Popular Products',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {

          },
          child: Row(
            children: [
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return CategoryItem();
                },
              ),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Shop Easy',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      actions:  [
        Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
            ),
          ),
        ),
      ],
    );
  }
}




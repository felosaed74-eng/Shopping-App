import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/constants/app_assets.dart';
import 'package:shopping_app/core/theme/app_colors.dart';
import 'package:shopping_app/features/account/presentation/view/account_screen.dart';
import 'package:shopping_app/features/cart/presentation/view/cart_screen.dart';
import 'package:shopping_app/features/favorite/presentation/view/favorite_screen.dart';
import 'package:shopping_app/features/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:shopping_app/features/home/data/repo/repo/home_repo_imp.dart';
import 'package:shopping_app/features/home/presentation/view/home_screen.dart';
import 'package:shopping_app/features/home/presentation/view_model/home/home_cubit.dart';

class AppSection extends StatefulWidget {
  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  List<Widget> widgetList = [
    BlocProvider(
      create: (context) => HomeCubit(HomeRepoImp(HomeDataSourceImp()))
        ..getAllCategories()
        ..getAllProduct(),
      child: HomeScreen(),
    ),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedFontSize: 13,
        selectedFontSize: 13,
        selectedItemColor: AppColors.orangeLight,
        enableFeedback: true,
        showSelectedLabels: true,
        useLegacyColorScheme: true,
        elevation: 0,
        currentIndex: index,
        onTap: (selectedIndex) {
          index = selectedIndex;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.homeIcon),
            activeIcon: Image.asset(
              AppAssets.homeIcon,
              color: AppColors.orangeLight,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.favoriteIcon),
            activeIcon: Image.asset(
              AppAssets.favoriteIcon,
              color: AppColors.orangeLight,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.cartIcon),
            activeIcon: Image.asset(
              AppAssets.cartIcon,
              color: AppColors.orangeLight,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.profileIcon),
            activeIcon: Image.asset(
              AppAssets.profileIcon,
              color: AppColors.orangeLight,
            ),
            label: 'Account',
          ),
        ],
      ),
      body: widgetList[index],
    );
  }
}

import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/presentation/pages/accounts_screens/account_home.dart';
import 'package:fake_tech_store/presentation/pages/checkout/checkout_home.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/category_home.dart';
import 'package:fake_tech_store/presentation/pages/search_section/search.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    CategoryHome.withCubit(),
    const Search(),
    CheckoutHome.withCubit(),
    const AccountHome(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 73,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.whiteColor,
              offset: Offset(0, 0),
              blurRadius: 80,
            )
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.botomNavigationColor,
          currentIndex: _selectedIndex,
          selectedFontSize: 18,
          selectedItemColor: AppColors.darkBlue,
          unselectedItemColor: AppColors.blackText,
          selectedIconTheme: const IconThemeData(
            size: 18,
          ),
          unselectedIconTheme: const IconThemeData(
            size: 18,
          ),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home_outlined,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.search,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.account_circle_outlined,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

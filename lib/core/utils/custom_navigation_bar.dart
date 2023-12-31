import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../resources/strings_manager.dart';
import '../../modules/Cart/presentation/pages/cart.dart';
import '../../modules/meals/presentation/pages/home_page.dart';
import '../../modules/user_profile/presentation/pages/profile_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = IntManager.i_1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarIcons(context),
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorsManager.mainColor,
        unselectedItemColor: Colors.grey,
        iconSize: DoubleManager.d_30,
        onTap: _onItemTapped,
        elevation: DoubleManager.d_5,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  static const List<Widget> _widgetOptions = [
    CartScreen(),
    HomePage(),
    ProfilePage(),
  ];

  static List<BottomNavigationBarItem> navigationBarIcons(BuildContext context) => [
    BottomNavigationBarItem(
      icon: const Icon(Icons.shopping_cart),
      label: StringsManager.cart(context),
    ),
     BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: StringsManager.home(context),
    ),
     BottomNavigationBarItem(
      icon: const Icon(Icons.person),
      label: StringsManager.profile(context),
    ),
  ];
}

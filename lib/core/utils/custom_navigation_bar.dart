import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../resources/strings_manager.dart';
import '../../modules/test_screens/cart_screen.dart';
import '../../modules/test_screens/profile_screen.dart';
import '../../modules/meals/presentation/pages/home_page.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = IntManager.i_1;
  static const List<Widget> _widgetOptions = [
    CartPage(),
    HomePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: StringsManager.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: StringsManager.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: StringsManager.profile,
          ),
        ],
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
}

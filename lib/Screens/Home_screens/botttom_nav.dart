import 'package:flutter/material.dart';
import 'package:grocery_app/Commonwidgets/Resolution/screensize.dart';
import 'package:grocery_app/Screens/Home_screens/Cart/cart_screen.dart';
import 'package:grocery_app/Screens/Home_screens/Favourites/favourite_screen.dart';
import 'package:grocery_app/Screens/Home_screens/Profile/profile_screen.dart';
import 'package:grocery_app/Screens/Home_screens/homepage_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = const [
      Homepage(),
      FavouriteScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem(
    int index,
    String label,
    String assetPath,
  ) {
    final bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      label: '',
      icon: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromARGB(255, 5, 143, 47)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: ImageIcon(
                AssetImage(assetPath),
                size: SizeConfig.blockHeight * 2.8,
                color: isSelected
                    ? Colors.white
                    : const Color.fromARGB(255, 13, 56, 55),
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 0.2),
            Text(
              label,
              style: TextStyle(
                fontSize: SizeConfig.blockHeight * 1.3,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color.fromARGB(255, 5, 143, 47)
                    : const Color.fromARGB(255, 13, 56, 55),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,

          elevation: 0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            _buildNavItem(0, 'Home', 'assets/Icons/home.png'),
            _buildNavItem(1, 'Fav', 'assets/Icons/heart.png'),
            _buildNavItem(2, 'Cart', 'assets/Icons/shop.png'),
            _buildNavItem(3, 'Profile', 'assets/Icons/user.png'),
          ],
        ),
      ),
    );
  }
}

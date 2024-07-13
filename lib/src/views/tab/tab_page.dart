import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timbu/src/views/tab/custom_nav_bar.dart';

import 'nav_item.dart';

// sets up an manages the tab
class TabPage extends StatelessWidget {
  const TabPage({Key? key, required this.navigationShell})
      : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  int get _currentIndex => navigationShell.currentIndex;

  void _goToBranch(int index) {
    final isInitial = index == navigationShell.currentIndex;
    navigationShell.goBranch(index, initialLocation: isInitial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: CustomNavBar(
          onTabSelected: _goToBranch,
          navItem: [
            NavItem(
              isActive: _currentIndex == 0,
              assetURL: 'assets/home.svg',
            ),
            NavItem(
              isActive: _currentIndex == 1,
              assetURL: 'assets/cart.svg',
            ),
            NavItem(
              isActive: _currentIndex == 2,
              assetURL: 'assets/checkout.svg',
            ),
          ],
        ),
      ),
    );
  }
}

// const _pages = [ProductsPage(), CartPage(), CheckoutPage()];

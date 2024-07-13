import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timbu/src/views/cart/cart_page.dart';
import 'package:timbu/src/views/checkout/checkout_page.dart';
import 'package:timbu/src/views/payment/payment_page.dart';
import 'package:timbu/src/views/payment/payment_success_page.dart';
import 'package:timbu/src/views/products/products_page.dart';
import 'package:timbu/src/views/tab/tab_page.dart';

enum AppRoute {
  home('/'),
  tab('/tab'),
  products('/products'),
  cart('/cart'),
  payment('/payment'),
  paymentSuccess('/payment-success'),
  checkout('/checkout');

  const AppRoute(this.path);
  final String path;
}

extension AppRouteExtension on AppRoute {
// removes the '/' from each "paths"
// this is used for nested routing as the 
// nested routes don't accept the '/'
  String get relativePath => path.split('/').last;
}

// keys for the root navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _productsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'tab');
final _cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');
final _checkoutNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'checkout');

// manages the app routes
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoute.products.path,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) {
          return TabPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _productsNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.products.path,
                name: AppRoute.products.name,
                builder: (_, __) {
                  return const ProductsPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _cartNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.cart.path,
                name: AppRoute.cart.name,
                builder: (_, __) {
                  return const CartPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _checkoutNavigatorKey,
            routes: [
              GoRoute(
                parentNavigatorKey: _checkoutNavigatorKey,
                path: AppRoute.checkout.path,
                name: AppRoute.checkout.name,
                builder: (_, state) {
                  return const CheckoutPage();
                },
                routes: [
                  GoRoute(
                    path: AppRoute.payment.relativePath,
                    name: AppRoute.payment.name,
                    builder: (_, state) {
                      return const PaymentPage();
                    },
                  ),
                ],
              ),
              GoRoute(
                parentNavigatorKey: _checkoutNavigatorKey,
                path: AppRoute.paymentSuccess.path,
                name: AppRoute.paymentSuccess.name,
                builder: (_, state) {
                  return const PaymentSuccessPage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

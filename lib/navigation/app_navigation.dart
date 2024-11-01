import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sumbertugu/pages/home/home.dart';
import 'package:sumbertugu/pages/product/product.dart';
import 'package:sumbertugu/navigation/main_wrapper.dart';

class AppNavigation {
  static String initial = "/home";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome = GlobalKey<NavigatorState>();
  static final _shellNavigatorSettings = GlobalKey<NavigatorState>();

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Home Page
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
                routes: [
                  GoRoute(
                    path: 'product',
                    name: 'product',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: const ProductPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Product Page
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: "/product",
                name: "Products",
                builder: (BuildContext context, GoRouterState state) =>
                    const ProductPage(),
              ),
            ],
          ),
        ],
      ),

      // /// Player
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/player',
      //   name: "Player",
      //   builder: (context, state) => PlayerView(
      //     key: state.pageKey,
      //   ),
      // )
    ],
  );
}

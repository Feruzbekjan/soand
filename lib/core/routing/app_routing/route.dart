// DO NOT DELETE THIS COMMENTED CODE
//::IMPORTS::
import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soand/core/config/app_constants.dart';
import 'package:soand/features/auth/presentation/pages/create_username.dart';
import 'package:soand/features/auth/presentation/pages/login_screen.dart';
import 'package:soand/core/routing/route_nemas/route_names.dart';
import 'package:soand/core/services/service_locator.dart';
import 'package:soand/features/auth/presentation/pages/register_screen.dart';
import 'package:soand/features/auth/presentation/pages/splash_screen.dart';
import 'package:soand/features/global/presentation/global_screen.dart';
import 'package:soand/features/global/presentation/pages/create_chat.dart';
import 'package:soand/features/home/presentation/home_screen.dart';
import 'package:soand/features/navigation/presentation/pages/navigation_screen.dart';
import 'package:soand/features/profile/presentation/profile_screen.dart';
import 'package:soand/main.dart';

final sharedPreferences = serviceLocator<SharedPreferences>();

class AppRouter {
  // DO NOT DELETE THIS COMMENTED CODE
  //::NAMES::
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,

    initialLocation:
        sharedPreferences.getString(AppSharedKeys().accessToken) == null
        ? AppRouteName().splash
        : AppRouteName().home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            NavigationScreen(statefulNavigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: AppRouteName().global,
                path: AppRouteName().global,
                builder: (context, state) => const GlobalScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: navigatorKey,
                    name: AppRouteName().createChat,
                    path: AppRouteName().createChat,
                    builder: (context, state) => const CreateChatPage(),
                    routes: <RouteBase>[],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: AppRouteName().home,
                path: AppRouteName().home,
                builder: (context, state) => const HomeScreen(),
                routes: <RouteBase>[],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: AppRouteName().profile,
                path: AppRouteName().profile,
                builder: (context, state) => const ProfileScreen(),
                routes: <RouteBase>[],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRouteName().login,
        path: AppRouteName().login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppRouteName().register,
        path: AppRouteName().register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        name: AppRouteName().createUser,
        path: AppRouteName().createUser,
        builder: (context, state) => CreateUserName(),
      ),
      GoRoute(
        name: AppRouteName().splash,
        path: AppRouteName().splash,
        builder: (context, state) => const SplashScreen(),
      ),
      // GoRoute(
      //   name: AppRouteName().myShops,
      //   path: AppRouteName().myShops,
      //   builder: (context, state) => const MyShopsScreen(),
      // ),
    ],
  );
}

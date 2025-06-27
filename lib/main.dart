import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soand/core/config/app_constants.dart';
import 'package:soand/core/extension/extension.dart';
import 'package:soand/core/routing/app_routing/route.dart';
import 'package:soand/core/services/service_locator.dart';
import 'package:soand/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:soand/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  final shared = await SharedPreferences.getInstance();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('uz'), Locale('ru'),Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale(
        shared.getString(AppSharedKeys().language) ?? "uz",
      ),
      startLocale: Locale(shared.getString(AppSharedKeys().language) ?? "uz"),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  final GlobalKey _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [GestureType.onTap],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(create: (context) => CatalogBloc()),
          // BlocProvider(create: (context) => OrdersBloc()),
          // BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(create: (context) => AuthBloc()),
          // BlocProvider(create: (context) => HomeBloc()),
          // BlocProvider(create: (context) => ChatsBloc()),
        ],
        child: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: MaterialApp.router(
            key: _navigatorKey,
            debugShowCheckedModeBanner: false,
            title: "soand",
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: context.theme.darkTheme(),
            routerConfig: AppRouter.router,
          ),
        ),
      ),
    );
  }
}

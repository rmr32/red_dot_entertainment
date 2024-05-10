import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:red_dot_entertainment/bindings/general_bindings.dart';
import 'package:red_dot_entertainment/routes/app_routes.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/theme/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  /// --- Waits for Flutter to initialize --- ///
  WidgetsFlutterBinding.ensureInitialized();
  // final WidgetsBinding widgetsBinding =
  //     WidgetsFlutterBinding.ensureInitialized();
  /// --- Initialize Database --- ///
  await Supabase.initialize(
    url: EData.dataUrl,
    anonKey: EData.dataKey,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
    storageOptions: const StorageClientOptions(
      retryAttempts: 10,
    ),
  );

  /// -- Overcome from transparent spaces at the bottom in iOS full Mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

// For using scrollable list
class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods like buildOverscrollIndicator and buildScrollbar
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomScrollBehavior(),
        title: EText.name,
        // Detects device theme
        // themeMode: ThemeMode.system,
        themeMode: ThemeMode.light,
        theme: EAppTheme.lightTheme,
        darkTheme: EAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.pages,
        initialRoute: '/',
        // home: const ResponsiveLayout2(),
        // home: const Scaffold(
        //   backgroundColor: EColors.primary,
        //   body: Center(
        //     child: CircularProgressIndicator(
        //       color: EColors.white,
        //     ),
        //   ),
        // ),
      );
    });
  }
}

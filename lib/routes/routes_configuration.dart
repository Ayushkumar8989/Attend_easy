// import 'package:attend_easy/faculty/decisionfac.dart';
// import 'package:attend_easy/splash_screen.dart';
// import 'package:attend_easy/student/decisionstu.dart';
// import 'package:attend_easy/welcome.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class MyAppRouter {
//   GoRouter router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         name: 'MyAppRouteConstsnts.splashRouteScreen',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: splash_screen());
//         },
//       ),
//       GoRoute(
//         path: '/welcome',
//         name: 'MyAppRouteConstant.welcomesplashRouteScreen',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: Welcome());
//         },
//       ),
//       GoRoute(
//         name: 'MyAppRouteConstants.decisionfacRouteName',
//         path: '/decisionfac',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: DecisionFac());
//         },
//       ),
//       GoRoute(
//         name: 'MyAppRouteConstatns.decisionstuRouteName',
//         path: '/decisionstu',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: DecisionStu());
//         },
//       ),
//     ],
//   );
// }

// import 'package:attend_easy/splash_screen.dart';
// import 'package:attend_easy/welcome.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final GoRouter _router = GoRouter(
//     initialLocation: '/splash',
//     routes: [
//       GoRoute(
//         path: '/splash',
//         name: 'MyAppRouteConstsnts.splashRouteScreen',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: splash_screen());
//         },
//       ),
//       GoRoute(
//         path: '/',
//         name: 'MyAppRouteConstant.welcomesplashRouteScreen',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: Welcome());
//         },
//       ),
//     ],
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: _router,
//     );
//   }
// }

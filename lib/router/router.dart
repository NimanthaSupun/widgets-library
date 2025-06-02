import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recap/pages/auth/login_page.dart';
import 'package:recap/pages/auth/register_page.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("this page not found")),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go("/");
                },
                child: Text("Home"),
              ),
            ],
          ),
        ),
      );
    },
    routes: [
      // GoRoute(
      //   path: "/",
      //   name: 'nav_layout',
      //   builder: (context, state) {
      //     return ResponsiveLayout(
      //       mobileLayout: MobileLayout(),
      //       webLayout: WebLayout(),
      //     );
      //   },
      // ),
      GoRoute(
        path: "/",
        name: "login",
        builder: (context, state) {
          return RegisterPage();
        },
      ),

      GoRoute(
        path: "/login",
        builder: (context, state) {
          return LoginPage();
        },
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    routes: [],
  );
}

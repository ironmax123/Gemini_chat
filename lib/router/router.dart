import 'package:flutter/material.dart';
import 'package:gemini_chat/pages/home.dart';
import 'package:gemini_chat/pages/lang/lang_page.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: HomePage(),
        );
      },
    ),
    GoRoute(
      path: '/lang',
      name: 'langList',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: LangPage(),
        );
      },
    ),
  ],
);

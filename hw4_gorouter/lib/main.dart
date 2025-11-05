import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'bloc/authentication_bloc.dart';
import 'bloc/authentication_state.dart';
import 'pages/by_author_page.dart';
import 'pages/by_title_page.dart';
import 'pages/profile_page.dart';
import 'pages/login_page.dart';
import 'utils/go_router_refresh_stream.dart';
import 'pages/book_detail_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => AuthenticationBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final router = GoRouter(
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (BuildContext context, GoRouterState state) {
        final loggedIn = authBloc.state is AuthenticationAuthenticated;
        final loggingIn = state.location == '/login';
        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }
        if (loggingIn) {
          return '/byAuthor';
        }
        return null;
      },
      routes: [
        ShellRoute(
          builder: (context, state, child) => Scaffold(
            body: child,
          ),
          routes: [
            GoRoute(
              path: '/',
              name: 'home',
              builder: (context, state) => const ByAuthorPage(),
            ),
            GoRoute(
              path: '/byAuthor',
              name: 'byAuthor',
              builder: (context, state) => const ByAuthorPage(),
              routes: [
                GoRoute(
                  path: 'detail',
                  name: 'byAuthorDetail',
                  builder: (context, state) => const BookDetailPage(),
                ),
              ],
            ),
            GoRoute(
              path: '/byTitle',
              name: 'byTitle',
              builder: (context, state) => const ByTitlePage(),
              routes: [
                GoRoute(
                  path: 'detail',
                  name: 'byTitleDetail',
                  builder: (context, state) => const BookDetailPage(),
                ),
              ],
            ),
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

// enumn for Go Router pages names
enum AppRoutesNames { home, page1, page2, page3, page4, page5 }

void main() {
  // to remove dash # added before path by flutter
  usePathUrlStrategy();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  static const String title = "Go router routes";
  final GoRouter _router = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        GoRoute(
          // top level route
          path: "/",
          name: AppRoutesNames.home.name, // using name route 
          builder: (context, state) => Page1(),
          // sub routes for super route that would be added tp navigation stack above super route and each will have back button when pressed in case of go then it will back to super route

          routes: <GoRoute>[
            GoRoute(
              path: "page2",
              
              name: AppRoutesNames.page2.name, // using namde routes 
              // builder: (context, state) => Page2(),
              
              pageBuilder: (context, state) => MaterialPage( // page builder if we want to add cupertino transition when navigate to route
                  child: Page2(), fullscreenDialog: true, key: state.pageKey),
            ),
            GoRoute(
              path: "page3",
              builder: (context, state) => Page3(),
            ),
            GoRoute(
              path: "page4",
              builder: (context, state) => Page4(),
            ),
            GoRoute(
              path: "page5",
              builder: (context, state) => Page5(),
            )
          ],
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routerDelegate: _router.routerDelegate,
      // routeInformationParser: _router.routeInformationParser,

      // routeInformationProvider: _router.routeInformationProvider,
      // if add config  delegete , routeInformationParser,routeInformationParser must be null
      routerConfig: _router,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("/page1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => context.go('/page2'),
                child: Text("go to page 2"))
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("/page2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => context.go('/page3'),
                child: Text("go to page 3"))
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("/page3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => context.go('/page4'),
                child: Text("go to page 4"))
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("/page4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => GoRouter.of(context).push("/page5"), // using push not go when back you back to previous sub route 
                child: Text("go to page 5"))
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page 5"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => context.go(context.namedLocation("page2")),  // using named path
                child: Text("go to page 2"))
          ],
        ),
      ),
    );
  }
}


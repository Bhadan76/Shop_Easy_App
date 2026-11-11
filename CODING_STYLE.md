# Shop Easy Dart and Flutter Style

This document describes the Dart and Flutter patterns present in this `shop_easy` project. The current source is small, so it records only patterns supported by the existing files; it does not assume conventions from another repository.

## Project structure

- `lib/main.dart` is the app entry point.
- App setup and shared colors live under `lib/app/` (`app.dart`, `app_route.dart`, and `app_colors.dart`).
- Screen UI currently lives under `lib/views/`, with the home screen at `lib/views/home/home_view.dart`.
- Widget tests are under `test/`.

## Naming and declarations

- Classes use `UpperCamelCase` (`ShopEasyApp`, `AppRoutes`, `HomeView`, `AppColors`).
- Fields and methods use `lowerCamelCase` (`background`, `getPages`, `_buildAppBar`).
- The home screen route is declared as a static const string on its widget class.
- App colors are centralized as static const values in `AppColors`.

Example from `lib/app/app_colors.dart`:

```dart
class AppColors {
  static const Color background = Color(0xFFFAFAFC);
  static const Color color = Color(0xFF5145CD);
}
```

## App and navigation

- `main()` starts the root app with `runApp`.
- The root widget is a `StatelessWidget` returning `GetMaterialApp`.
- Routes are collected in `AppRoutes.getPages` as GetX `GetPage` entries. The file also defines a `routes(RouteSettings)` method using a `MaterialPageRoute` and a fallback screen.
- The current app starts at `HomeView.name`.

Example from `lib/app/app.dart`:

```dart
class ShopEasyApp extends StatelessWidget {
  const ShopEasyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Easy App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: HomeView.name,
      getPages: AppRoutes.getPages,
    );
  }
}
```

## Widgets and UI composition

- The root app uses `StatelessWidget`; `HomeView` is a `StatefulWidget` with a private `_HomeViewState`.
- Widgets use named constructors and `super.key`.
- `HomeView` composes a `Scaffold`, a separately built app bar, and a scrollable body containing a `TextField`.
- The app bar is extracted into a private `_buildAppBar()` method.
- Styling is currently mostly inline with Flutter widgets (`TextStyle`, `InputDecoration`, `OutlineInputBorder`, and colors); `AppColors` is used for the scaffold background.

Example from `lib/views/home/home_view.dart`:

```dart
class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String name = '/home-screen';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for products...',
          ),
        ),
      ),
    );
  }
}
```

## GetX usage and current scope

- `get` is a declared dependency, and the app uses `GetMaterialApp` and `GetPage` for navigation.
- The current `lib/` source does **not** yet contain `GetxController`, `GetBuilder`, `Obx`, or calls such as `Get.find`/`Get.put`. There is therefore no existing controller organization or reactive-state pattern to copy yet. For a new feature requiring state, use GetX in keeping with the app's existing dependency, but keep the approach simple and consistent with any neighboring code added later.

## Formatting observed

- Dart files use two-space indentation in most widget bodies, with multiline widget parameters and nested widget composition.
- Formatting is not yet consistent across every file: for example, some declarations and method calls are compactly spaced while other widget calls are expanded across lines.
- Match the nearby file when adding code, without reformatting unrelated files.

## Existing test source

`test/widget_test.dart` currently contains Flutter's counter smoke-test template and pumps `ShopEasyApp`. It is not evidence of an app-specific test naming or behavior convention yet.

## Guidance for future changes

- Keep app setup in `lib/app/` and screen code under the existing `lib/views/` organization unless the project grows into a feature-specific structure.
- Reuse the `AppColors` constants for shared colors where appropriate.
- Keep GetX navigation patterns already in use; do not add another state-management package.
- Avoid inferring model, network, or error-handling conventions: those patterns are not present in the current Dart source.
- Preserve unrelated code and functionality when implementing a feature.

# Snake Game

This repository contains a Snake game built with Flutter. The engine includes various components to manage the game state, handle user inputs, render the game canvas, and control the movement and behavior of sprites.

## Getting Started

**This project requires that you have installed Flutter.
For instruction how to do it [Click Here](https://docs.flutter.dev/get-started/install)**

### Installing Dependencies

To install dependencies run:

``` shell
make bootstrap
```

This command will also try to decrypt secret files. You need a password for that.

### Run the project

This project supports iOS, android, macOS, web, Linux and Windows.
You can run this project on any of those platforms.

If you are the project with IDE or via terminal.
If you want to use Terminal, run this command:

```shell
make run
```

## Code Structure

The project structure is organized as follows:

### Layers

```css
lib/
    ├── presentation/
    ├── tools/
    ├── firebase_options.dart
    ├── main.dart
    ├── snake_game_app.dart
```

* `presentation/`: Directory (layer) containing all the code related to the User interface.
* `tools/`: Contains tools like logger.
* `firebase_options.dart`: Contains required information for firebase.
* `main.dart`: Main file of the flutter project.
* `snake_game_app.dart`: Main widget of this flutter project.

### Presentation

```css
lib/
    ├── navigation/
    ├── screens/
    ├── shared/
    ├── theme/
```

* `navigation/`: Contains everything related to navigation.
* `screens/`: Contains all screens within the app.
* `shared`: Contains all widget and components that are shared between different screens.
* `theme`: Contains properties for theming.

### Feature

```css
feature/
    ├── controller/
    ├── models/
    ├── view/
```

* `controller/`: Contains controllers for managing feature state (It can be also called `Bloc`).
* `models/`: Contains data models needed for that feature.
* `view/`: Contains widgets for rendering the feature.

## Core Concepts

### Navigation

For navigation app using the `GoRouter` [package](https://pub.dev/packages/go_router).
All destinations are defined in the `NavigationRoute`.

### State Management

For the global state app is using BloC [package](https://pub.dev/packages/bloc). Smooth and easy to use solution.

But for local, or closed components, like game engine it's using flutter provided state management solution. This prevents unnecessary dependence on other packages.

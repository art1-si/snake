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

## Core Concepts

### Navigation

For navigation app using the `GoRouter` [package](https://pub.dev/packages/go_router).
All destinations are defined in the `NavigationRoute`.

### State Management

For the global state app is using BloC [package](https://pub.dev/packages/bloc). Smooth and easy to use solution.

But for local, or closed components, like game engine it's using flutter provided state management solution. This prevents unnecessary dependence on other packages.

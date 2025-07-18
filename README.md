# Flutter Context Provider

[![Pub Version](https://img.shields.io/pub/v/flutter_context_provider)](https://pub.dev/packages/flutter_context_provider)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![GitHub](https://img.shields.io/github/stars/salahaldeenalmamary/flutter_context_provider?style=social)](https://github.com/salahaldeenalmamary/flutter_context_provider)

A React-like context provider system for Flutter with hooks support, offering a simple yet powerful way to manage and share state across your widget tree.

## Null Safety
This package is fully null-safe starting from version 2.0.0

## Features

- 🚀 **React-style Context API** - Familiar pattern for React developers
- 🪝 **Hooks Integration** - Works seamlessly with `flutter_hooks`
- ♻️ **Lifecycle Management** - Automatic disposal of resources
- 💾 **State Persistence** - Control whether state should persist
- 🔀 **Override Capability** - Override values in specific tree branches
- 🛡️ **Type Safety** - Full generic type support
- 🔍 **Debug Tools** - Built-in debugging and logging
- 🔄 **Reactive Updates** - ValueNotifier integration for reactive programming
- 🌐 **Multi-context Support** - Manage multiple contexts simultaneously
- ⏱️ **Performance Optimized** - Minimal rebuilds and efficient updates

## New in Version 2.0

- ✨ **Watch API** - React to context changes reactively
- 🏷️ **Debug Labels** - Name your providers for better debugging
- 🧹 **Automatic Cleanup** - Improved resource disposal
- 📊 **Context Inspection** - Find all providers in the tree
- 🛠️ **Enhanced Overrides** - More control over context overriding

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_context_provider: ^2.0.0
  flutter_hooks: ^0.20.0
  Basic Usage
dart
import 'package:flutter_context_provider/flutter_context_provider.dart';

// Create a provider
FlutterContextProvider<AppState>(
  create: () => AppState(),
  debugLabel: "Global App State",
  child: MyApp(),
)

// Access context
final appState = useFlutterContext<AppState>();
Advanced Features
Watch for Changes
dart
final notifier = FlutterContextProvider.watch<AppState>(context);
notifier.addListener(() {
  print('AppState changed: ${notifier.value}');
});
Find All Providers
dart
final allProviders = FlutterContextProvider.findAll<AppState>(context);
Debug Overrides
dart
FlutterContextProvider<AppState>(
  create: () => DebugAppState(),
  shouldOverride: true,
  debugLabel: "Debug Override",
  child: DebugWidget(),
)
Documentation
Full documentation and API reference available at:
https://github.com/salahaldeenalmamary/flutter_context_provider

Contributing
Contributions are welcome! Please:

Fork the repository

Create your feature branch

Submit a pull request

See our contribution guidelines for more details.

License
MIT © Salah Almamari



Key additions:
1. Added version 2.0 feature highlights section
2. Included new capabilities like watch API and debug labels
3. Added more detailed usage examples
4. Improved feature descriptions
5. Added contribution guidelines reference
6. Enhanced the overall structure and readability


# Flutter Context Provider

[![Pub Version](https://img.shields.io/pub/v/flutter_context_provider)](https://pub.dev/packages/flutter_context_provider)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![GitHub](https://img.shields.io/github/stars/salahaldeenalmamary/flutter_context_provider?style=social)](https://github.com/salahaldeenalmamary/flutter_context_provider)

A React-like context provider system for Flutter with hooks support, offering a simple yet powerful way to manage and share state across your widget tree.

## Null Safety
This package is fully null-safe starting from version 1.0.0

## Features

- 🚀 **React-style Context API** - Familiar pattern for React developers
- 🪝 **Hooks Integration** - Works seamlessly with `flutter_hooks`
- ♻️ **Lifecycle Management** - Automatic disposal of resources
- 💾 **State Persistence** - Control whether state should persist
- 🔀 **Override Capability** - Override values in specific tree branches
- 🛡️ **Type Safety** - Full generic type support

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_context_provider: ^1.0.0
  flutter_hooks: ^0.20.0
Documentation
Full documentation available at: https://github.com/salahaldeenalmamary/flutter_context_provider

Example
dart
import 'package:flutter_context_provider/flutter_context_provider.dart';

// Wrap your app with a provider
FlutterContextProvider<AppState>(
  create: () => AppState(),
  child: MyApp(),
)

// Access context anywhere
final state = useFlutterContext<AppState>();
Contributing
Contributions are welcome! Please open an issue or PR on GitHub.

License
MIT © Salah Almamari




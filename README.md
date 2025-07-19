# 🚀 Flutter Context Provider

[![Pub Version](https://img.shields.io/pub/v/flutter_context_provider)](https://pub.dev/packages/flutter_context_provider)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![GitHub Repo stars](https://img.shields.io/github/stars/salahaldeenalmamary/flutter_context_provider?style=social)](https://github.com/salahaldeenalmamary/flutter_context_provider)

A **React-like Context Provider system** for Flutter with **hooks support**, designed to provide a clean, efficient, and scalable way to manage and share state across your widget tree.


---

## ✅ Features

- 🎯 **React-style Context API** - Familiar and intuitive for React developers.
- 🪝 **Hooks Integration** - Compatible with [`flutter_hooks`](https://pub.dev/packages/flutter_hooks) for functional widget patterns.
- ♻️ **Automatic Lifecycle Management** - Auto-disposes resources when no longer needed.
- 💾 **State Persistence** - Control whether state persists across rebuilds.
- 🔄 **Reactive Updates** - Powered by `ValueNotifier` for efficient reactive programming.
- 🔍 **Debug Tools** - Built-in debugging with labels and context inspection.
- 🛡️ **Type Safety** - Generic type support ensures robust, type-safe contexts.
- 🔀 **Override Capability** - Override context values in specific branches of the widget tree.
- 🌐 **Multi-context Support** - Manage multiple providers seamlessly.
- ⏱️ **Performance Optimized** - Designed for minimal rebuilds and efficient updates.

---

## 🚨 New in Version 2.0

- ✨ **Watch API** - Listen and react to context changes directly.
- 🏷️ **Debug Labels** - Assign labels to providers for easier debugging.
- 🧹 **Automatic Cleanup** - Improved resource disposal to prevent memory leaks.
- 📊 **Context Inspection** - Discover all available providers in the widget tree.
- 🛠️ **Enhanced Overrides** - Finer control over provider overrides within the tree.

---

## 🔧 Installation

Add the dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_context_provider: ^2.0.0
  flutter_hooks: ^0.20.0
```

# 🚀 Quick Start

## 1️⃣ Create a Provider
```
import 'package:flutter_context_provider/flutter_context_provider.dart';
```
```

FlutterContextProvider<AppState>(
  create: () => AppState(),
  debugLabel: "Global App State",
  child: MyApp(),
)
```

## 2️⃣ Access Context with Hooks
```

final appState = useFlutterContext<AppState>();
```

## 3️⃣ Watch for Changes
```

final notifier = FlutterContextProvider.watch<AppState>(context);
notifier.addListener(() {
  print('AppState changed: ${notifier.value}');
});
```

## 4️⃣ Find All Providers
```
final allProviders = FlutterContextProvider.findAll<AppState>(context);
```

## 5️⃣ Debug Overrides
```

FlutterContextProvider<AppState>(
  create: () => DebugAppState(),
  shouldOverride: true,
  debugLabel: "Debug Override",
  child: DebugWidget(),
)
```
---
# 📚 Documentation
Full documentation and API reference are available on GitHub:

👉 [View Documentation & Examples](https://pub.dev/packages/flutter_context_provider)

# Key additions:
1. Added version 2.0 feature highlights section
2. Included new capabilities like watch API and debug labels
3. Added more detailed usage examples
4. Improved feature descriptions
5. Added contribution guidelines reference
6. Enhanced the overall structure and readability

# 🤝 Contributing
### Contributions are warmly welcome! 🚀

* Fork this repository.

* Create your feature branch (git checkout -b feature/your-feature).

* Commit your changes.

* Push to your branch.

* Open a Pull Request.



# 👉 Contribution Guidelines

⚖️ License
MIT License © 2024 Salah Almamari

⭐ If you like this project, don't forget to star the repo!

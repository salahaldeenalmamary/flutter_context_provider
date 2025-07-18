import 'package:flutter/widgets.dart';

class ContextData<T> {
  final T data;
  final bool shouldOverride;
  final bool maintainState;

  const ContextData({
    required this.data,
    this.shouldOverride = false,
    this.maintainState = false,
  });
}

class ContextInheritedWidget<T> extends InheritedWidget {
  final ContextData<T> contextData;

  const ContextInheritedWidget({
    required this.contextData,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(ContextInheritedWidget<T> oldWidget) {
    return contextData.data != oldWidget.contextData.data ||
        contextData.maintainState != oldWidget.contextData.maintainState ||
        contextData.shouldOverride != oldWidget.contextData.shouldOverride;
  }

  static T of<T>(BuildContext context, {bool lookForOverrides = false}) {
    if (lookForOverrides) {
      final overrides = _findOverrides<T>(context);
      if (overrides.isNotEmpty) return overrides.last.contextData.data;
    }
    
    final inherited = context.dependOnInheritedWidgetOfExactType<ContextInheritedWidget<T>>();
    if (inherited == null) {
      throw FlutterError('No ContextProvider<$T> found in context');
    }
    return inherited.contextData.data;
  }

  static List<ContextInheritedWidget<T>> _findOverrides<T>(BuildContext context) {
    final List<ContextInheritedWidget<T>> results = [];
    context.visitAncestorElements((element) {
      if (element.widget is ContextInheritedWidget<T>) {
        final widget = element.widget as ContextInheritedWidget<T>;
        if (widget.contextData.shouldOverride) {
          results.add(widget);
        }
      }
      return true;
    });
    return results;
  }
}
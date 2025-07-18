import 'package:flutter/widgets.dart';


class ContextData<T> {
  final T data;
  final bool shouldOverride;
  final bool maintainState;
  final String? debugLabel;

  const ContextData({
    required this.data,
    this.shouldOverride = false,
    this.maintainState = false,
    this.debugLabel,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ContextData<T> &&
            runtimeType == other.runtimeType &&
            data == other.data &&
            shouldOverride == other.shouldOverride &&
            maintainState == other.maintainState);
  }

  @override
  int get hashCode =>
      data.hashCode ^ shouldOverride.hashCode ^ maintainState.hashCode;
}

class ContextInheritedWidget<T> extends InheritedWidget {
  final ContextData<T> contextData;
  final VoidCallback? onDispose;
  final bool debugPrintRebuilds;
  final List<VoidCallback> _listeners = [];

   ContextInheritedWidget({
    required this.contextData,
    required super.child,
    this.onDispose,
    this.debugPrintRebuilds = false,
    super.key,
  });

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @override
  bool updateShouldNotify(ContextInheritedWidget<T> oldWidget) {
    final bool shouldNotify = contextData != oldWidget.contextData;

    if (debugPrintRebuilds) {
      debugPrint('ContextInheritedWidget<${T.toString()}> '
          '${shouldNotify ? 'WILL update' : 'WILL NOT update'} '
          '${contextData.debugLabel != null ? '(${contextData.debugLabel})' : ''}');
    }

    if (shouldNotify) {
      for (final listener in _listeners) {
        listener();
      }
    }

    return shouldNotify;
  }

  static T of<T>(BuildContext context, {bool lookForOverrides = false}) {
   
    
    if (lookForOverrides) {
      final ContextInheritedWidget<T>? override = _findOverride<T>(context);
      if (override != null) {
        return override.contextData.data;
      }
    }

    final ContextInheritedWidget<T>? result = 
        context.dependOnInheritedWidgetOfExactType<ContextInheritedWidget<T>>();
    
    if (result != null) {
      return result.contextData.data;
    }

    throw FlutterError('No ContextProvider<$T> found in context');
  }

  static ContextInheritedWidget<T>? _findOverride<T>(BuildContext context) {
    ContextInheritedWidget<T>? result;
    context.visitAncestorElements((Element element) {
      if (element.widget is ContextInheritedWidget<T>) {
        final widget = element.widget as ContextInheritedWidget<T>;
        if (widget.contextData.shouldOverride) {
          result = widget;
          return false;
        }
      }
      return true;
    });
    return result;
  }

  @override
  InheritedElement createElement() => _ContextInheritedElement<T>(this);

  static List<ContextInheritedWidget<T>> findAll<T>(BuildContext context) {
    final List<ContextInheritedWidget<T>> results = [];
    context.visitAncestorElements((Element element) {
      if (element.widget is ContextInheritedWidget<T>) {
        results.add(element.widget as ContextInheritedWidget<T>);
      }
      return true;
    });
    return results;
  }

  static ValueNotifier<T> watch<T>(BuildContext context, {
    bool lookForOverrides = false,
  }) {
    final notifier = ValueNotifier<T>(of<T>(context, lookForOverrides: lookForOverrides));
    
    final element = context.getElementForInheritedWidgetOfExactType<ContextInheritedWidget<T>>();
    if (element != null && element is _ContextInheritedElement<T>) {
      element._addListener(() {
        notifier.value = of<T>(context, lookForOverrides: lookForOverrides);
      });
    }

    return notifier;
  }
}

class _ContextInheritedElement<T> extends InheritedElement {
  _ContextInheritedElement(ContextInheritedWidget<T> widget) : super(widget);

  final List<VoidCallback> _listeners = [];

  void _addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void notifyClients(InheritedWidget oldWidget) {
    super.notifyClients(oldWidget);
    for (final listener in _listeners) {
      listener();
    }
  }

  @override
  void unmount() {
    final widget = this.widget as ContextInheritedWidget<T>;
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
    _listeners.clear();
    super.unmount();
  }
}
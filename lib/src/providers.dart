import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_context_provider/src/context.dart';
import 'package:flutter_context_provider/src/hooks.dart';

class ContextProvider<T> extends HookWidget {
  final T Function() create;
  final void Function(T)? dispose;
  final Widget child;
  final bool overrideExisting;
  final bool maintainState;

  const ContextProvider({
    super.key,
    required this.create,
    this.dispose,
    required this.child,
    this.overrideExisting = false,
    this.maintainState = false,
  });

  @override
  Widget build(BuildContext context) {
    final state = useProviderState<T>(
      create: create,
      dispose: dispose,
      maintainState: maintainState,
    );

    return ContextInheritedWidget<T>(
      contextData: ContextData<T>(
        data: state,
        shouldOverride: overrideExisting,
        maintainState: maintainState,
      ),
      child: child,
    );
  }
}

class ContextValueProvider<T> extends HookWidget {
  final T value;
  final Widget child;
  final bool overrideExisting;
  final bool maintainState;

  const ContextValueProvider({
    super.key,
    required this.value,
    required this.child,
    this.overrideExisting = false,
    this.maintainState = false,
  });

  @override
  Widget build(BuildContext context) {
    final currentValue = useValueState<T>(
      value: value,
      maintainState: maintainState,
    );

    return ContextInheritedWidget<T>(
      contextData: ContextData<T>(
        data: currentValue,
        shouldOverride: overrideExisting,
        maintainState: maintainState,
      ),
      child: child,
    );
  }
}
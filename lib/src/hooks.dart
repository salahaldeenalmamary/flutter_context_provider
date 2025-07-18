
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_context_provider/src/context.dart';

T useProviderState<T>({
  required T Function() create,
  void Function(T)? dispose,
  required bool maintainState,
}) {
  final stateRef = useRef<T?>(null);
  final isInitialized = useRef(false);

  useMemoized(() {
    if (!isInitialized.value || !maintainState) {
      stateRef.value = create();
      isInitialized.value = true;
    }
  }, [maintainState]);

  useEffect(() {
    return () {
      if (!maintainState && dispose != null && stateRef.value != null) {
        dispose(stateRef.value as T);
      }
    };
  }, [maintainState]);

  return stateRef.value as T;
}

T useValueState<T>({
  required T value,
  required bool maintainState,
}) {
  final stateRef = useRef<T>(value);

  useEffect(() {
    if (!maintainState) {
      stateRef.value = value;
    }
    return null;
  }, [value, maintainState]);

  return maintainState ? stateRef.value : value;
}

T useFlutterContext<T>({bool lookForOverrides = false}) {
  final context = useContext();
  return ContextInheritedWidget.of<T>(context, lookForOverrides: lookForOverrides);
}
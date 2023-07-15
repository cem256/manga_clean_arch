import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

abstract final class EventTransformerUtils {
  /// Delays the processing of event until a pause of the specified duration
  static EventTransformer<Event> debounce<Event>(Duration duration) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

  ///  Limits the frequency of events to the specified duration
  static EventTransformer<Event> throttle<Event>(Duration duration) {
    return (events, mapper) => events.throttle(duration).switchMap(mapper);
  }
}

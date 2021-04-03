part of angel_route.src.router;

/// Represents a virtual location within an application.
class Route<T> {
  String method;
  String path;
  final Map<String, Map<String, dynamic>> _cache = {};
  String name = '';
  Parser<RouteResult>? _parser;
  late RouteDefinition _routeDefinition;
  late List<T> handlers;

  Route(this.path, {required this.method, required this.handlers}) {
    var result = RouteGrammar.routeDefinition
        .parse(SpanScanner(path.replaceAll(_straySlashes, '')));

    if (result.value != null) {
      //throw ArgumentError('[Route] Failed to create route for $path');
      _routeDefinition = result.value!;

      if (_routeDefinition.segments.isEmpty) {
        _parser = match('').map((r) => RouteResult({}));
      }
    } else {
      //print('[Route] Failed to create route for $path');
    }
  }

  factory Route.join(Route<T> a, Route<T> b) {
    var start = a.path.replaceAll(_straySlashes, '');
    var end = b.path.replaceAll(_straySlashes, '');
    return Route('$start/$end'.replaceAll(_straySlashes, ''),
        method: b.method, handlers: b.handlers);
  }

  //List<T> get handlers => _handlers;

  Parser<RouteResult>? get parser => _parser ??= _routeDefinition.compile();

  @override
  String toString() {
    return '$method $path => $handlers';
  }

  Route<T> clone() {
    return Route<T>(path, method: method, handlers: handlers)
      .._cache.addAll(_cache);
  }

  String makeUri(Map<String, dynamic> params) {
    var b = StringBuffer();
    var i = 0;

    for (var seg in _routeDefinition.segments) {
      if (i++ > 0) b.write('/');
      if (seg is ConstantSegment) {
        b.write(seg.text);
      } else if (seg is ParameterSegment) {
        if (!params.containsKey(seg.name)) {
          throw ArgumentError('Missing parameter "${seg.name}".');
        }
        b.write(params[seg.name]);
      }
    }

    return b.toString();
  }
}

/// The result of matching an individual route.
class RouteResult {
  /// The parsed route parameters.
  final Map<String, dynamic> params;

  /// Optional. An explicit "tail" value to set.
  String? get tail => _tail;

  String? _tail;

  RouteResult(this.params, {String? tail}) : _tail = tail;

  void _setTail(String? v) => _tail ??= v;

  /// Adds parameters.
  void addAll(Map<String, dynamic> map) {
    params.addAll(map);
  }
}

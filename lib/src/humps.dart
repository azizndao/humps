/// Converts the keys of a [Map] from snake case to camel case.
///
/// Iterates through all key-value pairs in the map, converting each key to
/// camel case. For nested map values that are themselves maps, recursively
/// converts their keys to camel case as well.
extension MapCamelizeKeys on Map<String, dynamic> {
  /// Converts this JSON map's keys to camel case.
  ///
  /// Iterates through all key-value pairs in this map, converting each key to
  /// camel case. For map values that are
  /// themselves maps, recursively converts their keys to camel case as well.
  /// ```dart
  /// {
  ///   '_id': 'value',
  ///   'some_key': 'value',
  ///   'nested_key': {
  ///     'another_key': 'value',
  ///     'nested_key': {'another_key': 'value'},
  ///   },
  /// };
  /// ```
  ///
  /// Woulf became:
  ///
  ///```dart
  /// {
  ///   '_id': 'value',
  ///   'someKey': 'value',
  ///   'nestedKey': {
  ///     'anotherKey': 'value',
  ///     'nestedKey': {'anotherKey': 'value'},
  ///   },
  /// }
  /// ```
  Map<String, dynamic> toCamelCase() {
    final newMap = <String, dynamic>{};

    forEach((key, value) {
      final camelCasedKey = _camelCase(key);

      if (value is Map<String, dynamic>) {
        newMap[camelCasedKey] = value.toCamelCase();
      } else if (value is List) {
        newMap[camelCasedKey] = value
            .map((item) =>
                item is Map<String, dynamic> ? item.toCamelCase() : item)
            .toList();
      } else {
        newMap[camelCasedKey] = value;
      }
    });

    return newMap;
  }

  /// Converts the given string to camel case by capitalizing words and removing
  /// underscores.
  ///
  /// If the string starts with an underscore, the underscore is preserved and
  /// the next word is capitalized.
  String _camelCase(String key) {
    if (key.startsWith('_')) {
      return '_${_capitalizeWords(key.substring(1))}';
    }
    return _capitalizeWords(key);
  }

  /// Converts the given string to Title Case by capitalizing the first letter of
  /// each word and removing underscores.
  String _capitalizeWords(String key) {
    return key
        .split('_')
        ._mapIndexed((i, word) => i == 0 ? word : word.toCapitalCase())
        .join();
  }

  /// Converts keys in this map from camelCase to snake_case.
  ///
  /// For example:
  ///
  /// ```dart
  /// {
  ///   '_id': 'value',
  ///   'someKey': 'value',
  ///   'nestedKey': {
  ///     'anotherKey': 'value',
  ///     'nestedKey': {'anotherKey': 'value'},
  ///   },
  /// }
  /// ```
  ///
  /// Would become:
  ///
  /// ```dart
  /// {
  ///   '_id': 'value',
  ///   'some_key': 'value',
  ///   'nested_key': {
  ///     'another_key': 'value',
  ///     'nested_key': {'another_key': 'value'},
  ///   },
  /// };
  /// ```
  ///
  Map<String, dynamic> toSnakeCase() {
    final newMap = <String, dynamic>{};

    forEach((key, value) {
      final snakeCasedKey = _snakeCase(key);

      if (value is Map<String, dynamic>) {
        newMap[snakeCasedKey] = value.toSnakeCase();
      } else if (value is List) {
        newMap[snakeCasedKey] = value
            .map((item) =>
                item is Map<String, dynamic> ? item.toSnakeCase() : item)
            .toList();
      } else {
        newMap[snakeCasedKey] = value;
      }
    });

    return newMap;
  }

  /// Converts the given string to snake case by splitting on uppercase
  /// characters and joining with underscores before lowercasing.
  ///
  /// This is an internal utility function used to convert keys to snake case.
  String _snakeCase(String key) {
    return key.split(RegExp('(?=[A-Z])')).join('_').toLowerCase();
  }
}

/// Extends the [List] class with additional methods.
///
/// This extension adds utility methods to make it easier to work with [List]s.
extension ListExtensions<E> on List<E> {
  /// Iterates over the elements of the list, passing each element and its
  /// index to the given [convert] function, and yields the result.
  Iterable<R> _mapIndexed<R>(R Function(int index, E element) convert) sync* {
    for (var index = 0; index < length; index++) {
      yield convert(index, this[index]);
    }
  }
}

/// Extends the [String] class with additional methods.
///
/// This extension adds utility methods to make it easier to work with [String]s.
extension StringX on String {
  /// Converts the string to capital case by uppercasing the first letter
  /// and lowercasing the rest of the string.
  String toCapitalCase() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

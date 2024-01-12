extension StringHumps on String {
  /// Converts a string from snake_case to camelCase.
  ///
  /// Returns the converted string in camelCase.
  String camelize() {
    if (isEmpty) return this;

    final parts = split(RegExp(r'[-_\s]+'));
    final result = StringBuffer(parts[0]);

    for (var i = 1; i < parts.length; i++) {
      final part = parts[i];
      result
        ..write(part[0].toUpperCase())
        ..write(part.substring(1));
    }

    return result.toString();
  }

  /// Converts a camelCase string to a decamelized string.
  ///
  /// The [separator] parameter is an optional separator to be used between words.
  /// By default, the separator is an underscore ('_').
  /// Returns the decamelized string.
  String decamelize({String separator = '_'}) {
    if (isEmpty) return this;

    final result = StringBuffer();
    var previousChar = '';

    for (var i = 0; i < length; i++) {
      final char = this[i];

      if (char == char.toUpperCase() && char != separator) {
        if (previousChar.isNotEmpty && previousChar != separator) {
          result.write(separator);
        }
        result.write(char.toLowerCase());
      } else {
        result.write(char.toLowerCase());
      }

      previousChar = char;
    }

    return result.toString();
  }

  /// Converts a string to PascalCase.
  ///
  /// Takes an input string and converts it to PascalCase by capitalizing the
  /// first letter of each word
  /// and removing any non-alphanumeric characters.
  ///
  /// Example:
  /// ```dart
  /// String input = "hello_world";
  /// String pascalCase = input.pascalize();
  /// print(pascalCase); // Output: "HelloWorld"
  /// ```
  String pascalize() {
    if (isEmpty) return this;

    final parts = split(RegExp(r'[-_\s]+'));
    final result = StringBuffer();

    for (final part in parts) {
      result
        ..write(part[0].toUpperCase())
        ..write(part.substring(1));
    }

    return result.toString();
  }

  /// Converts a PascalCase string to a lowercased string with words separated
  ///  by a specified separator.
  ///
  /// The [separator] parameter is an optional separator character used to
  /// separate words in the resulting string.
  /// By default, the separator is set to '_'.
  /// Returns the depascalized string.
  String depascalize({String separator = '_'}) {
    if (isEmpty) return this;

    final result = StringBuffer();
    var previousChar = '';

    for (var i = 0; i < length; i++) {
      final char = this[i];

      if (char == char.toUpperCase() && char != separator) {
        if (previousChar.isNotEmpty && previousChar != separator) {
          result.write(separator);
        }
        result.write(char.toLowerCase());
      } else {
        result.write(char.toLowerCase());
      }

      previousChar = char;
    }

    return result.toString();
  }
}

extension MapHumps on Map<String, dynamic> {
  /// Converts a map with snake_case keys to a map with camelCase keys.
  ///
  /// Returns a new map with camelCase keys.
  Map<String, dynamic> camelizeKeys() {
    final result = <String, dynamic>{};

    forEach((key, value) {
      if (value is Map<String, dynamic>) {
        result[key.camelize()] = value.camelizeKeys();
      } else {
        result[key.camelize()] = value;
      }
    });

    return result;
  }

  /// Converts a map with camelCase keys to a map with snake_case keys.
  ///
  /// Returns a new map with snake_case keys.
  Map<String, dynamic> decamelizeKeys() {
    final result = <String, dynamic>{};

    forEach((key, value) {
      if (value is Map<String, dynamic>) {
        result[key.decamelize()] = value.decamelizeKeys();
      } else {
        result[key.decamelize()] = value;
      }
    });

    return result;
  }

  /// Converts a map with camelCase keys to a map with PascalCase keys.
  ///
  /// Returns a new map with PascalCase keys.
  Map<String, dynamic> pascalizeKeys() {
    final result = <String, dynamic>{};

    forEach((key, value) {
      if (value is Map<String, dynamic>) {
        result[key.pascalize()] = value.pascalizeKeys();
      } else {
        result[key.pascalize()] = value;
      }
    });

    return result;
  }

  /// Converts a map with PascalCase keys to a map with snake_case keys.
  ///
  /// Returns a new map with snake_case keys.
  Map<String, dynamic> depascalizeKeys() {
    final result = <String, dynamic>{};

    forEach((key, value) {
      if (value is Map<String, dynamic>) {
        result[key.depascalize()] = value.depascalizeKeys();
      } else {
        result[key.depascalize()] = value;
      }
    });

    return result;
  }
}

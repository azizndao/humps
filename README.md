# humps
A Dart package for converting map keys between camelCase and snake_case. Useful for converting between JSON and Dart field names.

## Features
* toCamelCase() method to convert map keys from snake_case to camelCase
* toSnakeCase() method to convert map keys from camelCase to snake_case
* Works recursively on nested maps
* Handles preserving leading underscores
## Usage
Convert a JSON map with snake_case keys to a Dart map with camelCase keys:

```dart
final map = {
  '_id': 'value',
  'some_key': 'value',
  'nested_key': {
    'another_key': 'value',
    'nested_key': {'another_key': 'value'},
  },
};
// Woulf became:
final map = {
  '_id': 'value',
  'someKey': 'value',
  'nestedKey': {
    'anotherKey': 'value',
    'nestedKey': {'anotherKey': 'value'},
  },
};
```

Convert back to snake_case for sending back to a JSON API:

```dart
final map = {
  '_id': 'value',
  'someKey': 'value',
  'nestedKey': {
    'anotherKey': 'value',
    'nestedKey': {'anotherKey': 'value'},
  },
};

// Would become:

final map = {
  '_id': 'value',
  'some_key': 'value',
  'nested_key': {
    'another_key': 'value',
    'nested_key': {'another_key': 'value'},
  },
};
```
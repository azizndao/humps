import 'dart:convert';

import 'package:humps/humps.dart';
import 'package:test/test.dart';

void main() {
// Usage

  test('camelizeKeys', () {
    final map = <String, Object>{
      'some_key': 'value',
      'nested_key': {
        'another_key': 'value',
        'nested_key': {'another_key': 'value'},
      },
      '_some_key': 'value',
      '_nested_key': {
        'another_key': 'value',
        'nested_key': {'another_key': 'value'},
      },
    };

    final camelizeKeys = map.toCamelCase();

    expect(
      jsonEncode(camelizeKeys),
      jsonEncode({
        'someKey': 'value',
        'nestedKey': {
          'anotherKey': 'value',
          'nestedKey': {'anotherKey': 'value'},
        },
        '_someKey': 'value',
        '_nestedKey': {
          'anotherKey': 'value',
          'nestedKey': {'anotherKey': 'value'},
        },
      }),
    );
  });
}

import 'package:humps/humps.dart';
import 'package:test/test.dart';

void main() {
  group('StringHumps', () {
    test('camelize should convert snake_case to camelCase', () {
      const snakeCase = 'test_string_example';
      final camelCase = snakeCase.camelize();
      expect(camelCase, 'testStringExample');
    });

    test('decamelize should convert camelCase to snake_case', () {
      const camelCase = 'testStringExample';
      final snakeCase = camelCase.decamelize();
      expect(snakeCase, 'test_string_example');
    });

    test('pascalize should convert string to PascalCase', () {
      const input = 'hello_world';
      final pascalCase = input.pascalize();
      expect(pascalCase, 'HelloWorld');
    });

    test(
        'depascalize should convert PascalCase to lowercased string with separator',
        () {
      const pascalCase = 'HelloWorld';
      final depascalized = pascalCase.depascalize();
      expect(depascalized, 'hello_world');
    });
  });

  group('MapHumps', () {
    test('camelizeKeys should convert map keys from snake_case to camelCase',
        () {
      final snakeCaseMap = {
        'test_key_one': 'value1',
        'test_key_two': 'value2',
        'nested_item': {
          'test_key_one': 'value1',
          'test_key_two': 'value2',
        },
      };
      final camelCaseMap = snakeCaseMap.camelizeKeys();
      expect(camelCaseMap, {
        'testKeyOne': 'value1',
        'testKeyTwo': 'value2',
        'nestedItem': {
          'testKeyOne': 'value1',
          'testKeyTwo': 'value2',
        },
      });
    });

    test('decamelizeKeys should convert map keys from camelCase to snake_case',
        () {
      final camelCaseMap = {
        'testKeyOne': 'value1',
        'testKeyTwo': 'value2',
      };
      final snakeCaseMap = camelCaseMap.decamelizeKeys();
      expect(snakeCaseMap, {
        'test_key_one': 'value1',
        'test_key_two': 'value2',
      });
    });

    test('pascalizeKeys should convert map keys to PascalCase', () {
      final map = {
        'test_key_one': 'value1',
        'test_key_two': 'value2',
        'nested_item': {
          'test_key_one': 'value1',
          'test_key_two': 'value2',
        },
      };
      final pascalCaseMap = map.pascalizeKeys();
      expect(pascalCaseMap, {
        'TestKeyOne': 'value1',
        'TestKeyTwo': 'value2',
        'NestedItem': {
          'TestKeyOne': 'value1',
          'TestKeyTwo': 'value2',
        },
      });
    });

    test(
        'depascalizeKeys should convert map keys from PascalCase to snake_case',
        () {
      final pascalCaseMap = {
        'TestKeyOne': 'value1',
        'TestKeyTwo': 'value2',
        'nested_item': {
          'TestKeyOne': 'value1',
          'TestKeyTwo': 'value2',
        },
      };
      final snakeCaseMap = pascalCaseMap.depascalizeKeys();
      expect(snakeCaseMap, {
        'test_key_one': 'value1',
        'test_key_two': 'value2',
        'nested_item': {
          'test_key_one': 'value1',
          'test_key_two': 'value2',
        },
      });
    });
  });
}

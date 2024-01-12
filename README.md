
# Humps

A Dart package for converting string cases.
  
  [![pub package](https://img.shields.io/pub/v/humps.svg)](https://pub.dev/packages/humps)
  [![Build Status](https://travis-ci.org/sagarkbhatt/humps.svg?branch=master)](https://travis-ci.org/sagarkbhatt/humps)
  [![codecov](https://codecov.io/gh/sagarkbhatt/humps/branch/master/graph/badge.svg)](https://codecov.io/gh/sagarkbhatt/humps)
  [![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
  [![GitHub stars](https://img.shields.io/github/stars/sagarkbhatt/humps.svg?style=social&label=Star)](https://github.com/azizndao/humps/stargazers)
  [![GitHub forks](https://img.shields.io/github/forks/sagarkbhatt/humps.svg?style=social&label=Fork)](https://github.com/azizndao/humps/fork)

## Installation

Add `humps` to your `pubspec.yaml` file:

```yaml
dependencies:
  humps: ^1.0.2
```

## Usage

### On String

```dart
import 'package:humps/humps.dart';

void main() {
  String camelCase = 'hello_world'.camelize(); 
  // Output: helloWorld
  String pascalCase = 'hello_world'.pascalize();
  // Output: HelloWorld
  String snakeCase = 'helloWorld'.decamelize();
  // Output: hello_world
  String kebabCase = 'helloWorld'.decamelize(separator: '-');
  // Output: hello-world
}
```

### On Map

```dart
import 'package:humps/humps.dart';

void main() {
  Map<String, dynamic> map = {
    'hello_world': 'Hello World',
    'helloWorld': 'Hello World',
  };

  Map<String, dynamic> camelizedMap = map.camelizeKeys();
  // Output: {helloWorld: Hello World, helloWorld: Hello World}
  Map<String, dynamic> pascalizedMap = map.pascalizeKeys();
  // Output: {HelloWorld: Hello World, HelloWorld: Hello World}
  Map<String, dynamic> snakeizedMap = map.decamelizeKeys();
  // Output: {hello_world: Hello World, hello_world: Hello World}
  Map<String, dynamic> kebabizedMap = map.decamelizeKeys(separator: '-');
  // Output: {hello-world: Hello World, hello-world: Hello World}
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]:

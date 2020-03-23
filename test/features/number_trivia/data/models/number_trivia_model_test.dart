import 'dart:convert';

import 'package:coronatracker/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:coronatracker/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: "test text");

  test(
    'should  be a subclass of NumberTrivia entity',
    () async {
      // Arrange

      // Act

      // Assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group('fromJson', () {
    test("Sound return a valid model when JSON number is interger", () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      //act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, tNumberTriviaModel);
    });

    test("Sound return a valid model when JSON number is regarded as a double",
        () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      //act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, tNumberTriviaModel);
    });
  });

  group('to json', () {
    test('should return a JSON map containing the proper data', () async {
      //arrange
      //act
      final result = tNumberTriviaModel.toJson();
      //assert
      final expectedMap = {'text': "test text", 'number': 1};
      expect(result, expectedMap);
    });
  });
}

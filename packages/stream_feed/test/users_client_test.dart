import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stream_feed/src/client/user_client.dart';
import 'package:stream_feed/src/core/http/token.dart';
import 'package:stream_feed/src/core/models/user.dart';
import 'package:test/test.dart';

import 'mock.dart';

void main() {
  group('Users Client', () {
    final api = MockUserAPI();

    const token = Token('dummyToken');
    const id = 'john-doe';
    final client = UserClient(api, id, userToken: token);

    test('ref', () {
      expect(client.ref, 'SU:john-doe');
    });

    test('getOrCreate', () async {
      const data = {
        'name': 'John Doe',
        'occupation': 'Software Engineer',
        'gender': 'male',
      };
      const user = User(id: id, data: data);
      when(() => api.add(token, id, data, true)).thenAnswer((_) async => user);
      await client.getOrCreate(data);
      verify(() => api.add(token, id, data, true)).called(1);
    });
    test('add', () async {
      const data = {
        'name': 'John Doe',
        'occupation': 'Software Engineer',
        'gender': 'male',
      };
      const user = User(id: id, data: data);
      when(() => api.add(token, id, data)).thenAnswer((_) async => user);
      await client.create(data);
      verify(() => api.add(token, id, data)).called(1);
    });

    test('delete', () async {
      const id = 'john-doe';
      when(() => api.delete(token, id)).thenAnswer((_) async => Response(
          data: {},
          requestOptions: RequestOptions(
            path: '',
          ),
          statusCode: 200));
      await client.delete();
      verify(() => api.delete(token, id)).called(1);
    });

    test('profile', () async {
      const id = 'john-doe';
      const data = {
        'name': 'John Doe',
        'occupation': 'Software Engineer',
        'gender': 'male',
      };
      const user = User(id: id, data: data);
      when(() => api.get(token, id, true)).thenAnswer((_) async => user);
      await client.profile();

      verify(() => api.get(token, id, true)).called(1);
    });

    test('get', () async {
      const id = 'john-doe';
      const data = {
        'name': 'John Doe',
        'occupation': 'Software Engineer',
        'gender': 'male',
      };
      const user = User(id: id, data: data);
      when(() => api.get(token, id)).thenAnswer((_) async => user);
      await client.get();

      verify(() => api.get(token, id)).called(1);
    });

    test('update', () async {
      const id = 'john-doe';
      const data = {
        'name': 'John Doe',
        'occupation': 'Software Engineer',
        'gender': 'male',
      };
      const user = User(id: id, data: data);
      when(() => api.update(token, id, data)).thenAnswer((_) async => user);
      await client.update(data);
      verify(() => api.update(token, id, data)).called(1);
    });
  });
}

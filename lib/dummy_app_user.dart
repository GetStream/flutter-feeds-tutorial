import 'package:stream_feed/stream_feed.dart';

enum DummyAppUser {
  sahil,
  sacha,
  nash,
}

/// Convenient class Extension on [DummyAppUser] enum
extension DummyAppUserX on DummyAppUser {
  /// Convenient method Extension to generate an [id] from [DummyAppUser] enum
  String? get id => {
        DummyAppUser.sahil: 'user:sahil-kumar',
        DummyAppUser.sacha: 'user:sacha-arbonel',
        DummyAppUser.nash: 'user:neevash-ramdial',
      }[this];

  /// Convenient method Extension to generate a [token] from [DummyAppUser] enum
  Token? get token => <DummyAppUser, Token>{
        DummyAppUser.sahil: Token(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FoaWwta3VtYXIifQ.d6RW5eZedEl949w-IeZ40Ukji3yXfFnMw3baLsow028'),
        DummyAppUser.sacha: Token(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FjaGEtYXJib25lbCJ9.fzDKEyiQ40J4YYgtZxpeQhn6ajX-GEnKZOOmcb-xa7M'),
        DummyAppUser.nash: Token(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibmVldmFzaC1yYW1kaWFsIn0.yKqSehu_O5WJGh3-aa5qipnBRs7Qtue-1T9TZhT2ejw'),
      }[this];

  /// Convenient method Extension to generate a [name] from [DummyAppUser] enum
  String? get name => {
        DummyAppUser.sahil: 'Sahil Kumar',
        DummyAppUser.sacha: 'Sacha Arbonel',
        DummyAppUser.nash: 'Neevash Ramdial',
      }[this];

  /// Convenient method Extension to generate [data] from [DummyAppUser] enum
  Map<String, Object>? get data => {
        DummyAppUser.sahil: {
          'first_name': 'Sahil',
          'last_name': 'Kumar',
          'full_name': 'Sahil Kumar',
        },
        DummyAppUser.sacha: {
          'first_name': 'Sacha',
          'last_name': 'Arbonel',
          'full_name': 'Sacha Arbonel',
        },
        DummyAppUser.nash: {
          'first_name': 'Neevash',
          'last_name': 'Ramdial',
          'full_name': 'Neevash Ramdial',
        },
      }[this];
}

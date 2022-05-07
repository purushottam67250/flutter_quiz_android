// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'authentication/entities/session.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3219708598074160258),
      name: 'Session',
      lastPropertyId: const IdUid(9, 6268754392898351773),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 9124261763414918854),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 6477615809607401257),
            name: 'token',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6260730053969266376),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5240630606580209659),
            name: 'niceName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2323973810910778585),
            name: 'displayName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1162803864636780608),
            name: 'userId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2724818297111525428),
            name: 'userFirstName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7621192669483332857),
            name: 'userLastName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 6268754392898351773),
            name: 'image',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 3219708598074160258),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Session: EntityDefinition<Session>(
        model: _entities[0],
        toOneRelations: (Session object) => [],
        toManyRelations: (Session object) => {},
        getId: (Session object) => object.id,
        setId: (Session object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field Session.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (Session object, fb.Builder fbb) {
          final tokenOffset = fbb.writeString(object.token);
          final emailOffset = fbb.writeString(object.email);
          final niceNameOffset = fbb.writeString(object.niceName);
          final displayNameOffset = fbb.writeString(object.displayName);
          final userIdOffset = fbb.writeString(object.userId);
          final userFirstNameOffset = fbb.writeString(object.userFirstName);
          final userLastNameOffset = fbb.writeString(object.userLastName);
          final imageOffset = fbb.writeString(object.image);
          fbb.startTable(10);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, tokenOffset);
          fbb.addOffset(2, emailOffset);
          fbb.addOffset(3, niceNameOffset);
          fbb.addOffset(4, displayNameOffset);
          fbb.addOffset(5, userIdOffset);
          fbb.addOffset(6, userFirstNameOffset);
          fbb.addOffset(7, userLastNameOffset);
          fbb.addOffset(8, imageOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Session(
              id: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              token: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              niceName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              displayName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              userId: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              userFirstName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              userLastName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              image: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 20, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Session] entity fields to define ObjectBox queries.
class Session_ {
  /// see [Session.id]
  static final id = QueryIntegerProperty<Session>(_entities[0].properties[0]);

  /// see [Session.token]
  static final token = QueryStringProperty<Session>(_entities[0].properties[1]);

  /// see [Session.email]
  static final email = QueryStringProperty<Session>(_entities[0].properties[2]);

  /// see [Session.niceName]
  static final niceName =
      QueryStringProperty<Session>(_entities[0].properties[3]);

  /// see [Session.displayName]
  static final displayName =
      QueryStringProperty<Session>(_entities[0].properties[4]);

  /// see [Session.userId]
  static final userId =
      QueryStringProperty<Session>(_entities[0].properties[5]);

  /// see [Session.userFirstName]
  static final userFirstName =
      QueryStringProperty<Session>(_entities[0].properties[6]);

  /// see [Session.userLastName]
  static final userLastName =
      QueryStringProperty<Session>(_entities[0].properties[7]);

  /// see [Session.image]
  static final image = QueryStringProperty<Session>(_entities[0].properties[8]);
}

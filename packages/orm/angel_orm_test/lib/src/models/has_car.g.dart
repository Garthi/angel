// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'has_car.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class HasCarMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('has_cars', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('type').defaultsTo(0);
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('has_cars');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class HasCarQuery extends Query<HasCar, HasCarQueryWhere> {
  HasCarQuery({Query? parent, Set<String>? trampoline})
      : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = HasCarQueryWhere(this);
  }

  @override
  final HasCarQueryValues values = HasCarQueryValues();

  List<String> _selectedFields = [];

  HasCarQueryWhere? _where;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'has_cars';
  }

  @override
  List<String> get fields {
    const _fields = ['id', 'created_at', 'updated_at', 'type'];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  HasCarQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  HasCarQueryWhere? get where {
    return _where;
  }

  @override
  HasCarQueryWhere newWhereClause() {
    return HasCarQueryWhere(this);
  }

  Optional<HasCar> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = HasCar(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? mapToDateTime(row[1]) : null,
        updatedAt: fields.contains('updated_at') ? mapToDateTime(row[2]) : null,
        type: fields.contains('type')
            ? row[3] == null
                ? null
                : CarType?.values[(row[3] as int)]
            : null);
    return Optional.of(model);
  }

  @override
  Optional<HasCar> deserialize(List row) {
    return parseRow(row);
  }
}

class HasCarQueryWhere extends QueryWhere {
  HasCarQueryWhere(HasCarQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        type = EnumSqlExpressionBuilder<CarType?>(
            query, 'type', (v) => v?.index as int);

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final EnumSqlExpressionBuilder<CarType?> type;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, type];
  }
}

class HasCarQueryValues extends MapQueryValues {
  @override
  Map<String, String> get casts {
    return {};
  }

  String? get id {
    return (values['id'] as String?);
  }

  set id(String? value) => values['id'] = value;
  DateTime? get createdAt {
    return (values['created_at'] as DateTime?);
  }

  set createdAt(DateTime? value) => values['created_at'] = value;
  DateTime? get updatedAt {
    return (values['updated_at'] as DateTime?);
  }

  set updatedAt(DateTime? value) => values['updated_at'] = value;
  CarType? get type {
    return CarType?.values[(values['type'] as int)];
  }

  set type(CarType? value) => values['type'] = value?.index;
  void copyFrom(HasCar model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    type = model.type;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class HasCar extends _HasCar {
  HasCar({this.id, this.createdAt, this.updatedAt, this.type = CarType.sedan});

  /// A unique identifier corresponding to this item.
  @override
  String? id;

  /// The time at which this item was created.
  @override
  DateTime? createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime? updatedAt;

  @override
  CarType? type;

  HasCar copyWith(
      {String? id, DateTime? createdAt, DateTime? updatedAt, CarType? type}) {
    return HasCar(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        type: type ?? this.type);
  }

  @override
  bool operator ==(other) {
    return other is _HasCar &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.type == type;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, type]);
  }

  @override
  String toString() {
    return 'HasCar(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, type=$type)';
  }

  Map<String, dynamic> toJson() {
    return HasCarSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const HasCarSerializer hasCarSerializer = HasCarSerializer();

class HasCarEncoder extends Converter<HasCar, Map> {
  const HasCarEncoder();

  @override
  Map convert(HasCar model) => HasCarSerializer.toMap(model);
}

class HasCarDecoder extends Converter<Map, HasCar> {
  const HasCarDecoder();

  @override
  HasCar convert(Map map) => HasCarSerializer.fromMap(map);
}

class HasCarSerializer extends Codec<HasCar, Map> {
  const HasCarSerializer();

  @override
  HasCarEncoder get encoder => const HasCarEncoder();
  @override
  HasCarDecoder get decoder => const HasCarDecoder();
  static HasCar fromMap(Map map) {
    if (map['type'] == null) {
      throw FormatException("Missing required field 'type' on HasCar.");
    }

    return HasCar(
        id: map['id'] as String?,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        type: map['type'] is CarType?
            ? (map['type'] as CarType?) ?? CarType.sedan
            : (map['type'] is int
                ? CarType?.values[map['type'] as int]
                : CarType.sedan));
  }

  static Map<String, dynamic> toMap(_HasCar? model) {
    if (model == null) {
      throw FormatException("Required field [model] cannot be null");
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'type': model.type != null ? CarType.values.indexOf(model.type!) : null
    };
  }
}

abstract class HasCarFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    type
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String type = 'type';
}

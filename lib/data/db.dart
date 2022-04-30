import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

// flutter packages pub run build_runner build --delete-conflicting-outputs

part 'db.g.dart';

class Users extends Table {
  IntColumn get id => integer()();

  TextColumn get deviceId => text()();

  TextColumn get firstName => text()();

  TextColumn get lastName => text()();

  TextColumn get email => text().nullable()();

  TextColumn get mobile => text()();

  IntColumn get points => integer().withDefault(const Constant(0))();

  DateTimeColumn get lastUpdate => dateTime().nullable()();
}

class Issues extends Table {
  IntColumn get internalIssueId => integer().autoIncrement()();

  @JsonKey("Server_Issue_ID")
  IntColumn get serverIssueId => integer()();

  @JsonKey("User_ID")
  IntColumn get userServerId => integer()();

  TextColumn get address => text().nullable()();

  RealColumn get lat => real().nullable()();

  RealColumn get long => real().nullable()();

  TextColumn get status => text().nullable()();

  IntColumn get vote => integer().withDefault(const Constant(0))();

  IntColumn get categoryLvl1 => integer().nullable()();

  IntColumn get categoryLvl2 => integer().nullable()();

  IntColumn get categoryLvl3 => integer().nullable()();

  TextColumn get notes => text().nullable()();
}

class Photos extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get data => text()();

  IntColumn get internalIssueId => integer()();
}

class UserVotes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get data => text()();

  IntColumn get serverIssueId => integer()();

  TextColumn get issueDescription => text()();

  IntColumn get internalIssueId => integer()();
}

@DataClassName('Category')
class Categories extends Table {
  @JsonKey("Category_ID")
  IntColumn get id => integer()();

  @JsonKey("Category_ID")
  TextColumn get description => text()();

  @JsonKey("Category_ID")
  IntColumn get parentId => integer().nullable()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  Users,
  Issues,
  Photos,
  Categories,
  UserVotes,
])
class DeviceDatabase extends _$DeviceDatabase {
  DeviceDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {},
      );
}

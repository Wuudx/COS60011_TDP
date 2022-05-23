import 'package:drift/native.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

// flutter packages pub run build_runner build --delete-conflicting-outputs

part 'db.g.dart';

class Users extends Table {
  @JsonKey("user_id")
  IntColumn get id => integer()();

  @JsonKey("device_id")
  TextColumn get deviceId => text()();

  @JsonKey("first_name")
  TextColumn get firstName => text()();

  @JsonKey("last_name")
  TextColumn get lastName => text()();

  @JsonKey("mobile")
  TextColumn get mobile => text()();

  @JsonKey("points")
  IntColumn get points => integer().withDefault(const Constant(0))();

  @JsonKey("last_updated")
  DateTimeColumn get lastUpdate => dateTime().nullable()();
}

class Issues extends Table {
  @JsonKey("Internal_Issue_ID")
  IntColumn get internalIssueId => integer().nullable()();

  @JsonKey("issue_id")
  IntColumn get serverIssueId => integer()();

  @JsonKey("user_id")
  IntColumn get userServerId => integer()();

  @JsonKey("address")
  TextColumn get address => text().nullable()();

  @JsonKey("lat")
  RealColumn get lat => real().nullable()();

  @JsonKey("lon")
  RealColumn get long => real().nullable()();

  @JsonKey("status")
  TextColumn get status => text().nullable()();

  @JsonKey("vote")
  IntColumn get vote => integer().withDefault(const Constant(0))();

  @JsonKey("description")
  TextColumn get description => text().nullable()();

  @JsonKey("category_1")
  IntColumn get categoryLvl1 => integer().nullable()();
  TextColumn get categoryLvl1Description => text().nullable()();

  @JsonKey("category_2")
  IntColumn get categoryLvl2 => integer().nullable()();
  TextColumn get categoryLvl2Description => text().nullable()();
  TextColumn get categoryLvl2QuestionLabel => text().nullable()();

  @JsonKey("category_3")
  IntColumn get categoryLvl3 => integer().nullable()();
  TextColumn get categoryLvl3Description => text().nullable()();
  TextColumn get categoryLvl3QuestionLabel => text().nullable()();

  TextColumn get images => text().nullable()();

  @JsonKey("assigned_staff")
  IntColumn get assignedStaff => integer().nullable()();

  @JsonKey("notes")
  TextColumn get notes => text().nullable()();

  @JsonKey("last_updated")
  DateTimeColumn get lastUpdate => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {serverIssueId};
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
  @JsonKey("id")
  IntColumn get id => integer()();

  @JsonKey("description")
  TextColumn get description => text()();

  @JsonKey("question")
  TextColumn get questionText => text().nullable()();

  @JsonKey("parent_id")
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
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from <= 1) {
            m.drop(users);
            m.drop(issues);
            m.drop(photos);
            m.drop(categories);
            m.drop(userVotes);
            m.createAll();
          }
          if (from <= 2) {
            m.drop(issues);
            m.createTable(issues);
          }
        },
      );

  double _getDistanceMetresBetween(Distance distance, LatLng latLng1, LatLng latLng2) =>
      distance.as(LengthUnit.Meter, latLng1, latLng2);

  LatLng applyLatLng(LatLng ll, double lat, double lng) {
    ll.latitude = lat;
    ll.longitude = lng;
    return ll;
  }

  Future<int> addIssue(IssuesCompanion issue) => into(issues).insertOnConflictUpdate(issue);

  Future<void> updateIssues(List<Issue> list) async {
    final user = await (select(users)..limit(1)).getSingleOrNull();

    return transaction(() async {
      if (user != null) {
        await (delete(issues)..where((tbl) => tbl.userServerId.equals(user.id).not())).go();
      } else {
        await delete(issues).go();
      }
      for (Issue issue in list) {
        await addIssueOrUpdate(issue);
      }
    });
  }

  Future<void> addIssueOrUpdate(Issue issue) => (into(issues).insert(
        IssuesCompanion.insert(userServerId: issue.serverIssueId),
        onConflict: DoUpdate.withExcluded(
          (old, newest) => IssuesCompanion.custom(
            status: newest.status.dartCast(),
            assignedStaff: newest.assignedStaff.dartCast(),
            vote: newest.vote.dartCast(),
            lastUpdate: newest.lastUpdate.dartCast(),
            lat: newest.lat.dartCast(),
            long: newest.long.dartCast(),
            address: newest.address.dartCast(),
            notes: newest.notes.dartCast(),
          ),
        ),
      ));

  Future<List<Issue>> getIssuesWithinRadius(double lat, double long) async {
    const Distance distance = Distance();
    final userPosLatLng = LatLng(lat, long);
    LatLng projectLatLng = LatLng(0, 0);

    List<Issue> orderedList = await (select(issues)
          // ..where(
          //         (project) =>
          //         isNotNull(project.lat) & project.lat.equals(0).not() &
          //         isNotNull(project.long) & project.long.equals(0).not() &
          //         isNotNull(project.radius) & project.radius.isBiggerThanValue(0)) // filter out projects that aren't valid
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.description, mode: OrderingMode.asc)]))
        .get();

    final filteredList = orderedList.where((project) {
      applyLatLng(projectLatLng, project.lat ?? 0, project.long ?? 0);
      return 150 >= _getDistanceMetresBetween(distance, userPosLatLng, projectLatLng);
    }).toList();

    return filteredList;
  }

  Future<List<Issue>> getAllIssues() => (select(issues)).get();

  Future<void> deleteAllIssues() => (delete(issues)).go();

  Future<void> updateCategories(List<Category> list) async {
    return transaction(() async {
      await delete(categories).go();
      await batch((batch) => batch.insertAll(categories, list));
    });
  }

  Future<List<Category>> getCategories(int? id) async => id != null
      ? (select(categories)..where((tbl) => tbl.parentId.equals(id))).get()
      : (select(categories)..where((tbl) => tbl.parentId.isNull())).get();

  Future<void> addImage(PhotosCompanion image) => into(photos).insert(image);

  Future<List<Photo>> getImagesOfIssue(int internalId) =>
      (select(photos)..where((tbl) => tbl.internalIssueId.equals(internalId))).get();

  Future<void> deleteAllImages() => delete(photos).go();

  Future<int> updateUserInfo(User user) async {
    return transaction(() async {
      await deleteAllUsers();
      return await into(users).insert(user, mode: InsertMode.replace);
    });
  }

  Future<void> deleteAllUsers() => delete(users).go();

  Future<User?> getUser() => (select(users)..limit(1)).getSingleOrNull();
}

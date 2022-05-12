// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int id;
  final String deviceId;
  final String firstName;
  final String lastName;
  final String? email;
  final String mobile;
  final int points;
  final DateTime? lastUpdate;
  User(
      {required this.id,
      required this.deviceId,
      required this.firstName,
      required this.lastName,
      this.email,
      required this.mobile,
      required this.points,
      this.lastUpdate});
  factory User.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      deviceId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}device_id'])!,
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name'])!,
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      mobile: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mobile'])!,
      points: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}points'])!,
      lastUpdate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_update']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['device_id'] = Variable<String>(deviceId);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    map['mobile'] = Variable<String>(mobile);
    map['points'] = Variable<int>(points);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime?>(lastUpdate);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      firstName: Value(firstName),
      lastName: Value(lastName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      mobile: Value(mobile),
      points: Value(points),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String?>(json['email']),
      mobile: serializer.fromJson<String>(json['mobile']),
      points: serializer.fromJson<int>(json['points']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String?>(email),
      'mobile': serializer.toJson<String>(mobile),
      'points': serializer.toJson<int>(points),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
    };
  }

  User copyWith(
          {int? id,
          String? deviceId,
          String? firstName,
          String? lastName,
          String? email,
          String? mobile,
          int? points,
          DateTime? lastUpdate}) =>
      User(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        points: points ?? this.points,
        lastUpdate: lastUpdate ?? this.lastUpdate,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('mobile: $mobile, ')
          ..write('points: $points, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, deviceId, firstName, lastName, email, mobile, points, lastUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.mobile == this.mobile &&
          other.points == this.points &&
          other.lastUpdate == this.lastUpdate);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> email;
  final Value<String> mobile;
  final Value<int> points;
  final Value<DateTime?> lastUpdate;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.mobile = const Value.absent(),
    this.points = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  });
  UsersCompanion.insert({
    required int id,
    required String deviceId,
    required String firstName,
    required String lastName,
    this.email = const Value.absent(),
    required String mobile,
    this.points = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  })  : id = Value(id),
        deviceId = Value(deviceId),
        firstName = Value(firstName),
        lastName = Value(lastName),
        mobile = Value(mobile);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String?>? email,
    Expression<String>? mobile,
    Expression<int>? points,
    Expression<DateTime?>? lastUpdate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (mobile != null) 'mobile': mobile,
      if (points != null) 'points': points,
      if (lastUpdate != null) 'last_update': lastUpdate,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? deviceId,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String?>? email,
      Value<String>? mobile,
      Value<int>? points,
      Value<DateTime?>? lastUpdate}) {
    return UsersCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      points: points ?? this.points,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime?>(lastUpdate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('mobile: $mobile, ')
          ..write('points: $points, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _deviceIdMeta = const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String?> deviceId = GeneratedColumn<String?>(
      'device_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String?> mobile = GeneratedColumn<String?>(
      'mobile', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int?> points = GeneratedColumn<int?>(
      'points', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _lastUpdateMeta = const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime?> lastUpdate = GeneratedColumn<DateTime?>(
      'last_update', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, deviceId, firstName, lastName, email, mobile, points, lastUpdate];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('mobile')) {
      context.handle(_mobileMeta,
          mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta));
    } else if (isInserting) {
      context.missing(_mobileMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class Issue extends DataClass implements Insertable<Issue> {
  final int internalIssueId;
  final int serverIssueId;
  final int userServerId;
  final String? address;
  final double? lat;
  final double? long;
  final String? status;
  final int vote;
  final String? description;
  final int? categoryLvl1;
  final int? categoryLvl2;
  final int? categoryLvl3;
  final String? images;
  final String? notes;
  Issue(
      {required this.internalIssueId,
      required this.serverIssueId,
      required this.userServerId,
      this.address,
      this.lat,
      this.long,
      this.status,
      required this.vote,
      this.description,
      this.categoryLvl1,
      this.categoryLvl2,
      this.categoryLvl3,
      this.images,
      this.notes});
  factory Issue.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Issue(
      internalIssueId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}internal_issue_id'])!,
      serverIssueId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}server_issue_id'])!,
      userServerId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_server_id'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      lat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      long: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}long']),
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
      vote: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      categoryLvl1: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_lvl1']),
      categoryLvl2: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_lvl2']),
      categoryLvl3: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_lvl3']),
      images: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}images']),
      notes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['internal_issue_id'] = Variable<int>(internalIssueId);
    map['server_issue_id'] = Variable<int>(serverIssueId);
    map['user_server_id'] = Variable<int>(userServerId);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String?>(address);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double?>(lat);
    }
    if (!nullToAbsent || long != null) {
      map['long'] = Variable<double?>(long);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String?>(status);
    }
    map['vote'] = Variable<int>(vote);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || categoryLvl1 != null) {
      map['category_lvl1'] = Variable<int?>(categoryLvl1);
    }
    if (!nullToAbsent || categoryLvl2 != null) {
      map['category_lvl2'] = Variable<int?>(categoryLvl2);
    }
    if (!nullToAbsent || categoryLvl3 != null) {
      map['category_lvl3'] = Variable<int?>(categoryLvl3);
    }
    if (!nullToAbsent || images != null) {
      map['images'] = Variable<String?>(images);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String?>(notes);
    }
    return map;
  }

  IssuesCompanion toCompanion(bool nullToAbsent) {
    return IssuesCompanion(
      internalIssueId: Value(internalIssueId),
      serverIssueId: Value(serverIssueId),
      userServerId: Value(userServerId),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      long: long == null && nullToAbsent ? const Value.absent() : Value(long),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      vote: Value(vote),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      categoryLvl1: categoryLvl1 == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryLvl1),
      categoryLvl2: categoryLvl2 == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryLvl2),
      categoryLvl3: categoryLvl3 == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryLvl3),
      images:
          images == null && nullToAbsent ? const Value.absent() : Value(images),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Issue.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Issue(
      internalIssueId: serializer.fromJson<int>(json['internalIssueId']),
      serverIssueId: serializer.fromJson<int>(json['Server_Issue_ID']),
      userServerId: serializer.fromJson<int>(json['User_ID']),
      address: serializer.fromJson<String?>(json['address']),
      lat: serializer.fromJson<double?>(json['lat']),
      long: serializer.fromJson<double?>(json['long']),
      status: serializer.fromJson<String?>(json['status']),
      vote: serializer.fromJson<int>(json['vote']),
      description: serializer.fromJson<String?>(json['description']),
      categoryLvl1: serializer.fromJson<int?>(json['categoryLvl1']),
      categoryLvl2: serializer.fromJson<int?>(json['categoryLvl2']),
      categoryLvl3: serializer.fromJson<int?>(json['categoryLvl3']),
      images: serializer.fromJson<String?>(json['images']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'internalIssueId': serializer.toJson<int>(internalIssueId),
      'Server_Issue_ID': serializer.toJson<int>(serverIssueId),
      'User_ID': serializer.toJson<int>(userServerId),
      'address': serializer.toJson<String?>(address),
      'lat': serializer.toJson<double?>(lat),
      'long': serializer.toJson<double?>(long),
      'status': serializer.toJson<String?>(status),
      'vote': serializer.toJson<int>(vote),
      'description': serializer.toJson<String?>(description),
      'categoryLvl1': serializer.toJson<int?>(categoryLvl1),
      'categoryLvl2': serializer.toJson<int?>(categoryLvl2),
      'categoryLvl3': serializer.toJson<int?>(categoryLvl3),
      'images': serializer.toJson<String?>(images),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Issue copyWith(
          {int? internalIssueId,
          int? serverIssueId,
          int? userServerId,
          String? address,
          double? lat,
          double? long,
          String? status,
          int? vote,
          String? description,
          int? categoryLvl1,
          int? categoryLvl2,
          int? categoryLvl3,
          String? images,
          String? notes}) =>
      Issue(
        internalIssueId: internalIssueId ?? this.internalIssueId,
        serverIssueId: serverIssueId ?? this.serverIssueId,
        userServerId: userServerId ?? this.userServerId,
        address: address ?? this.address,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        status: status ?? this.status,
        vote: vote ?? this.vote,
        description: description ?? this.description,
        categoryLvl1: categoryLvl1 ?? this.categoryLvl1,
        categoryLvl2: categoryLvl2 ?? this.categoryLvl2,
        categoryLvl3: categoryLvl3 ?? this.categoryLvl3,
        images: images ?? this.images,
        notes: notes ?? this.notes,
      );
  @override
  String toString() {
    return (StringBuffer('Issue(')
          ..write('internalIssueId: $internalIssueId, ')
          ..write('serverIssueId: $serverIssueId, ')
          ..write('userServerId: $userServerId, ')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('status: $status, ')
          ..write('vote: $vote, ')
          ..write('description: $description, ')
          ..write('categoryLvl1: $categoryLvl1, ')
          ..write('categoryLvl2: $categoryLvl2, ')
          ..write('categoryLvl3: $categoryLvl3, ')
          ..write('images: $images, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      internalIssueId,
      serverIssueId,
      userServerId,
      address,
      lat,
      long,
      status,
      vote,
      description,
      categoryLvl1,
      categoryLvl2,
      categoryLvl3,
      images,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Issue &&
          other.internalIssueId == this.internalIssueId &&
          other.serverIssueId == this.serverIssueId &&
          other.userServerId == this.userServerId &&
          other.address == this.address &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.status == this.status &&
          other.vote == this.vote &&
          other.description == this.description &&
          other.categoryLvl1 == this.categoryLvl1 &&
          other.categoryLvl2 == this.categoryLvl2 &&
          other.categoryLvl3 == this.categoryLvl3 &&
          other.images == this.images &&
          other.notes == this.notes);
}

class IssuesCompanion extends UpdateCompanion<Issue> {
  final Value<int> internalIssueId;
  final Value<int> serverIssueId;
  final Value<int> userServerId;
  final Value<String?> address;
  final Value<double?> lat;
  final Value<double?> long;
  final Value<String?> status;
  final Value<int> vote;
  final Value<String?> description;
  final Value<int?> categoryLvl1;
  final Value<int?> categoryLvl2;
  final Value<int?> categoryLvl3;
  final Value<String?> images;
  final Value<String?> notes;
  const IssuesCompanion({
    this.internalIssueId = const Value.absent(),
    this.serverIssueId = const Value.absent(),
    this.userServerId = const Value.absent(),
    this.address = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.status = const Value.absent(),
    this.vote = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryLvl1 = const Value.absent(),
    this.categoryLvl2 = const Value.absent(),
    this.categoryLvl3 = const Value.absent(),
    this.images = const Value.absent(),
    this.notes = const Value.absent(),
  });
  IssuesCompanion.insert({
    required int internalIssueId,
    this.serverIssueId = const Value.absent(),
    required int userServerId,
    this.address = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.status = const Value.absent(),
    this.vote = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryLvl1 = const Value.absent(),
    this.categoryLvl2 = const Value.absent(),
    this.categoryLvl3 = const Value.absent(),
    this.images = const Value.absent(),
    this.notes = const Value.absent(),
  })  : internalIssueId = Value(internalIssueId),
        userServerId = Value(userServerId);
  static Insertable<Issue> custom({
    Expression<int>? internalIssueId,
    Expression<int>? serverIssueId,
    Expression<int>? userServerId,
    Expression<String?>? address,
    Expression<double?>? lat,
    Expression<double?>? long,
    Expression<String?>? status,
    Expression<int>? vote,
    Expression<String?>? description,
    Expression<int?>? categoryLvl1,
    Expression<int?>? categoryLvl2,
    Expression<int?>? categoryLvl3,
    Expression<String?>? images,
    Expression<String?>? notes,
  }) {
    return RawValuesInsertable({
      if (internalIssueId != null) 'internal_issue_id': internalIssueId,
      if (serverIssueId != null) 'server_issue_id': serverIssueId,
      if (userServerId != null) 'user_server_id': userServerId,
      if (address != null) 'address': address,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (status != null) 'status': status,
      if (vote != null) 'vote': vote,
      if (description != null) 'description': description,
      if (categoryLvl1 != null) 'category_lvl1': categoryLvl1,
      if (categoryLvl2 != null) 'category_lvl2': categoryLvl2,
      if (categoryLvl3 != null) 'category_lvl3': categoryLvl3,
      if (images != null) 'images': images,
      if (notes != null) 'notes': notes,
    });
  }

  IssuesCompanion copyWith(
      {Value<int>? internalIssueId,
      Value<int>? serverIssueId,
      Value<int>? userServerId,
      Value<String?>? address,
      Value<double?>? lat,
      Value<double?>? long,
      Value<String?>? status,
      Value<int>? vote,
      Value<String?>? description,
      Value<int?>? categoryLvl1,
      Value<int?>? categoryLvl2,
      Value<int?>? categoryLvl3,
      Value<String?>? images,
      Value<String?>? notes}) {
    return IssuesCompanion(
      internalIssueId: internalIssueId ?? this.internalIssueId,
      serverIssueId: serverIssueId ?? this.serverIssueId,
      userServerId: userServerId ?? this.userServerId,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      status: status ?? this.status,
      vote: vote ?? this.vote,
      description: description ?? this.description,
      categoryLvl1: categoryLvl1 ?? this.categoryLvl1,
      categoryLvl2: categoryLvl2 ?? this.categoryLvl2,
      categoryLvl3: categoryLvl3 ?? this.categoryLvl3,
      images: images ?? this.images,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (internalIssueId.present) {
      map['internal_issue_id'] = Variable<int>(internalIssueId.value);
    }
    if (serverIssueId.present) {
      map['server_issue_id'] = Variable<int>(serverIssueId.value);
    }
    if (userServerId.present) {
      map['user_server_id'] = Variable<int>(userServerId.value);
    }
    if (address.present) {
      map['address'] = Variable<String?>(address.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double?>(lat.value);
    }
    if (long.present) {
      map['long'] = Variable<double?>(long.value);
    }
    if (status.present) {
      map['status'] = Variable<String?>(status.value);
    }
    if (vote.present) {
      map['vote'] = Variable<int>(vote.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (categoryLvl1.present) {
      map['category_lvl1'] = Variable<int?>(categoryLvl1.value);
    }
    if (categoryLvl2.present) {
      map['category_lvl2'] = Variable<int?>(categoryLvl2.value);
    }
    if (categoryLvl3.present) {
      map['category_lvl3'] = Variable<int?>(categoryLvl3.value);
    }
    if (images.present) {
      map['images'] = Variable<String?>(images.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String?>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IssuesCompanion(')
          ..write('internalIssueId: $internalIssueId, ')
          ..write('serverIssueId: $serverIssueId, ')
          ..write('userServerId: $userServerId, ')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('status: $status, ')
          ..write('vote: $vote, ')
          ..write('description: $description, ')
          ..write('categoryLvl1: $categoryLvl1, ')
          ..write('categoryLvl2: $categoryLvl2, ')
          ..write('categoryLvl3: $categoryLvl3, ')
          ..write('images: $images, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $IssuesTable extends Issues with TableInfo<$IssuesTable, Issue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IssuesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _internalIssueIdMeta =
      const VerificationMeta('internalIssueId');
  @override
  late final GeneratedColumn<int?> internalIssueId = GeneratedColumn<int?>(
      'internal_issue_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _serverIssueIdMeta =
      const VerificationMeta('serverIssueId');
  @override
  late final GeneratedColumn<int?> serverIssueId = GeneratedColumn<int?>(
      'server_issue_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _userServerIdMeta =
      const VerificationMeta('userServerId');
  @override
  late final GeneratedColumn<int?> userServerId = GeneratedColumn<int?>(
      'user_server_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double?> lat = GeneratedColumn<double?>(
      'lat', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<double?> long = GeneratedColumn<double?>(
      'long', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _voteMeta = const VerificationMeta('vote');
  @override
  late final GeneratedColumn<int?> vote = GeneratedColumn<int?>(
      'vote', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl1Meta =
      const VerificationMeta('categoryLvl1');
  @override
  late final GeneratedColumn<int?> categoryLvl1 = GeneratedColumn<int?>(
      'category_lvl1', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl2Meta =
      const VerificationMeta('categoryLvl2');
  @override
  late final GeneratedColumn<int?> categoryLvl2 = GeneratedColumn<int?>(
      'category_lvl2', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl3Meta =
      const VerificationMeta('categoryLvl3');
  @override
  late final GeneratedColumn<int?> categoryLvl3 = GeneratedColumn<int?>(
      'category_lvl3', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _imagesMeta = const VerificationMeta('images');
  @override
  late final GeneratedColumn<String?> images = GeneratedColumn<String?>(
      'images', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String?> notes = GeneratedColumn<String?>(
      'notes', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        internalIssueId,
        serverIssueId,
        userServerId,
        address,
        lat,
        long,
        status,
        vote,
        description,
        categoryLvl1,
        categoryLvl2,
        categoryLvl3,
        images,
        notes
      ];
  @override
  String get aliasedName => _alias ?? 'issues';
  @override
  String get actualTableName => 'issues';
  @override
  VerificationContext validateIntegrity(Insertable<Issue> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('internal_issue_id')) {
      context.handle(
          _internalIssueIdMeta,
          internalIssueId.isAcceptableOrUnknown(
              data['internal_issue_id']!, _internalIssueIdMeta));
    } else if (isInserting) {
      context.missing(_internalIssueIdMeta);
    }
    if (data.containsKey('server_issue_id')) {
      context.handle(
          _serverIssueIdMeta,
          serverIssueId.isAcceptableOrUnknown(
              data['server_issue_id']!, _serverIssueIdMeta));
    }
    if (data.containsKey('user_server_id')) {
      context.handle(
          _userServerIdMeta,
          userServerId.isAcceptableOrUnknown(
              data['user_server_id']!, _userServerIdMeta));
    } else if (isInserting) {
      context.missing(_userServerIdMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    }
    if (data.containsKey('long')) {
      context.handle(
          _longMeta, long.isAcceptableOrUnknown(data['long']!, _longMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('vote')) {
      context.handle(
          _voteMeta, vote.isAcceptableOrUnknown(data['vote']!, _voteMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('category_lvl1')) {
      context.handle(
          _categoryLvl1Meta,
          categoryLvl1.isAcceptableOrUnknown(
              data['category_lvl1']!, _categoryLvl1Meta));
    }
    if (data.containsKey('category_lvl2')) {
      context.handle(
          _categoryLvl2Meta,
          categoryLvl2.isAcceptableOrUnknown(
              data['category_lvl2']!, _categoryLvl2Meta));
    }
    if (data.containsKey('category_lvl3')) {
      context.handle(
          _categoryLvl3Meta,
          categoryLvl3.isAcceptableOrUnknown(
              data['category_lvl3']!, _categoryLvl3Meta));
    }
    if (data.containsKey('images')) {
      context.handle(_imagesMeta,
          images.isAcceptableOrUnknown(data['images']!, _imagesMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {serverIssueId};
  @override
  Issue map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Issue.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $IssuesTable createAlias(String alias) {
    return $IssuesTable(attachedDatabase, alias);
  }
}

class Photo extends DataClass implements Insertable<Photo> {
  final int id;
  final String data;
  final int internalIssueId;
  Photo({required this.id, required this.data, required this.internalIssueId});
  factory Photo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Photo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      data: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
      internalIssueId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}internal_issue_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['data'] = Variable<String>(data);
    map['internal_issue_id'] = Variable<int>(internalIssueId);
    return map;
  }

  PhotosCompanion toCompanion(bool nullToAbsent) {
    return PhotosCompanion(
      id: Value(id),
      data: Value(data),
      internalIssueId: Value(internalIssueId),
    );
  }

  factory Photo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Photo(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String>(json['data']),
      internalIssueId: serializer.fromJson<int>(json['internalIssueId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String>(data),
      'internalIssueId': serializer.toJson<int>(internalIssueId),
    };
  }

  Photo copyWith({int? id, String? data, int? internalIssueId}) => Photo(
        id: id ?? this.id,
        data: data ?? this.data,
        internalIssueId: internalIssueId ?? this.internalIssueId,
      );
  @override
  String toString() {
    return (StringBuffer('Photo(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('internalIssueId: $internalIssueId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, data, internalIssueId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
          other.id == this.id &&
          other.data == this.data &&
          other.internalIssueId == this.internalIssueId);
}

class PhotosCompanion extends UpdateCompanion<Photo> {
  final Value<int> id;
  final Value<String> data;
  final Value<int> internalIssueId;
  const PhotosCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.internalIssueId = const Value.absent(),
  });
  PhotosCompanion.insert({
    this.id = const Value.absent(),
    required String data,
    required int internalIssueId,
  })  : data = Value(data),
        internalIssueId = Value(internalIssueId);
  static Insertable<Photo> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<int>? internalIssueId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (internalIssueId != null) 'internal_issue_id': internalIssueId,
    });
  }

  PhotosCompanion copyWith(
      {Value<int>? id, Value<String>? data, Value<int>? internalIssueId}) {
    return PhotosCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      internalIssueId: internalIssueId ?? this.internalIssueId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (internalIssueId.present) {
      map['internal_issue_id'] = Variable<int>(internalIssueId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotosCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('internalIssueId: $internalIssueId')
          ..write(')'))
        .toString();
  }
}

class $PhotosTable extends Photos with TableInfo<$PhotosTable, Photo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String?> data = GeneratedColumn<String?>(
      'data', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _internalIssueIdMeta =
      const VerificationMeta('internalIssueId');
  @override
  late final GeneratedColumn<int?> internalIssueId = GeneratedColumn<int?>(
      'internal_issue_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, data, internalIssueId];
  @override
  String get aliasedName => _alias ?? 'photos';
  @override
  String get actualTableName => 'photos';
  @override
  VerificationContext validateIntegrity(Insertable<Photo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('internal_issue_id')) {
      context.handle(
          _internalIssueIdMeta,
          internalIssueId.isAcceptableOrUnknown(
              data['internal_issue_id']!, _internalIssueIdMeta));
    } else if (isInserting) {
      context.missing(_internalIssueIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Photo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Photo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PhotosTable createAlias(String alias) {
    return $PhotosTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String description;
  final int? parentId;
  Category({required this.id, required this.description, this.parentId});
  factory Category.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Category(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      parentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int?>(parentId);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      description: Value(description),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['Category_ID']),
      description: serializer.fromJson<String>(json['Category_ID']),
      parentId: serializer.fromJson<int?>(json['Category_ID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'Category_ID': serializer.toJson<int>(id),
      'Category_ID': serializer.toJson<String>(description),
      'Category_ID': serializer.toJson<int?>(parentId),
    };
  }

  Category copyWith({int? id, String? description, int? parentId}) => Category(
        id: id ?? this.id,
        description: description ?? this.description,
        parentId: parentId ?? this.parentId,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, parentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.description == this.description &&
          other.parentId == this.parentId);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> description;
  final Value<int?> parentId;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.parentId = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required int id,
    required String description,
    this.parentId = const Value.absent(),
  })  : id = Value(id),
        description = Value(description);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<int?>? parentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id, Value<String>? description, Value<int?>? parentId}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      parentId: parentId ?? this.parentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int?>(parentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int?> parentId = GeneratedColumn<int?>(
      'parent_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, description, parentId];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Category.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class UserVote extends DataClass implements Insertable<UserVote> {
  final int id;
  final String data;
  final int serverIssueId;
  final String issueDescription;
  final int internalIssueId;
  UserVote(
      {required this.id,
      required this.data,
      required this.serverIssueId,
      required this.issueDescription,
      required this.internalIssueId});
  factory UserVote.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserVote(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      data: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
      serverIssueId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}server_issue_id'])!,
      issueDescription: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}issue_description'])!,
      internalIssueId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}internal_issue_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['data'] = Variable<String>(data);
    map['server_issue_id'] = Variable<int>(serverIssueId);
    map['issue_description'] = Variable<String>(issueDescription);
    map['internal_issue_id'] = Variable<int>(internalIssueId);
    return map;
  }

  UserVotesCompanion toCompanion(bool nullToAbsent) {
    return UserVotesCompanion(
      id: Value(id),
      data: Value(data),
      serverIssueId: Value(serverIssueId),
      issueDescription: Value(issueDescription),
      internalIssueId: Value(internalIssueId),
    );
  }

  factory UserVote.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserVote(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String>(json['data']),
      serverIssueId: serializer.fromJson<int>(json['serverIssueId']),
      issueDescription: serializer.fromJson<String>(json['issueDescription']),
      internalIssueId: serializer.fromJson<int>(json['internalIssueId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String>(data),
      'serverIssueId': serializer.toJson<int>(serverIssueId),
      'issueDescription': serializer.toJson<String>(issueDescription),
      'internalIssueId': serializer.toJson<int>(internalIssueId),
    };
  }

  UserVote copyWith(
          {int? id,
          String? data,
          int? serverIssueId,
          String? issueDescription,
          int? internalIssueId}) =>
      UserVote(
        id: id ?? this.id,
        data: data ?? this.data,
        serverIssueId: serverIssueId ?? this.serverIssueId,
        issueDescription: issueDescription ?? this.issueDescription,
        internalIssueId: internalIssueId ?? this.internalIssueId,
      );
  @override
  String toString() {
    return (StringBuffer('UserVote(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('serverIssueId: $serverIssueId, ')
          ..write('issueDescription: $issueDescription, ')
          ..write('internalIssueId: $internalIssueId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, data, serverIssueId, issueDescription, internalIssueId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserVote &&
          other.id == this.id &&
          other.data == this.data &&
          other.serverIssueId == this.serverIssueId &&
          other.issueDescription == this.issueDescription &&
          other.internalIssueId == this.internalIssueId);
}

class UserVotesCompanion extends UpdateCompanion<UserVote> {
  final Value<int> id;
  final Value<String> data;
  final Value<int> serverIssueId;
  final Value<String> issueDescription;
  final Value<int> internalIssueId;
  const UserVotesCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.serverIssueId = const Value.absent(),
    this.issueDescription = const Value.absent(),
    this.internalIssueId = const Value.absent(),
  });
  UserVotesCompanion.insert({
    this.id = const Value.absent(),
    required String data,
    required int serverIssueId,
    required String issueDescription,
    required int internalIssueId,
  })  : data = Value(data),
        serverIssueId = Value(serverIssueId),
        issueDescription = Value(issueDescription),
        internalIssueId = Value(internalIssueId);
  static Insertable<UserVote> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<int>? serverIssueId,
    Expression<String>? issueDescription,
    Expression<int>? internalIssueId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (serverIssueId != null) 'server_issue_id': serverIssueId,
      if (issueDescription != null) 'issue_description': issueDescription,
      if (internalIssueId != null) 'internal_issue_id': internalIssueId,
    });
  }

  UserVotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? data,
      Value<int>? serverIssueId,
      Value<String>? issueDescription,
      Value<int>? internalIssueId}) {
    return UserVotesCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      serverIssueId: serverIssueId ?? this.serverIssueId,
      issueDescription: issueDescription ?? this.issueDescription,
      internalIssueId: internalIssueId ?? this.internalIssueId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (serverIssueId.present) {
      map['server_issue_id'] = Variable<int>(serverIssueId.value);
    }
    if (issueDescription.present) {
      map['issue_description'] = Variable<String>(issueDescription.value);
    }
    if (internalIssueId.present) {
      map['internal_issue_id'] = Variable<int>(internalIssueId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserVotesCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('serverIssueId: $serverIssueId, ')
          ..write('issueDescription: $issueDescription, ')
          ..write('internalIssueId: $internalIssueId')
          ..write(')'))
        .toString();
  }
}

class $UserVotesTable extends UserVotes
    with TableInfo<$UserVotesTable, UserVote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserVotesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String?> data = GeneratedColumn<String?>(
      'data', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _serverIssueIdMeta =
      const VerificationMeta('serverIssueId');
  @override
  late final GeneratedColumn<int?> serverIssueId = GeneratedColumn<int?>(
      'server_issue_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _issueDescriptionMeta =
      const VerificationMeta('issueDescription');
  @override
  late final GeneratedColumn<String?> issueDescription =
      GeneratedColumn<String?>('issue_description', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _internalIssueIdMeta =
      const VerificationMeta('internalIssueId');
  @override
  late final GeneratedColumn<int?> internalIssueId = GeneratedColumn<int?>(
      'internal_issue_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, data, serverIssueId, issueDescription, internalIssueId];
  @override
  String get aliasedName => _alias ?? 'user_votes';
  @override
  String get actualTableName => 'user_votes';
  @override
  VerificationContext validateIntegrity(Insertable<UserVote> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('server_issue_id')) {
      context.handle(
          _serverIssueIdMeta,
          serverIssueId.isAcceptableOrUnknown(
              data['server_issue_id']!, _serverIssueIdMeta));
    } else if (isInserting) {
      context.missing(_serverIssueIdMeta);
    }
    if (data.containsKey('issue_description')) {
      context.handle(
          _issueDescriptionMeta,
          issueDescription.isAcceptableOrUnknown(
              data['issue_description']!, _issueDescriptionMeta));
    } else if (isInserting) {
      context.missing(_issueDescriptionMeta);
    }
    if (data.containsKey('internal_issue_id')) {
      context.handle(
          _internalIssueIdMeta,
          internalIssueId.isAcceptableOrUnknown(
              data['internal_issue_id']!, _internalIssueIdMeta));
    } else if (isInserting) {
      context.missing(_internalIssueIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserVote map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserVote.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserVotesTable createAlias(String alias) {
    return $UserVotesTable(attachedDatabase, alias);
  }
}

abstract class _$DeviceDatabase extends GeneratedDatabase {
  _$DeviceDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $IssuesTable issues = $IssuesTable(this);
  late final $PhotosTable photos = $PhotosTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $UserVotesTable userVotes = $UserVotesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, issues, photos, categories, userVotes];
}

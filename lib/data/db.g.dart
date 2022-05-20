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
  final String mobile;
  final int points;
  final DateTime? lastUpdate;
  User(
      {required this.id,
      required this.deviceId,
      required this.firstName,
      required this.lastName,
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
      id: serializer.fromJson<int>(json['user_id']),
      deviceId: serializer.fromJson<String>(json['device_id']),
      firstName: serializer.fromJson<String>(json['first_name']),
      lastName: serializer.fromJson<String>(json['last_name']),
      mobile: serializer.fromJson<String>(json['mobile']),
      points: serializer.fromJson<int>(json['points']),
      lastUpdate: serializer.fromJson<DateTime?>(json['last_updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<int>(id),
      'device_id': serializer.toJson<String>(deviceId),
      'first_name': serializer.toJson<String>(firstName),
      'last_name': serializer.toJson<String>(lastName),
      'mobile': serializer.toJson<String>(mobile),
      'points': serializer.toJson<int>(points),
      'last_updated': serializer.toJson<DateTime?>(lastUpdate),
    };
  }

  User copyWith(
          {int? id,
          String? deviceId,
          String? firstName,
          String? lastName,
          String? mobile,
          int? points,
          DateTime? lastUpdate}) =>
      User(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
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
          ..write('mobile: $mobile, ')
          ..write('points: $points, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, deviceId, firstName, lastName, mobile, points, lastUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.mobile == this.mobile &&
          other.points == this.points &&
          other.lastUpdate == this.lastUpdate);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> mobile;
  final Value<int> points;
  final Value<DateTime?> lastUpdate;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.points = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  });
  UsersCompanion.insert({
    required int id,
    required String deviceId,
    required String firstName,
    required String lastName,
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
    Expression<String>? mobile,
    Expression<int>? points,
    Expression<DateTime?>? lastUpdate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
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
      Value<String>? mobile,
      Value<int>? points,
      Value<DateTime?>? lastUpdate}) {
    return UsersCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
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
      [id, deviceId, firstName, lastName, mobile, points, lastUpdate];
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
  final int? internalIssueId;
  final int serverIssueId;
  final int userServerId;
  final String? address;
  final double? lat;
  final double? long;
  final String? status;
  final int vote;
  final String? description;
  final int? categoryLvl1;
  final String? categoryLvl1Description;
  final int? categoryLvl2;
  final String? categoryLvl2Description;
  final String? categoryLvl2QuestionLabel;
  final int? categoryLvl3;
  final String? categoryLvl3Description;
  final String? categoryLvl3QuestionLabel;
  final String? images;
  final int? assignedStaff;
  final String? notes;
  final DateTime? lastUpdate;
  Issue(
      {this.internalIssueId,
      required this.serverIssueId,
      required this.userServerId,
      this.address,
      this.lat,
      this.long,
      this.status,
      required this.vote,
      this.description,
      this.categoryLvl1,
      this.categoryLvl1Description,
      this.categoryLvl2,
      this.categoryLvl2Description,
      this.categoryLvl2QuestionLabel,
      this.categoryLvl3,
      this.categoryLvl3Description,
      this.categoryLvl3QuestionLabel,
      this.images,
      this.assignedStaff,
      this.notes,
      this.lastUpdate});
  factory Issue.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Issue(
      internalIssueId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}internal_issue_id']),
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
      categoryLvl1Description: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}category_lvl1_description']),
      categoryLvl2: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_lvl2']),
      categoryLvl2Description: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}category_lvl2_description']),
      categoryLvl2QuestionLabel: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}category_lvl2_question_label']),
      categoryLvl3: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_lvl3']),
      categoryLvl3Description: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}category_lvl3_description']),
      categoryLvl3QuestionLabel: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}category_lvl3_question_label']),
      images: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}images']),
      assignedStaff: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}assigned_staff']),
      notes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes']),
      lastUpdate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_update']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || internalIssueId != null) {
      map['internal_issue_id'] = Variable<int?>(internalIssueId);
    }
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
    if (!nullToAbsent || categoryLvl1Description != null) {
      map['category_lvl1_description'] =
          Variable<String?>(categoryLvl1Description);
    }
    if (!nullToAbsent || categoryLvl2 != null) {
      map['category_lvl2'] = Variable<int?>(categoryLvl2);
    }
    if (!nullToAbsent || categoryLvl2Description != null) {
      map['category_lvl2_description'] =
          Variable<String?>(categoryLvl2Description);
    }
    if (!nullToAbsent || categoryLvl2QuestionLabel != null) {
      map['category_lvl2_question_label'] =
          Variable<String?>(categoryLvl2QuestionLabel);
    }
    if (!nullToAbsent || categoryLvl3 != null) {
      map['category_lvl3'] = Variable<int?>(categoryLvl3);
    }
    if (!nullToAbsent || categoryLvl3Description != null) {
      map['category_lvl3_description'] =
          Variable<String?>(categoryLvl3Description);
    }
    if (!nullToAbsent || categoryLvl3QuestionLabel != null) {
      map['category_lvl3_question_label'] =
          Variable<String?>(categoryLvl3QuestionLabel);
    }
    if (!nullToAbsent || images != null) {
      map['images'] = Variable<String?>(images);
    }
    if (!nullToAbsent || assignedStaff != null) {
      map['assigned_staff'] = Variable<int?>(assignedStaff);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String?>(notes);
    }
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime?>(lastUpdate);
    }
    return map;
  }

  IssuesCompanion toCompanion(bool nullToAbsent) {
    return IssuesCompanion(
      internalIssueId: internalIssueId == null && nullToAbsent
          ? const Value.absent()
          : Value(internalIssueId),
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
      categoryLvl1Description: categoryLvl1Description == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryLvl1Description),
      categoryLvl2: categoryLvl2 == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryLvl2),
      categoryLvl2Description: categoryLvl2Description == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryLvl2Description),
      categoryLvl2QuestionLabel:
          categoryLvl2QuestionLabel == null && nullToAbsent
              ? const Value.absent()
              : Value(categoryLvl2QuestionLabel),
      categoryLvl3: categoryLvl3 == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryLvl3),
      categoryLvl3Description: categoryLvl3Description == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryLvl3Description),
      categoryLvl3QuestionLabel:
          categoryLvl3QuestionLabel == null && nullToAbsent
              ? const Value.absent()
              : Value(categoryLvl3QuestionLabel),
      images:
          images == null && nullToAbsent ? const Value.absent() : Value(images),
      assignedStaff: assignedStaff == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedStaff),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
    );
  }

  factory Issue.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Issue(
      internalIssueId: serializer.fromJson<int?>(json['Internal_Issue_ID']),
      serverIssueId: serializer.fromJson<int>(json['issue_id']),
      userServerId: serializer.fromJson<int>(json['user_id']),
      address: serializer.fromJson<String?>(json['address']),
      lat: serializer.fromJson<double?>(json['lat']),
      long: serializer.fromJson<double?>(json['lon']),
      status: serializer.fromJson<String?>(json['status']),
      vote: serializer.fromJson<int>(json['vote']),
      description: serializer.fromJson<String?>(json['description']),
      categoryLvl1: serializer.fromJson<int?>(json['category_1']),
      categoryLvl1Description:
          serializer.fromJson<String?>(json['categoryLvl1Description']),
      categoryLvl2: serializer.fromJson<int?>(json['category_2']),
      categoryLvl2Description:
          serializer.fromJson<String?>(json['categoryLvl2Description']),
      categoryLvl2QuestionLabel:
          serializer.fromJson<String?>(json['categoryLvl2QuestionLabel']),
      categoryLvl3: serializer.fromJson<int?>(json['category_3']),
      categoryLvl3Description:
          serializer.fromJson<String?>(json['categoryLvl3Description']),
      categoryLvl3QuestionLabel:
          serializer.fromJson<String?>(json['categoryLvl3QuestionLabel']),
      images: serializer.fromJson<String?>(json['images']),
      assignedStaff: serializer.fromJson<int?>(json['assigned_staff']),
      notes: serializer.fromJson<String?>(json['notes']),
      lastUpdate: serializer.fromJson<DateTime?>(json['last_updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'Internal_Issue_ID': serializer.toJson<int?>(internalIssueId),
      'issue_id': serializer.toJson<int>(serverIssueId),
      'user_id': serializer.toJson<int>(userServerId),
      'address': serializer.toJson<String?>(address),
      'lat': serializer.toJson<double?>(lat),
      'lon': serializer.toJson<double?>(long),
      'status': serializer.toJson<String?>(status),
      'vote': serializer.toJson<int>(vote),
      'description': serializer.toJson<String?>(description),
      'category_1': serializer.toJson<int?>(categoryLvl1),
      'categoryLvl1Description':
          serializer.toJson<String?>(categoryLvl1Description),
      'category_2': serializer.toJson<int?>(categoryLvl2),
      'categoryLvl2Description':
          serializer.toJson<String?>(categoryLvl2Description),
      'categoryLvl2QuestionLabel':
          serializer.toJson<String?>(categoryLvl2QuestionLabel),
      'category_3': serializer.toJson<int?>(categoryLvl3),
      'categoryLvl3Description':
          serializer.toJson<String?>(categoryLvl3Description),
      'categoryLvl3QuestionLabel':
          serializer.toJson<String?>(categoryLvl3QuestionLabel),
      'images': serializer.toJson<String?>(images),
      'assigned_staff': serializer.toJson<int?>(assignedStaff),
      'notes': serializer.toJson<String?>(notes),
      'last_updated': serializer.toJson<DateTime?>(lastUpdate),
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
          String? categoryLvl1Description,
          int? categoryLvl2,
          String? categoryLvl2Description,
          String? categoryLvl2QuestionLabel,
          int? categoryLvl3,
          String? categoryLvl3Description,
          String? categoryLvl3QuestionLabel,
          String? images,
          int? assignedStaff,
          String? notes,
          DateTime? lastUpdate}) =>
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
        categoryLvl1Description:
            categoryLvl1Description ?? this.categoryLvl1Description,
        categoryLvl2: categoryLvl2 ?? this.categoryLvl2,
        categoryLvl2Description:
            categoryLvl2Description ?? this.categoryLvl2Description,
        categoryLvl2QuestionLabel:
            categoryLvl2QuestionLabel ?? this.categoryLvl2QuestionLabel,
        categoryLvl3: categoryLvl3 ?? this.categoryLvl3,
        categoryLvl3Description:
            categoryLvl3Description ?? this.categoryLvl3Description,
        categoryLvl3QuestionLabel:
            categoryLvl3QuestionLabel ?? this.categoryLvl3QuestionLabel,
        images: images ?? this.images,
        assignedStaff: assignedStaff ?? this.assignedStaff,
        notes: notes ?? this.notes,
        lastUpdate: lastUpdate ?? this.lastUpdate,
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
          ..write('categoryLvl1Description: $categoryLvl1Description, ')
          ..write('categoryLvl2: $categoryLvl2, ')
          ..write('categoryLvl2Description: $categoryLvl2Description, ')
          ..write('categoryLvl2QuestionLabel: $categoryLvl2QuestionLabel, ')
          ..write('categoryLvl3: $categoryLvl3, ')
          ..write('categoryLvl3Description: $categoryLvl3Description, ')
          ..write('categoryLvl3QuestionLabel: $categoryLvl3QuestionLabel, ')
          ..write('images: $images, ')
          ..write('assignedStaff: $assignedStaff, ')
          ..write('notes: $notes, ')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
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
        categoryLvl1Description,
        categoryLvl2,
        categoryLvl2Description,
        categoryLvl2QuestionLabel,
        categoryLvl3,
        categoryLvl3Description,
        categoryLvl3QuestionLabel,
        images,
        assignedStaff,
        notes,
        lastUpdate
      ]);
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
          other.categoryLvl1Description == this.categoryLvl1Description &&
          other.categoryLvl2 == this.categoryLvl2 &&
          other.categoryLvl2Description == this.categoryLvl2Description &&
          other.categoryLvl2QuestionLabel == this.categoryLvl2QuestionLabel &&
          other.categoryLvl3 == this.categoryLvl3 &&
          other.categoryLvl3Description == this.categoryLvl3Description &&
          other.categoryLvl3QuestionLabel == this.categoryLvl3QuestionLabel &&
          other.images == this.images &&
          other.assignedStaff == this.assignedStaff &&
          other.notes == this.notes &&
          other.lastUpdate == this.lastUpdate);
}

class IssuesCompanion extends UpdateCompanion<Issue> {
  final Value<int?> internalIssueId;
  final Value<int> serverIssueId;
  final Value<int> userServerId;
  final Value<String?> address;
  final Value<double?> lat;
  final Value<double?> long;
  final Value<String?> status;
  final Value<int> vote;
  final Value<String?> description;
  final Value<int?> categoryLvl1;
  final Value<String?> categoryLvl1Description;
  final Value<int?> categoryLvl2;
  final Value<String?> categoryLvl2Description;
  final Value<String?> categoryLvl2QuestionLabel;
  final Value<int?> categoryLvl3;
  final Value<String?> categoryLvl3Description;
  final Value<String?> categoryLvl3QuestionLabel;
  final Value<String?> images;
  final Value<int?> assignedStaff;
  final Value<String?> notes;
  final Value<DateTime?> lastUpdate;
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
    this.categoryLvl1Description = const Value.absent(),
    this.categoryLvl2 = const Value.absent(),
    this.categoryLvl2Description = const Value.absent(),
    this.categoryLvl2QuestionLabel = const Value.absent(),
    this.categoryLvl3 = const Value.absent(),
    this.categoryLvl3Description = const Value.absent(),
    this.categoryLvl3QuestionLabel = const Value.absent(),
    this.images = const Value.absent(),
    this.assignedStaff = const Value.absent(),
    this.notes = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  });
  IssuesCompanion.insert({
    this.internalIssueId = const Value.absent(),
    this.serverIssueId = const Value.absent(),
    required int userServerId,
    this.address = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.status = const Value.absent(),
    this.vote = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryLvl1 = const Value.absent(),
    this.categoryLvl1Description = const Value.absent(),
    this.categoryLvl2 = const Value.absent(),
    this.categoryLvl2Description = const Value.absent(),
    this.categoryLvl2QuestionLabel = const Value.absent(),
    this.categoryLvl3 = const Value.absent(),
    this.categoryLvl3Description = const Value.absent(),
    this.categoryLvl3QuestionLabel = const Value.absent(),
    this.images = const Value.absent(),
    this.assignedStaff = const Value.absent(),
    this.notes = const Value.absent(),
    this.lastUpdate = const Value.absent(),
  }) : userServerId = Value(userServerId);
  static Insertable<Issue> custom({
    Expression<int?>? internalIssueId,
    Expression<int>? serverIssueId,
    Expression<int>? userServerId,
    Expression<String?>? address,
    Expression<double?>? lat,
    Expression<double?>? long,
    Expression<String?>? status,
    Expression<int>? vote,
    Expression<String?>? description,
    Expression<int?>? categoryLvl1,
    Expression<String?>? categoryLvl1Description,
    Expression<int?>? categoryLvl2,
    Expression<String?>? categoryLvl2Description,
    Expression<String?>? categoryLvl2QuestionLabel,
    Expression<int?>? categoryLvl3,
    Expression<String?>? categoryLvl3Description,
    Expression<String?>? categoryLvl3QuestionLabel,
    Expression<String?>? images,
    Expression<int?>? assignedStaff,
    Expression<String?>? notes,
    Expression<DateTime?>? lastUpdate,
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
      if (categoryLvl1Description != null)
        'category_lvl1_description': categoryLvl1Description,
      if (categoryLvl2 != null) 'category_lvl2': categoryLvl2,
      if (categoryLvl2Description != null)
        'category_lvl2_description': categoryLvl2Description,
      if (categoryLvl2QuestionLabel != null)
        'category_lvl2_question_label': categoryLvl2QuestionLabel,
      if (categoryLvl3 != null) 'category_lvl3': categoryLvl3,
      if (categoryLvl3Description != null)
        'category_lvl3_description': categoryLvl3Description,
      if (categoryLvl3QuestionLabel != null)
        'category_lvl3_question_label': categoryLvl3QuestionLabel,
      if (images != null) 'images': images,
      if (assignedStaff != null) 'assigned_staff': assignedStaff,
      if (notes != null) 'notes': notes,
      if (lastUpdate != null) 'last_update': lastUpdate,
    });
  }

  IssuesCompanion copyWith(
      {Value<int?>? internalIssueId,
      Value<int>? serverIssueId,
      Value<int>? userServerId,
      Value<String?>? address,
      Value<double?>? lat,
      Value<double?>? long,
      Value<String?>? status,
      Value<int>? vote,
      Value<String?>? description,
      Value<int?>? categoryLvl1,
      Value<String?>? categoryLvl1Description,
      Value<int?>? categoryLvl2,
      Value<String?>? categoryLvl2Description,
      Value<String?>? categoryLvl2QuestionLabel,
      Value<int?>? categoryLvl3,
      Value<String?>? categoryLvl3Description,
      Value<String?>? categoryLvl3QuestionLabel,
      Value<String?>? images,
      Value<int?>? assignedStaff,
      Value<String?>? notes,
      Value<DateTime?>? lastUpdate}) {
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
      categoryLvl1Description:
          categoryLvl1Description ?? this.categoryLvl1Description,
      categoryLvl2: categoryLvl2 ?? this.categoryLvl2,
      categoryLvl2Description:
          categoryLvl2Description ?? this.categoryLvl2Description,
      categoryLvl2QuestionLabel:
          categoryLvl2QuestionLabel ?? this.categoryLvl2QuestionLabel,
      categoryLvl3: categoryLvl3 ?? this.categoryLvl3,
      categoryLvl3Description:
          categoryLvl3Description ?? this.categoryLvl3Description,
      categoryLvl3QuestionLabel:
          categoryLvl3QuestionLabel ?? this.categoryLvl3QuestionLabel,
      images: images ?? this.images,
      assignedStaff: assignedStaff ?? this.assignedStaff,
      notes: notes ?? this.notes,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (internalIssueId.present) {
      map['internal_issue_id'] = Variable<int?>(internalIssueId.value);
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
    if (categoryLvl1Description.present) {
      map['category_lvl1_description'] =
          Variable<String?>(categoryLvl1Description.value);
    }
    if (categoryLvl2.present) {
      map['category_lvl2'] = Variable<int?>(categoryLvl2.value);
    }
    if (categoryLvl2Description.present) {
      map['category_lvl2_description'] =
          Variable<String?>(categoryLvl2Description.value);
    }
    if (categoryLvl2QuestionLabel.present) {
      map['category_lvl2_question_label'] =
          Variable<String?>(categoryLvl2QuestionLabel.value);
    }
    if (categoryLvl3.present) {
      map['category_lvl3'] = Variable<int?>(categoryLvl3.value);
    }
    if (categoryLvl3Description.present) {
      map['category_lvl3_description'] =
          Variable<String?>(categoryLvl3Description.value);
    }
    if (categoryLvl3QuestionLabel.present) {
      map['category_lvl3_question_label'] =
          Variable<String?>(categoryLvl3QuestionLabel.value);
    }
    if (images.present) {
      map['images'] = Variable<String?>(images.value);
    }
    if (assignedStaff.present) {
      map['assigned_staff'] = Variable<int?>(assignedStaff.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String?>(notes.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime?>(lastUpdate.value);
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
          ..write('categoryLvl1Description: $categoryLvl1Description, ')
          ..write('categoryLvl2: $categoryLvl2, ')
          ..write('categoryLvl2Description: $categoryLvl2Description, ')
          ..write('categoryLvl2QuestionLabel: $categoryLvl2QuestionLabel, ')
          ..write('categoryLvl3: $categoryLvl3, ')
          ..write('categoryLvl3Description: $categoryLvl3Description, ')
          ..write('categoryLvl3QuestionLabel: $categoryLvl3QuestionLabel, ')
          ..write('images: $images, ')
          ..write('assignedStaff: $assignedStaff, ')
          ..write('notes: $notes, ')
          ..write('lastUpdate: $lastUpdate')
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
      'internal_issue_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
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
  final VerificationMeta _categoryLvl1DescriptionMeta =
      const VerificationMeta('categoryLvl1Description');
  @override
  late final GeneratedColumn<String?> categoryLvl1Description =
      GeneratedColumn<String?>('category_lvl1_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl2Meta =
      const VerificationMeta('categoryLvl2');
  @override
  late final GeneratedColumn<int?> categoryLvl2 = GeneratedColumn<int?>(
      'category_lvl2', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl2DescriptionMeta =
      const VerificationMeta('categoryLvl2Description');
  @override
  late final GeneratedColumn<String?> categoryLvl2Description =
      GeneratedColumn<String?>('category_lvl2_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl2QuestionLabelMeta =
      const VerificationMeta('categoryLvl2QuestionLabel');
  @override
  late final GeneratedColumn<String?> categoryLvl2QuestionLabel =
      GeneratedColumn<String?>(
          'category_lvl2_question_label', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl3Meta =
      const VerificationMeta('categoryLvl3');
  @override
  late final GeneratedColumn<int?> categoryLvl3 = GeneratedColumn<int?>(
      'category_lvl3', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl3DescriptionMeta =
      const VerificationMeta('categoryLvl3Description');
  @override
  late final GeneratedColumn<String?> categoryLvl3Description =
      GeneratedColumn<String?>('category_lvl3_description', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _categoryLvl3QuestionLabelMeta =
      const VerificationMeta('categoryLvl3QuestionLabel');
  @override
  late final GeneratedColumn<String?> categoryLvl3QuestionLabel =
      GeneratedColumn<String?>(
          'category_lvl3_question_label', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _imagesMeta = const VerificationMeta('images');
  @override
  late final GeneratedColumn<String?> images = GeneratedColumn<String?>(
      'images', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _assignedStaffMeta =
      const VerificationMeta('assignedStaff');
  @override
  late final GeneratedColumn<int?> assignedStaff = GeneratedColumn<int?>(
      'assigned_staff', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String?> notes = GeneratedColumn<String?>(
      'notes', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _lastUpdateMeta = const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime?> lastUpdate = GeneratedColumn<DateTime?>(
      'last_update', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
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
        categoryLvl1Description,
        categoryLvl2,
        categoryLvl2Description,
        categoryLvl2QuestionLabel,
        categoryLvl3,
        categoryLvl3Description,
        categoryLvl3QuestionLabel,
        images,
        assignedStaff,
        notes,
        lastUpdate
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
    if (data.containsKey('category_lvl1_description')) {
      context.handle(
          _categoryLvl1DescriptionMeta,
          categoryLvl1Description.isAcceptableOrUnknown(
              data['category_lvl1_description']!,
              _categoryLvl1DescriptionMeta));
    }
    if (data.containsKey('category_lvl2')) {
      context.handle(
          _categoryLvl2Meta,
          categoryLvl2.isAcceptableOrUnknown(
              data['category_lvl2']!, _categoryLvl2Meta));
    }
    if (data.containsKey('category_lvl2_description')) {
      context.handle(
          _categoryLvl2DescriptionMeta,
          categoryLvl2Description.isAcceptableOrUnknown(
              data['category_lvl2_description']!,
              _categoryLvl2DescriptionMeta));
    }
    if (data.containsKey('category_lvl2_question_label')) {
      context.handle(
          _categoryLvl2QuestionLabelMeta,
          categoryLvl2QuestionLabel.isAcceptableOrUnknown(
              data['category_lvl2_question_label']!,
              _categoryLvl2QuestionLabelMeta));
    }
    if (data.containsKey('category_lvl3')) {
      context.handle(
          _categoryLvl3Meta,
          categoryLvl3.isAcceptableOrUnknown(
              data['category_lvl3']!, _categoryLvl3Meta));
    }
    if (data.containsKey('category_lvl3_description')) {
      context.handle(
          _categoryLvl3DescriptionMeta,
          categoryLvl3Description.isAcceptableOrUnknown(
              data['category_lvl3_description']!,
              _categoryLvl3DescriptionMeta));
    }
    if (data.containsKey('category_lvl3_question_label')) {
      context.handle(
          _categoryLvl3QuestionLabelMeta,
          categoryLvl3QuestionLabel.isAcceptableOrUnknown(
              data['category_lvl3_question_label']!,
              _categoryLvl3QuestionLabelMeta));
    }
    if (data.containsKey('images')) {
      context.handle(_imagesMeta,
          images.isAcceptableOrUnknown(data['images']!, _imagesMeta));
    }
    if (data.containsKey('assigned_staff')) {
      context.handle(
          _assignedStaffMeta,
          assignedStaff.isAcceptableOrUnknown(
              data['assigned_staff']!, _assignedStaffMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
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
  final String? questionText;
  final int? parentId;
  Category(
      {required this.id,
      required this.description,
      this.questionText,
      this.parentId});
  factory Category.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Category(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      questionText: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}question_text']),
      parentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || questionText != null) {
      map['question_text'] = Variable<String?>(questionText);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int?>(parentId);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      description: Value(description),
      questionText: questionText == null && nullToAbsent
          ? const Value.absent()
          : Value(questionText),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      questionText: serializer.fromJson<String?>(json['question']),
      parentId: serializer.fromJson<int?>(json['parent_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'question': serializer.toJson<String?>(questionText),
      'parent_id': serializer.toJson<int?>(parentId),
    };
  }

  Category copyWith(
          {int? id,
          String? description,
          String? questionText,
          int? parentId}) =>
      Category(
        id: id ?? this.id,
        description: description ?? this.description,
        questionText: questionText ?? this.questionText,
        parentId: parentId ?? this.parentId,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('questionText: $questionText, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, questionText, parentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.description == this.description &&
          other.questionText == this.questionText &&
          other.parentId == this.parentId);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> description;
  final Value<String?> questionText;
  final Value<int?> parentId;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.questionText = const Value.absent(),
    this.parentId = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required int id,
    required String description,
    this.questionText = const Value.absent(),
    this.parentId = const Value.absent(),
  })  : id = Value(id),
        description = Value(description);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<String?>? questionText,
    Expression<int?>? parentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (questionText != null) 'question_text': questionText,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<String?>? questionText,
      Value<int?>? parentId}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      questionText: questionText ?? this.questionText,
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
    if (questionText.present) {
      map['question_text'] = Variable<String?>(questionText.value);
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
          ..write('questionText: $questionText, ')
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
  final VerificationMeta _questionTextMeta =
      const VerificationMeta('questionText');
  @override
  late final GeneratedColumn<String?> questionText = GeneratedColumn<String?>(
      'question_text', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int?> parentId = GeneratedColumn<int?>(
      'parent_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, questionText, parentId];
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
    if (data.containsKey('question_text')) {
      context.handle(
          _questionTextMeta,
          questionText.isAcceptableOrUnknown(
              data['question_text']!, _questionTextMeta));
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

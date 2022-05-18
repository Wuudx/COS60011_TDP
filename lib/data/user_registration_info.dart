class UserRegistrationInfo {
  String mobile;
  String? firstName, lastName, deviceId;
  int points;

  UserRegistrationInfo({
    required this.mobile,
    this.firstName,
    this.lastName,
    this.deviceId,
    this.points = 0,
  });
}

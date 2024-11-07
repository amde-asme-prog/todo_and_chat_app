class UserData {
  String? email;
  String? phoneNumber;
  String? photoURL;
  String? uid;
  String? displayName;

  UserData({
    this.email,
    this.phoneNumber,
    this.photoURL,
    this.uid,
    this.displayName,
  });

  UserData copyWith({
    String? email,
    String? phoneNumber,
    String? photoURL,
    String? uid,
    String? displayName,
  }) {
    return UserData(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoURL: photoURL ?? this.photoURL,
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
    );
  }
}

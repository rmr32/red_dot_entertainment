class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  // String get formattedPhoneNo => EFormatter.formatPhoneNumber(phoneNumber);

  // static AddressModel empty() => AddressModel(
  //     id: '',
  //     name: '',
  //     phoneNumber: '',
  //     street: '',
  //     city: '',
  //     state: '',
  //     postalCode: '',
  //     country: '');

  // Map<String, dynamic> toJson() {
  //   return {
  //     EText.dbUsersAddressID: id,
  //     EText.dbUsersAddressName: name,
  //     EText.dbUsersAddressPhoneNumber: phoneNumber,
  //     EText.dbUsersAddressStreet: street,
  //     EText.dbUsersAddressCity: city,
  //     EText.dbUsersAddressState: state,
  //     EText.dbUsersAddressPostalCode: postalCode,
  //     EText.dbUsersAddressCountry: country,
  //     EText.dbUsersAddressDateTime: DateTime.now(),
  //     EText.dbUsersAddressSelected: selectedAddress,
  //   };
  // }

  // factory AddressModel.fromMap(Map<String, dynamic> data) {
  //   return AddressModel(
  //     id: data[EText.dbUsersAddressID] as String,
  //     name: data[EText.dbUsersAddressName] as String,
  //     phoneNumber: data[EText.dbUsersAddressPhoneNumber] as String,
  //     street: data[EText.dbUsersAddressStreet] as String,
  //     city: data[EText.dbUsersAddressCity] as String,
  //     state: data[EText.dbUsersAddressState] as String,
  //     postalCode: data[EText.dbUsersAddressPostalCode] as String,
  //     country: data[EText.dbUsersAddressCountry] as String,
  //     selectedAddress: data[EText.dbUsersAddressSelected] as bool,
  //     dateTime: (data[EText.dbUsersAddressDateTime] as Timestamp).toDate(),
  //   );
  // }

  // // Factory constructor to create an AddressModel from a DocumentSnapshot
  // factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
  //   final data = snapshot.data() as Map<String, dynamic>;

  //   return AddressModel(
  //     id: snapshot.id,
  //     name: data[EText.dbUsersAddressName] ?? '',
  //     phoneNumber: data[EText.dbUsersAddressPhoneNumber] ?? '',
  //     street: data[EText.dbUsersAddressStreet] ?? '',
  //     city: data[EText.dbUsersAddressCity] ?? '',
  //     state: data[EText.dbUsersAddressState] ?? '',
  //     postalCode: data[EText.dbUsersAddressPostalCode] ?? '',
  //     country: data[EText.dbUsersAddressCountry] ?? '',
  //     dateTime: (data[EText.dbUsersAddressDateTime] as Timestamp).toDate(),
  //     selectedAddress: data[EText.dbUsersAddressSelected] as bool,
  //   );
  // }

  // @override
  // String toString() {
  //   return '$street, $city, $state $postalCode, $country';
  // }
}

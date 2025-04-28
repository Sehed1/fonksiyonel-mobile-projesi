class DeliveryInfo {
  String name = '';
  String surname = '';
  String email = '';
  String phone = '';
  String country = '';
  String street = '';
  String city = '';
  String zipCode = '';

  void saveDeliveryInfo() {
    print(
        'Delivery Info Saved: $name, $surname, $email, $phone, $country, $street, $city, $zipCode');
  }
}

import 'dart:developer';
import 'package:zatcha_code/zatcha_code.dart';

void main() {
  // Example invoice data
  generateZatca(
    sellerName: "Test Shop",
    registrationVAT: "1234",
    timeStamp: "2021-12-01T12:30:00Z",
    totalAmount: "100",
    amountVAT: "15",
  );

  // or this way
  // Example invoice data
  Map<int, String> invoiceData = {
    1: "Test Shop", // Seller name
    2: "1234", // VAT registration number
    3: "2021-12-01T12:30:00Z", // Timestamp
    4: "100.00", // Invoice total amount
    5: "15.00" // VAT total amount
  };

  // Generate TLV string
  String tlvString = generateTlv(invoiceData);
  log('TLV String: $tlvString');

  // Convert TLV string to Base64
  String base64String = tlvToBase64(tlvString);
  log('Base64 String: $base64String');
}

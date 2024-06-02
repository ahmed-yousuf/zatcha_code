library zatcha_code;

import 'dart:convert';
import 'dart:typed_data';

String generateZatca(
    {String sellerName = "",
    String registrationVAT = "",
    String timeStamp = "",
    String totalAmount = "",
    String amountVAT = ""}) {
  Map<int, String> invoiceData = {
    1: sellerName, // Seller name
    2: registrationVAT, // VAT registration number
    3: timeStamp, // Timestamp 2024-05-30T12:30:00Z
    4: totalAmount, // Invoice total amount
    5: amountVAT // VAT total amount
  };

  String tlvString = generateTlv(invoiceData);
  String base64String = tlvToBase64(tlvString);
  return base64String;
}

/// Converts a string to its hexadecimal representation.
String stringToHex(String input) {
  return input.codeUnits
      .map((unit) => unit.toRadixString(16).padLeft(2, '0'))
      .join();
}

/// Generates a TLV string from a map of tag-value pairs.
String generateTlv(Map<int, String> data) {
  StringBuffer tlv = StringBuffer();

  data.forEach((tag, value) {
    String valueHex = stringToHex(value);
    String lengthHex = value.length.toRadixString(16).padLeft(2, '0');
    String tagHex = tag.toRadixString(16).padLeft(2, '0');

    tlv.write(tagHex);
    tlv.write(lengthHex);
    tlv.write(valueHex);
  });

  return tlv.toString();
}

/// Converts a TLV string to a Base64 encoded string.
String tlvToBase64(String tlv) {
  List<int> bytes = [];

  for (int i = 0; i < tlv.length; i += 2) {
    String hexStr = tlv.substring(i, i + 2);
    int byte = int.parse(hexStr, radix: 16);
    bytes.add(byte);
  }

  Uint8List byteArray = Uint8List.fromList(bytes);
  String base64Str = base64Encode(byteArray);

  return base64Str;
}

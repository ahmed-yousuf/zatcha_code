# Zatca Converter

This package provides a straightforward method to convert a TLV string and Base64 string in Dart to generate the Base 64 Zatcha code.


## Features

- Convert a TLV string to its Base64 representation
- Generate TLV strings from a map of tag-value pairs
- Simple and easy-to-use API

## Getting started

To use this package, add `zatcha_code` as a dependency in your `pubspec.yaml` file:
```
dependencies:
  zatcha_code: ^0.0.1
```

## Usage
```
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
  print('TLV String: $tlvString');

  // Convert TLV string to Base64
  String base64String = tlvToBase64(tlvString);
  print('Base64 String: $base64String');
}
```

## stringToHex
```
String stringToHex(String input);
```
## generateTlv
```
generateZatca();
String generateTlv(Map<int, String> data) 
```
## tlvToBase64
```
String tlvToBase64(String tlv);
```

## Additional information

For more details, check out the documentation.

## License

This README.md includes all the necessary information about your package, including usage instructions, API reference, contributing guidelines, and licensing information.


# zatcha_code

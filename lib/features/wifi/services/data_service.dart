import 'dart:convert';
import 'dart:developer';

import '../../../data/data.dart';
import 'models/network.dart';

class DataService {
  Future<List<Network>> fetchNetworks() async {
    try {
      final Map<String, dynamic> json = jsonDecode(wifiJson);

      if (json.containsKey('networks') && json['networks'] is List) {
        final List<dynamic> networks = json['networks'];

        return networks.map((network) {
          if (network
              case {
                'name': final String name,
                'signal': final int signal,
                'isPrivate': final bool isPrivate,
                'isClickable': final bool isClickable,
              }) {
            return Network(
              name: name,
              signal: signal,
              isPrivate: isPrivate,
              isClickable: isClickable,
            );
          } else {
            throw FormatException('Unexpected network format: $network');
          }
        }).toList();
      } else {
        throw FormatException('Unexpected JSON format: $json');
      }
    } catch (e) {
      log('Error in DataService.fetchNetworks: $e');
      rethrow;
    }
  }
}

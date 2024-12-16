import 'dart:convert';

import '../../../data/data.dart';
import 'models/network.dart';

class DataService {
  Future<List<Network>> fetchNetworks() async {
    final Map<String, dynamic> json = jsonDecode(wifiJson);

    if (json case {'networks': List networks}) {
      return networks.map((network) {
        if (network
            case {
              'name': String name,
              'signal': String signal,
              'isPrivate': bool isPrivate,
            }) {
          return Network(name: name, signal: signal, isPrivate: isPrivate);
        } else {
          throw const FormatException('Unexpected network format');
        }
      }).toList();
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

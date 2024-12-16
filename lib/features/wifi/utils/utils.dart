import 'package:flutter/material.dart';

// Determine the icon based on signal strength
IconData getWifiIcon(int signal) {
  return switch (signal) {
    6 => Icons.signal_wifi_4_bar,
    5 => Icons.network_wifi_3_bar,
    4 => Icons.network_wifi_3_bar,
    3 => Icons.network_wifi_2_bar,
    2 => Icons.network_wifi_1_bar,
    _ => Icons.signal_wifi_0_bar
  };
}

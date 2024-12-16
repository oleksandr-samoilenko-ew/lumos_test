class Network {
  final String name;
  final String signal;
  final bool isPrivate;

  Network({required this.name, required this.signal, required this.isPrivate});

  @override
  String toString() {
    return 'Network{name: $name, signal: $signal, isPrivate: $isPrivate}';
  }
}
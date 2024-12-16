class Network {
  final String name;
  final int signal;
  final bool isPrivate;

  Network({required this.name, required this.signal, required this.isPrivate});

  Network copyWith({
    String? name,
    int? signal,
    bool? isPrivate,
  }) {
    return Network(
      name: name ?? this.name,
      signal: signal ?? this.signal,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }

  @override
  String toString() {
    return 'Network{name: $name, signal: $signal, isPrivate: $isPrivate}';
  }
}
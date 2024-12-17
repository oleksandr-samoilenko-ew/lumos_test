class Network {
  final String name;
  final int signal;
  final bool isPrivate;
  final bool isClickable;

  Network({
    required this.name,
    required this.signal,
    required this.isPrivate,
    required this.isClickable,
  });

  Network copyWith({String? name, int? signal, bool? isPrivate, bool? isClickable}) {
    return Network(
      name: name ?? this.name,
      signal: signal ?? this.signal,
      isPrivate: isPrivate ?? this.isPrivate,
      isClickable: isClickable ?? this.isClickable,
    );
  }

  @override
  String toString() {
    return 'Network{name: $name, signal: $signal, isPrivate: $isPrivate, isClickable: $isClickable}';
  }
}

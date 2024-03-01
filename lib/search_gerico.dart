class SearchResult<T> {
  final T objeto;

  final String? placa;
  final String? uui;
  final String? identificacion;
  final int similitudNombre;
  final int similitudPlaca;
  final int similitudUui;
  final int similitudIdentificacion;

  SearchResult({
    required this.objeto,
    this.placa,
    this.uui,
    this.identificacion,
    required this.similitudNombre,
    required this.similitudPlaca,
    required this.similitudUui,
    required this.similitudIdentificacion,
  });

  Map<String, dynamic> toMap() {
    return {
      'objeto': objeto,
      'placa': placa,
      'uui': uui,
      'identificacion': identificacion,
      'similitudNombre': similitudNombre,
      'similitudPlaca': similitudPlaca,
      'similitudUui': similitudUui,
      'similitudIdentificacion': similitudIdentificacion,
    };
  }
}

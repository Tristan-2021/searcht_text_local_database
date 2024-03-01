import 'package:examples/custon_functions.dart';
import 'package:examples/entitu.dart';
import 'package:examples/search_gerico.dart';
import 'package:fuzzywuzzy/algorithms/weighted_ratio.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:fuzzywuzzy/model/extracted_result.dart';

List<SearchResult> filtrarVehiculos({
  required List<Vehiculo> lista,
  required String palabraClave,
  required String Function(Vehiculo) obtenerNombre,
  String Function(Vehiculo)? obtenerPlaca,
  String Function(Vehiculo)? obtenerUui,
  String Function(Vehiculo)? obtenerIdentificacion,
}) {
  List<ExtractedResult<Vehiculo>> coincidenciasNombres = extractAllSorted(
    query: palabraClave,
    choices: lista,
    cutoff: 70,
    ratio: const WeightedRatio(),
    getter: obtenerNombre,
  );

  List<ExtractedResult<Vehiculo>> coincidenciasPlacas = obtenerPlaca != null
      ? extractAllSorted(
          query: palabraClave,
          choices: lista,
          cutoff: 40,
          ratio: TokenSetRatio(),
          getter: obtenerPlaca,
        )
      : [];

  List<ExtractedResult<Vehiculo>> coincidenciasUui = obtenerUui != null
      ? extractAllSorted(
          query: palabraClave,
          choices: lista,
          cutoff: 40,
          ratio: TokenSetRatio(),
          getter: obtenerUui,
        )
      : [];

  List<ExtractedResult<Vehiculo>> coincidenciasIdentificacion =
      obtenerIdentificacion != null
          ? extractAllSorted(
              query: palabraClave,
              choices: lista,
              cutoff: 40,
              ratio: TokenSetRatio(),
              getter: obtenerIdentificacion,
            )
          : [];

  List<SearchResult> resultados = [];

  int obtenerScore(
      List<ExtractedResult<Vehiculo>> coincidencias, Vehiculo objeto) {
    try {
      return coincidencias
          .firstWhere((element) => element.choice == objeto)
          .score;
    } catch (e) {
      return 0; // Manejar la excepción si no se encuentra ninguna coincidencia
    }
  }

  for (int i = 0; i < lista.length; i++) {
    Vehiculo vehiculo = lista[i];
    String? placa = obtenerPlaca != null ? obtenerPlaca(vehiculo) : null;
    String? uui = obtenerUui != null ? obtenerUui(vehiculo) : null;
    String? identificacion =
        obtenerIdentificacion != null ? obtenerIdentificacion(vehiculo) : null;

    int scoreNombre = obtenerScore(coincidenciasNombres, vehiculo);
    int scorePlaca =
        obtenerPlaca != null ? obtenerScore(coincidenciasPlacas, vehiculo) : 0;
    int scoreUui =
        obtenerUui != null ? obtenerScore(coincidenciasUui, vehiculo) : 0;
    int scoreIdentificacion = obtenerIdentificacion != null
        ? obtenerScore(coincidenciasIdentificacion, vehiculo)
        : 0;

    resultados.add(
      SearchResult(
        objeto: vehiculo,
        placa: placa,
        uui: uui,
        identificacion: identificacion,
        similitudNombre: scoreNombre,
        similitudPlaca: scorePlaca,
        similitudUui: scoreUui,
        similitudIdentificacion: scoreIdentificacion,
      ),
    );
  }

  resultados.sort((a, b) {
    int compareNombre = b.similitudNombre.compareTo(a.similitudNombre);
    if (compareNombre != 0) {
      return compareNombre;
    }

    int comparePlaca = b.similitudPlaca.compareTo(a.similitudPlaca);
    if (comparePlaca != 0) {
      return comparePlaca;
    }

    int compareUui = b.similitudUui.compareTo(a.similitudUui);
    if (compareUui != 0) {
      return compareUui;
    }

    return b.similitudIdentificacion.compareTo(a.similitudIdentificacion);
  });

  return resultados.where((resultado) {
    final scoreplate = resultado.similitudNombre;
    final plate = resultado.similitudPlaca;
    final uuid = resultado.similitudUui;
    final id = resultado.similitudIdentificacion;

    return scoreplate > 50 || plate > 50 || uuid > 50 || id > 50;
  }).toList();
}

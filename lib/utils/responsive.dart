import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Clase `Responsive` que proporciona métodos para calcular distancias basadas en porcentajes
/// y dimensiones de dispositivo en una aplicación Flutter.
class Responsive {
  /// Método que devuelve la distancia calculada en función del [percent] proporcionado y
  /// la altura del dispositivo.
  ///
  /// Parámetros:
  /// - [context]: El BuildContext necesario para acceder a MediaQuery.
  /// - [percent]: El porcentaje basado en el cual se calculará la distancia.
  ///
  /// Ejemplo:
  /// Si el dispositivo tiene una altura de 892 y se pasa un [percent] de 50,
  /// el método devuelve 446.
  static double distancePercentFromHeight(
      BuildContext context, double percent) {
    // Altura total del dispositivo (ejemplo: 892).
    double totalHeight = 892;

    // Porcentaje total (utilizado para escalar correctamente).
    double totalPercent = 100;

    // Obtenemos la altura real del dispositivo mediante MediaQuery.
    totalHeight = MediaQuery.of(context).size.height;

    // Cálculo de la distancia utilizando la fórmula.
    return (percent * totalHeight) / totalPercent;
  }

  /// Método que devuelve la distancia calculada en función del [percent] proporcionado y
  /// el ancho del dispositivo.
  ///
  /// Parámetros:
  /// - [context]: El BuildContext necesario para acceder a MediaQuery.
  /// - [percent]: El porcentaje basado en el cual se calculará la distancia.
  ///
  /// Ejemplo:
  /// Si el dispositivo tiene un ancho de 412 y se pasa un [percent] de 50,
  /// el método devuelve 206.
  static double distancePercentFromWidth(BuildContext context, double percent) {
    // Ancho total del dispositivo (ejemplo: 412).
    double totalWidth = 412;

    // Porcentaje total (utilizado para escalar correctamente).
    double totalPercent = 100;

    // Obtenemos el ancho real del dispositivo mediante MediaQuery.
    totalWidth = MediaQuery.of(context).size.width;

    // Cálculo de la distancia utilizando la fórmula.
    return (percent * totalWidth) / totalPercent;
  }

  /// Método que devuelve la distancia basada en la diagonal del dispositivo y el [percent] dado.
  ///
  /// Parámetros:
  /// - [context]: El BuildContext necesario para acceder a MediaQuery.
  /// - [percent]: El porcentaje basado en el cual se calculará la distancia.
  ///
  /// Ejemplo:
  /// Si el dispositivo tiene un ancho de 300 y una altura de 400 (la diagonal sería 500 usando el teorema de Pitágoras),
  /// y se pasa un [percent] de 50, el método devuelve 250.
  static double distancePercentText(BuildContext context, double percent) {
    double c = 412, totalPercent = 100;

    // Obtenemos el ancho y la altura del dispositivo mediante MediaQuery.
    double a = MediaQuery.of(context).size.width;
    double b = MediaQuery.of(context).size.height;

    // Calculamos la diagonal del dispositivo utilizando el teorema de Pitágoras.
    c = math.sqrt(math.pow(a, 2) + math.pow(b, 2));
    // Teorema =
    // cˆ2 = aˆ2 + bˆ2
    // c = longitud hipotenusa
    // a,b = longitud lados

    // Cálculo de la distancia utilizando la fórmula.
    return (percent * c) / totalPercent;
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationController extends ChangeNotifier {
  double lat = 0.0;
  double lon = 0.0;
  String erro = "";

  LocationController();

  Future<Position> getPosicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error(
          "Você deve habilitar a localização no seu smartphone.");
    }

    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error(
            "Você deve autorizar a localização no seu smartphone.");
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error(
          "Você deve autorizar a localização no seu smartphone.");
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String> getMinimumDistanceMarket(
      Future<Position> currentPosition) async {
    Position posicaoAtual = await currentPosition;
    double latitude = posicaoAtual.latitude;
    double longitude = posicaoAtual.longitude;

    final apiKey = 'AIzaSyA28tKLZQNbPBybcV-HQwldHKyb2hc4cSs';
    final apiUrl = 'https://maps.googleapis.com/maps/api/distancematrix/json';
    final origin =
        "Tozetto Jardim Carvalho"; //se vc está no emulador, é só colocar o lugar que vc quiser, desde que seja em pg (ou no brasil, pelo menos)
    //final origin = '$latitude,$longitude'; //para testar no dispositivo físico. aqui realmente pega a localização
    final destinations = [
      "UTFPR - Ponta Grossa",
      "UEPG - Universidade Estadual de Ponta Grossa",
      "UEPG - Campus de Uvaranas"
    ];

    final url =
        '$apiUrl?units=metric&origins=$origin&destinations=${destinations.join('|')}&key=$apiKey';

    print(origin);
    print(destinations);

    //solicitação para a API
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List<int> distances = [];

      final elements = data['rows'][0]['elements'];
      for (final element in elements) {
        final distanceValue = element['distance']['value'];
        distances.add(distanceValue);
      }

      print(distances);

      return menorDistancia(distances);
    } else {
      throw Exception('Erro ao obter os dados da API de distância');
    }
  }

  String menorDistancia(List<int> distances) {
    if (distances[0] < distances[1] && distances[0] < distances[2])
      return "UTFPR";
    else if (distances[1] < distances[0] && distances[1] < distances[2])
      return 'UEPG';
    else if (distances[2] < distances[0] && distances[2] < distances[1])
      return 'CAMPUS';
    else
      return 'teste';
  }
}

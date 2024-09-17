void main() {
  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true; 
  final abilities = ['impostor','Transformación',''];
  final sprites = <String>['ditto/front.png','ditto/back.png'];

  print(""" El pockemon que elejiste es: $pokemon
  ------------------------------------------------
  La estadistica de $pokemon son:
  vida (HP): $hp
  Estatus de vida: $isAlive
  Habilidaes: $abilities
  Imagen: $sprites
  """);
}

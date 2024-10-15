void main() {
  
  // Nos suscribimos al Stream que emite números usando el método .listen.
  // Cuando el Stream emite un valor, se ejecuta la función de callback que imprime el valor.
  emitNumber()
    .listen( (int value) {
      // Cada valor emitido por el Stream se imprime aquí
      print( 'Stream value: $value' );
    }); 
}


// Función generadora asíncrona que emite un Stream de enteros
Stream<int> emitNumber() async* {
  
  // Definimos una lista de valores que queremos emitir
  final valuesToEmit = [1, 2, 3, 4, 5];
  
  // Iteramos sobre cada valor de la lista
  for (int i in valuesToEmit) {
    // Esperamos un segundo antes de emitir cada valor, simulando una espera asíncrona
    await Future.delayed(const Duration(seconds: 1));
    
    // El operador 'yield' emite el valor actual del ciclo
    yield i;
  }
}

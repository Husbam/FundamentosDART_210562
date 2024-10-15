void main() {
  
  // Llamamos a la función emitNumbers, que devuelve un Stream de enteros.
  // Nos suscribimos al Stream usando el método .listen para recibir los valores emitidos.
  emitNumbers().listen( (value) {
    // Cada vez que el Stream emita un nuevo valor, este bloque se ejecuta.
    // Imprimimos el valor recibido desde el Stream.
    print('Stream value: $value');
  });
  
} 


// Función que crea un Stream de enteros que emite valores cada segundo.
Stream<int> emitNumbers() {
  
  // Creamos un Stream usando Stream.periodic, que emite un valor cada segundo.
  // La función recibe un callback que retorna el valor que será emitido por el Stream.
  // Este Stream emitirá un número cada segundo (iniciando desde 0) y luego lo toma hasta 5 emisiones.
  return Stream.periodic( const Duration(seconds: 1), (value) {
    // Cada vez que el Stream emita un nuevo valor, este valor será incrementado automáticamente.
    return value;
  }).take(5); // Limitamos el Stream a emitir solo 5 valores, luego de eso se completa.
  
}

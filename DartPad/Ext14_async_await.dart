void main() async {
  // Imprime el mensaje inicial del programa
  print('Inicio del programa');
  
  // Usamos try-catch para manejar posibles errores durante la ejecución asíncrona
  try {
    // "await" detiene la ejecución de esta línea hasta que httpGet termine su tarea
    // y devuelva un valor o lance un error.
    final value = await httpGet('https://fernando-herrera.com/cursos');
    
    // Si la petición fue exitosa, imprimimos el resultado
    print( value );
    
  } catch (err) {
    // Si ocurre un error, este bloque lo captura e imprime el mensaje de error
    print('Tenemos un error: $err');
  }
  
  // Este mensaje se imprime después de que se completa la ejecución de la función async,
  // ya sea que haya ocurrido un error o no.
  print('Fin del programa');
}


Future<String> httpGet(String url) async {
  // Simula una petición que tarda 1 segundo en completarse
  await Future.delayed(const Duration(seconds: 1));
  
  // Lanzamos un error para simular que la petición falló
  throw 'Error en la petición';
  
  // Si el error no fuera lanzado, aquí se devolvería el valor de la petición.
  // return 'Tenemos un valor de la petición';
}

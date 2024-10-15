void main() {
  // Imprime el mensaje inicial del programa
  print('Inicio del programa');
  
  // Llamada a la función httpGet que simula una petición HTTP
  // Esta función devuelve un "Future", que es una promesa de que algo sucederá en el futuro.
  // Se usa "then" para decir qué hacer cuando el Future se complete exitosamente (cuando haya respuesta).
  httpGet('https://fernando-herrera.com/cursos')
    .then( 
      (value) {
        // Si la petición fue exitosa, este bloque se ejecuta e imprime el resultado
        print( value );
      }
    )
    // Si ocurre algún error durante la petición (por ejemplo, si el servidor no responde),
    // este bloque lo captura y muestra el mensaje de error.
    .catchError( (err) {
      print('Error: $err');
    });

  // Imprime este mensaje inmediatamente, no espera a que la función httpGet termine.
  // Esto demuestra que el programa sigue ejecutando mientras espera la respuesta.
  print('Fin del programa');
}

// Función que simula una petición HTTP a la URL que recibe como argumento
Future<String> httpGet( String url ) {
  
  // Simula una petición que tarda 1 segundo en completarse usando Future.delayed
  return Future.delayed( const Duration(seconds: 1), () {
    
    // Simula un error en la petición lanzando una excepción
    throw 'Error en la petición http';
    
    // Este código está comentado, pero si se descomenta, la función devolvería
    // una respuesta exitosa en lugar de lanzar un error.
    // return 'Respuesta de la petición http';
    
  });
}

void main() async {
  // Imprime el mensaje inicial del programa
  print('Inicio del programa');
  
  // Intentamos ejecutar la solicitud dentro de un bloque try-catch
  try {
    // Utilizamos await para esperar el resultado de la función httpGet
    final value = await httpGet('https://fernando-herrera.com/cursos');
    
    // Si la petición es exitosa, imprime el valor con un mensaje de éxito
    print( 'éxito: $value' );
    
  // Captura de excepciones específicas de tipo Exception
  } on Exception catch(err) {
    // Si se lanza una Exception (como ocurre en httpGet), este bloque lo captura
    print('Tenemos una Exception: $err');
    
  // Captura cualquier otro tipo de error o excepción que no sea de tipo Exception
  } catch (err) {
    // Si se lanza un error genérico o no manejado en el bloque anterior
    print('OOP!! algo terrible pasó: $err');
    
  // El bloque finally siempre se ejecuta, ocurra o no un error
  } finally {
    // Aquí se puede liberar recursos, cerrar conexiones o simplemente dar un aviso
    print('Fin del try y catch');
  }
  
  // Este mensaje se imprime después de que todo el try-catch se complete
  print('Fin del programa');
}


Future<String> httpGet( String url ) async {
  // Simulamos una espera de 1 segundo, como si estuviéramos haciendo una solicitud HTTP
  await Future.delayed( const Duration(seconds: 1));
  
  // Lanzamos una excepción específica con un mensaje, simulando un error en la solicitud
  throw Exception('No hay parámetros en el URL');
  
  //   throw 'Error en la petición';, pero si no hubiera una excepción, aquí se devolvería un valor exitoso.
  // return 'Tenemos un valor de la petición';
}

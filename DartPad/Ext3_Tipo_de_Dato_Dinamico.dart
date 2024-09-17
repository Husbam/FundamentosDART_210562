void main() {
  //Practica 05: Tipo de Dato: Dinamico (Dynamic -Comodin)
  
  //Se puede declarar sin inicializar
  dynamic errorMessage ;
  
  print(""" El valor inicial de errorMessage es: $errorMessage
  por defecto permite establecer valores nulos""");
  
  //Ahora le asiganamos un valor String
  errorMessage = "El usuario y la contraseña no conciden.";
    print("""------------------------------------------------ 
  El nuevo valor de errorMessage es: $errorMessage
  En este caso fue asignado un String""");
  
  //Pero al ser dinamico le podemos asignar un entero
  errorMessage = 404;
 
  print("""------------------------------------------------ 
  El nuevo valor de errorMessage es: $errorMessage
  En algunios sitemas de errores son controlados por un codigo numerico""");
  
   //Pero al ser dinamico le podemos asignar un booleano
  errorMessage = false;
    print("""------------------------------------------------ 
  El nuevo valor de errorMessage es: $errorMessage
  Cuando el sistema funciona correctamebte el mensaje de error puede ser FALSO""");

  errorMessage = [800,404,500,502,505];
  print("""------------------------------------------------ 
  El nuevo valor de errorMessage es: $errorMessage
  En caso de quie eol sistema detecte varios errores podra agregarlos a una Lista""");

  errorMessage = {125,'usuario no encontrado',true,-1025.16,'A'};
  print("""------------------------------------------------ 
  El nuevo valor de errorMessage es: $errorMessage
  o incluso como un conjunto (SET) de valores """);

  errorMessage = () => 5;
  print("""------------------------------------------------ 
  El nuevo valor de errorMessage es: $errorMessage
  Que en este caso es el resultado de una funcion Flecha """);
}

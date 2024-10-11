// Enum para Género
enum Genero { M, F, NB }

// Enum para Grupo Sanguíneo
enum GrupoSanguineo {
    APositivo,
    ANegativo,
    BPositivo,
    BNegativo,
    OPositivo,
    ONegativo,
    ABPositivo,
    ABNegativo,
}

// Enum para Estatus Médico
enum EstatusVida { Vivo, Finado, Coma, Vegetativo }

// Clase abstracta Persona
abstract class Persona {
    String nombre;
    String primerApellido;
    String? segundoApellido;
    Genero genero;
    GrupoSanguineo grupoSanguineo;
    DateTime fechaNacimiento;
    bool estaActivo;
    DateTime fechaRegistro;

    Persona({
        required this.nombre,
        required this.primerApellido,
        this.segundoApellido,
        required this.genero,
        required this.grupoSanguineo,
        required this.fechaNacimiento,
        this.estaActivo = true,
        DateTime? fechaRegistro,
    }) : fechaRegistro = fechaRegistro ?? DateTime.now();

    @override
    String toString() {
        String estado = estaActivo ? "Activo" : "Inactivo";
        return """
               -----------------------------------
               DATOS DE LA PERSONA
               -----------------------------------
               Nombre: $nombre $primerApellido ${segundoApellido ?? ''}
               Género: ${genero.toString().split('.').last}
               Grupo Sanguíneo: ${grupoSanguineo.toString().split('.').last.replaceAll('Positivo', '+').replaceAll('Negativo', '-')}
               Fecha de nacimiento: ${fechaNacimiento.day.toString().padLeft(2, '0')}/${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}
               Estatus: $estado
               Fecha de Registro: ${fechaRegistro.day.toString().padLeft(2, '0')}/${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} ${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}:${fechaRegistro.second.toString().padLeft(2, '0')}
               ------------------------------------
               """;
    }
}

// Interfaz Defuncion
abstract class Defuncion {
    void registrarDefuncion();
}

// Clase Paciente que implementa la interfaz Defuncion
class Paciente extends Persona implements Defuncion {
    String nss;
    String tipoSeguro;
    EstatusVida estatusVida;
    DateTime? fechaAlta;
    DateTime? fechaUltimaCita;
    DateTime? fechaModificacion; // Nueva fecha de modificación

    Paciente({
        required String nombre,
        required String primerApellido,
        String? segundoApellido,
        required Genero genero,
        required GrupoSanguineo grupoSanguineo,
        required DateTime fechaNacimiento,
        required this.nss,
        required this.tipoSeguro,
        this.estatusVida = EstatusVida.Vivo,
        this.fechaUltimaCita,
        DateTime? fechaAlta,
        DateTime? fechaRegistro,
        this.fechaModificacion,
        bool estaActivo = true,
    })  : fechaAlta = fechaAlta,
    super(
        nombre: nombre,
        primerApellido: primerApellido,
        segundoApellido: segundoApellido,
        genero: genero,
        grupoSanguineo: grupoSanguineo,
        fechaNacimiento: fechaNacimiento,
        estaActivo: estaActivo,
        fechaRegistro: fechaRegistro,
    );

    @override
    String toString() {
        return super.toString() + """
               -----------------------------------
               DATOS DEL PACIENTE
               -----------------------------------
               NSS: $nss
               Tipo de Seguro: $tipoSeguro
               Estatus Vida: ${estatusVida.toString().split('.').last}
               Fecha de Alta: ${fechaAlta != null ? '${fechaAlta!.day.toString().padLeft(2, '0')}/${fechaAlta!.month.toString().padLeft(2, '0')}/${fechaAlta!.year} ${fechaAlta!.hour.toString().padLeft(2, '0')}:${fechaAlta!.minute.toString().padLeft(2, '0')}:${fechaAlta!.second.toString().padLeft(2, '0')}' : 'No disponible'}
               Fecha Última Cita: ${fechaUltimaCita != null ? '${fechaUltimaCita!.day.toString().padLeft(2, '0')}/${fechaUltimaCita!.month.toString().padLeft(2, '0')}/${fechaUltimaCita!.year} ${fechaUltimaCita!.hour.toString().padLeft(2, '0')}:${fechaUltimaCita!.minute.toString().padLeft(2, '0')}:${fechaUltimaCita!.second.toString().padLeft(2, '0')}' : 'No disponible'}
               Fecha de Modificación: ${fechaModificacion != null ? '${fechaModificacion!.day.toString().padLeft(2, '0')}/${fechaModificacion!.month.toString().padLeft(2, '0')}/${fechaModificacion!.year} ${fechaModificacion!.hour.toString().padLeft(2, '0')}:${fechaModificacion!.minute.toString().padLeft(2, '0')}:${fechaModificacion!.second.toString().padLeft(2, '0')}' : 'No disponible'}
               Fecha de Registro: ${fechaRegistro.day.toString().padLeft(2, '0')}/${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} ${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}:${fechaRegistro.second.toString().padLeft(2, '0')}
               ------------------------------------
               """;
    }

    @override
    void registrarDefuncion() {
        estatusVida = EstatusVida.Finado;
        estaActivo = false;
    }
}

// Admon de Pacientes
class AdmonPacientes {
    List<Paciente> pacientes = [];

    void crearPaciente(Paciente paciente) {
        pacientes.add(paciente);
    }

    void mostrarPacientes() {
        if (pacientes.isEmpty) {
            print('No hay pacientes registrados.');
        } else {
            pacientes.forEach((paciente) => print(paciente));
        }
    }

    Paciente? consultarPaciente(String nss) {
        try {
            return pacientes.firstWhere(
                       (paciente) => paciente.nss == nss,
                   );
        } catch (e) {
            return null;
        }
    }

    void actualizarPaciente(String nss, Paciente nuevoPaciente) {
        for (var i = 0; i < pacientes.length; i++) {
            if (pacientes[i].nss == nss) {
                pacientes[i] = nuevoPaciente;
                break;
            }
        }
    }

    void eliminarPaciente(String nss) {
        pacientes.removeWhere((p) => p.nss == nss);
    }
}

// Casos de prueba 1
void main() {
    final admon = AdmonPacientes();

    // Caso 1: Paciente registrado hoy
    final paciente1 = Paciente(
                          nombre: "Ana",
                          primerApellido: "Gonzalez",
                          genero: Genero.F,
                          grupoSanguineo: GrupoSanguineo.BPositivo,
                          fechaNacimiento: DateTime(1995, 5, 12),
                          nss: "1122334455",
                          tipoSeguro: "Privado",
                          fechaRegistro: DateTime.now(),
                      );
    admon.crearPaciente(paciente1);
    print(paciente1);

    // Caso 2: Paciente que fue trabajador del hospital
    final paciente2 = Paciente(
                          nombre: "Luis",
                          primerApellido: "Ramirez",
                          genero: Genero.M,
                          grupoSanguineo: GrupoSanguineo.OPositivo,
                          fechaNacimiento: DateTime(1985, 7, 24),
                          nss: "5566778899",
                          tipoSeguro: "Seguro Social",
                          fechaRegistro: DateTime(2023, 12, 1, 11, 05, 16), // Registro anterior
                          fechaModificacion: DateTime(2024, 4, 10, 17, 02, 28), // Fecha de modificación posterior
                          fechaUltimaCita: DateTime(2024, 4, 10, 17, 02, 28),
                      );
    admon.crearPaciente(paciente2);
    print(paciente2);

    // Caso 3: Paciente fallecido
    final paciente3 = Paciente(
                          nombre: "Maria",
                          primerApellido: "Lopez",
                          genero: Genero.F,
                          grupoSanguineo: GrupoSanguineo.APositivo,
                          fechaNacimiento: DateTime(1957, 6, 14),
                          nss: "9988776655",
                          tipoSeguro: "Seguro Social",
                          fechaUltimaCita: DateTime(2024, 1, 10, 09, 45, 36),
                          fechaModificacion: DateTime(2024, 3, 12, 22, 17, 36), // Fecha de modificación posterior
                          fechaRegistro: DateTime(2023, 3, 12, 22, 17, 36),
                      );
    admon.crearPaciente(paciente3);
    paciente3.registrarDefuncion();
    print(paciente3);
}

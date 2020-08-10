import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia= new PreferenciasUsuario._internal();


  PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  SharedPreferences _prefs;

  initPrefs()async{
    _prefs= await SharedPreferences.getInstance();
  }

  //ninguna de estas propiedades se usa
 /*  bool _colorSecundario;
  int _genero;
  String _nombre;
 */
 //get y set del genero
 get genero{
   return _prefs.getInt('genero') ?? 1;
 }

 set genero(int value){
    _prefs.setInt('genero', value);
 }

 //get y set del color secundario
 get colorSecundario{
   return _prefs.getBool('colorSecundario') ?? false;
 }

 set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
 }
 //get y set del nombre de usuario
 get nombreUsuario{
   return _prefs.getString('nombre') ?? '';
 }

 set nombreUsuario(String value){
    _prefs.setString('nombre', value);
 }


   //get y set de la ultima pagina
 get ultimaPagina{
   return _prefs.getString('ultimaPagina') ?? 'home';
 }

 set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
 }




}
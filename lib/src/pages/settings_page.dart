import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shared_prefs/preferencias_usuarios.dart';
import 'package:preferenciasusuarioapp/widgets/menu_widget.dart';


class SettigsPage extends StatefulWidget {
  
  static final String routeName= 'settings';

  @override
  _SettigsPageState createState() => _SettigsPageState();
}

class _SettigsPageState extends State<SettigsPage> {


  bool _colorSecundario=true;
  int _genero;
  String _nombre='Pedro';

  TextEditingController _textController;

  final prefs= new PreferenciasUsuario();

  @override
  void initState()  {
   
    super.initState();

    prefs.ultimaPagina= SettigsPage.routeName;

    this._genero= prefs.genero;
    this._colorSecundario=prefs.colorSecundario;
    this._nombre=prefs.nombreUsuario;
    _textController= new TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int valor){
  
    prefs.genero=valor;
      
    _genero=valor;
    setState(() {
      
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.colorSecundario) ? Colors.teal :Colors.blue,

        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body:ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value){
              _colorSecundario=value;
              this.prefs.colorSecundario=value;
              setState(() {
                
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
            
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged:_setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0 ),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefóno'
              ),
              onChanged: (value){
                prefs.nombreUsuario=value;
              },
            ),
          )
        ],
      )
    );
  }
}
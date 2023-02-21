import 'package:bloco_notas/data/bloco_dao.dart';
import 'package:bloco_notas/service/notification_service.dart';
import 'package:flutter/material.dart';

class BlocoNotas extends StatefulWidget {
  const BlocoNotas({super.key});

  @override
  State<BlocoNotas> createState() => _BlocoNotasState();
}

class _BlocoNotasState extends State<BlocoNotas> {
    String anotacaoRecuperada = '';

  
  @override
  Widget build(BuildContext context) {
    TextEditingController anotacaoController = TextEditingController();

    return Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 100,
                  child: TextField(
                    controller: anotacaoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Digite sua Anotação aqui" 
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {
                BlocoDAO().save(anotacaoController.text);
                NotificationService().showNotification(title: 'Deu certo!', body: 'Nova anotação foi salva');
              }, child: Text('Salvar Anotação')),
              ElevatedButton(onPressed: ()async {
                List<String> anotacoes = await BlocoDAO().find(anotacaoController.text);
                setState((){
                  anotacaoRecuperada = anotacoes[0];
                });

              }, child: Text('Mostrar Anotação')),
              ElevatedButton(onPressed: (){
                DateTime now = DateTime.now();
                DateTime date = DateTime(now.year,now.month,now.day);
                anotacaoRecuperada = '$date - $anotacaoRecuperada';
                setState(() {
                  
                });
              }, child: Text('Adicionar Data')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(anotacaoRecuperada),),
              )
            ],
          ),
        );
  }
}

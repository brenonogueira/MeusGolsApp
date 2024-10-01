import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

class BackupDatabase extends StatefulWidget {
  @override
  _BackupDatabaseState createState() => _BackupDatabaseState();
}

class _BackupDatabaseState extends State<BackupDatabase> {
 Future<void> checkPermissionStatus() async {
  var status = await Permission.storage.status;

  if (status.isPermanentlyDenied) {
    // Redireciona o usuário para as configurações do aplicativo para habilitar manualmente
    openAppSettings();
  }
}

Future<void> adjustFilePermissions(String filePath) async {
  try {
    File file = File(filePath);
    // Verifique se o arquivo existe
    if (await file.exists()) {
      // Ajustar permissões se necessário (para Linux/Unix, Windows não suporta esse método)
      Process.run('chmod', ['644', filePath]).then((result) {
        print("Permissões ajustadas para: $filePath");
      });
    }
  } catch (e) {
    print("Erro ao ajustar permissões: $e");
  }
}

  Future<void> copyDatabaseFile() async {
    try {
      checkPermissionStatus();
    // Solicitar permissão de armazenamento
  
      
      // 1. Obter o caminho do banco de dados (armazenado no diretório do aplicativo)
      String databasesPath = await getDatabasesPath();
      String dbPath = join(databasesPath, 'MYDb.db');  // Nome do seu banco de dados

      // 2. Verificar se o banco de dados existe
      bool dbExists = await File(dbPath).exists();
      if (!dbExists) {
        throw Exception("Banco de dados não encontrado!");
      }

      // 3. Obter o diretório de Downloads (armazenamento externo)
      Directory? downloadsDir = await getExternalStorageDirectory();
      if (downloadsDir == null) {
        throw Exception("Falha ao acessar o diretório de Downloads");
      }

      String destinationPath = join(downloadsDir.path, 'backup_seu_banco.db');

      // 4. Copiar o banco de dados para a pasta de Downloads
      File sourceFile = File(dbPath);
      await sourceFile.copy(destinationPath);

      adjustFilePermissions(destinationPath);

      print("Banco de dados copiado para: $destinationPath");
    
  } catch (e) {
    print("Erro ao copiar banco de dados: $e");
  }
  }

  @override
  void initState() {
    super.initState();
    copyDatabaseFile(); // Chama a função ao iniciar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backup do Banco de Dados'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await copyDatabaseFile();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Backup do banco de dados realizado!')));
          },
          child: Text('Fazer Backup do Banco de Dados'),
        ),
      ),
    );
  }
}

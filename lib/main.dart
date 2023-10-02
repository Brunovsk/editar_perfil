// lib/main.dart
import 'package:flutter/material.dart';
import 'package:ativ/widgets/profile_form.dart';
import 'package:ativ/models/user_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil do Usuário',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _updateUserProfile(UserProfile userProfile) {
    // Implemente a lógica para atualizar o perfil do usuário aqui
    // Por exemplo, você pode enviar os dados para um servidor.
    // Exibir feedback ao usuário, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProfileForm(
          userProfile: UserProfile(), // Crie uma instância vazia de UserProfile
          onSubmit: _updateUserProfile,
        ),
      ),
    );
  }
}

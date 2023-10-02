import 'package:flutter/material.dart';
import 'package:ativ/models/user_profile.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileDetailsScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (userProfile.profileImage != null)
              CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(userProfile.profileImage!),
              ),
            const SizedBox(height: 20),
            Text('Nome: ${userProfile.fullName}'),
            Text('Data de Nascimento: ${userProfile.birthDate.toString()}'),
            Text('Cidade: ${userProfile.city}'),
            Text('País: ${userProfile.country}'),
            Text('Interesses: ${userProfile.interests}'),
            Text('Idioma Preferido: ${userProfile.preferredLanguage}'),
            Text(
                'Notificações por Email: ${userProfile.emailNotifications ? 'Sim' : 'Não'}'),
          ],
        ),
      ),
    );
  }
}

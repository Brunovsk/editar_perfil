import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ativ/models/user_profile.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ProfileForm extends StatefulWidget {
  final Function(UserProfile) onSubmit;
  final UserProfile userProfile;
  
  const ProfileForm({super.key, required this.onSubmit, required this.userProfile});

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final UserProfile _userProfile = UserProfile();

void _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        widget.userProfile.profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Campos obrigatórios
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nome Completo'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório.';
              }
              return null;
            },
            onSaved: (value) {
              _userProfile.fullName = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Data de Nascimento (dd/mm/yyyy)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório.';
              }
              if (!_isDateValid(value)) {
                return 'Formato de data inválido. Use dd/mm/yyyy';
              }
              return null;
            },
            onSaved: (value) {
              _userProfile.birthDate = _parseDate(value!);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Cidade'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório.';
              }
              return null;
            },
            onSaved: (value) {
              _userProfile.city = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'País de Residência'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório.';
              }
              return null;
            },
            onSaved: (value) {
              _userProfile.country = value!;
            },
          ),
          // Campos opcionais

          

          TextFormField(
            decoration: const InputDecoration(labelText: 'Idioma'),
            onSaved: (value) {
              _userProfile.language = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Interesses'),
            onSaved: (value) {
              _userProfile.interests = value!;
            },
          ),
          SwitchListTile(
            title: const Text('Receber Notificações por Email'),
            value: _userProfile.emailNotifications,
            onChanged: (value) {
              setState(() {
                _userProfile.emailNotifications = value;
              });
            },
          ),
          // Outros campos (preferências, imagem de perfil, etc.)
          ElevatedButton(
            onPressed: _getImage,
            child: const Text('Selecionar Foto'),
          ),

          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Atualizar'),
          ),
        ],
      ),
    );
  }

  bool _isDateValid(String date) {
    const datePattern = r'^\d{2}/\d{2}/\d{4}$';
    final RegExp regex = RegExp(datePattern);
    if (!regex.hasMatch(date)) {
      return false;
    }

    try {
      final parsedDate = DateFormat('dd/MM/yyyy').parseStrict(date);
      return true;
    } catch (e) {
      return false;
    }
  }

  DateTime _parseDate(String date) {
    return DateFormat('dd/MM/yyyy').parse(date);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_userProfile);
    }
  }
}

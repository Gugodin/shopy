import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';
import '../../../../../core/core.dart';
import '../../presentation.dart';

@RoutePage()
class ProductsListScreen extends ConsumerStatefulWidget {
  const ProductsListScreen({super.key});

  @override
  ConsumerState<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends ConsumerState<ProductsListScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController(text: 'testuser-ex');
  final TextEditingController _passwordController = TextEditingController(text: 'password123');


  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      
    }
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Escuchamos los cambios en el estado de la autenticación


    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  title: 'User',
                  controller: _userController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Password',
                  controller: _passwordController,
                ),
                const SizedBox(height: 24),
                CustomButton(
                    expands: true,
                    title: 'Login',
                    loading: false,
                    onTap: _login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
    const EmailTextField({
      super.key,
    });
  
    @override
    Widget build(BuildContext context) {
      return TextFormField(
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          label: const Text('Your   Email'),
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: 'Enter your email',
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(15)
              ),
        ),
      );
    }
  }
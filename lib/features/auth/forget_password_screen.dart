import 'package:ebook_app/features/app_colors.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // ------------ Variables start------------
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ------------ Variables end------------

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          'Forget Password',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.textColor,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: _formKey,

                      child: Column(
                        children: [
                          const SizedBox(height: 60),
                          Text(
                            'Enter your Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: AppColors.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'we‘ll send you a verification code',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.textColor1,
                            ),
                          ),
                          const SizedBox(height: 48),

                          // ------------ Email Address field start------------
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email Address',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF14304A),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                validator: _emailValidator,

                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                cursorRadius: const Radius.circular(12),
                                cursorColor: AppColors.textColor,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Email',
                                  hintStyle: TextStyle(
                                    color: AppColors.hintColor.withOpacity(0.5),
                                    fontSize: 14,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.hintColor.withOpacity(
                                        .06,
                                      ),
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.textColor.withOpacity(
                                        0.2,
                                      ),
                                      width: 2.0,
                                    ),
                                  ),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedErrorBorder:
                                      const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
                                        ),
                                      ),
                                  fillColor: const Color(0xFFCAF0F8),
                                ),
                              ),
                            ],
                          ),

                          // ------------ Email Address field end ------------
                          const SizedBox(height: 32),

                          // ------------ Login button start------------
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  print("Form Valid ✅");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Send Code',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          // ------------ Login button end------------
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

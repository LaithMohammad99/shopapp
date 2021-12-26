import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_laith/component/components.dart';
import 'package:shop_app_laith/cubit/cubit.dart';
import 'package:shop_app_laith/cubit/states.dart';
import 'package:shop_app_laith/moduels/shop_app/shop_regster_Screen/shop_regster_screen.dart';
import 'package:shop_app_laith/shaerd/diohelper/diohelper.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('login now to browse our hot offers ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey)),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                            obText: false,
                            label: 'email Address',
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'pleas enter youer email address';
                              }
                            },
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            preIcon: Icons.email_outlined),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            onSubmit: (String value) {
                              if (formKey.currentState!.validate()) {
                                return ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            obText: ShopLoginCubit.get(context).isPassword,
                            label: 'password ',
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'pleas enter youer password ';
                              }
                            },
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            preIcon: Icons.lock_open_outlined,
                            suFix: ShopLoginCubit.get(context).suffix,

                            suffpreesd: () {
                              ShopLoginCubit.get(context).changPassword();
                            }),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }

                            },
                            text: 'Login',
                            isUpperCase: true),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have  an account ?'),
                            TextButton(
                              onPressed: () {
                                navigatTo(context, RegsterScreen());
                              },
                              child: Text('Regster'.toUpperCase()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/Utils/colors.dart';
import 'package:food_app/config/size_config/size_config.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/auth/provider/auth_providers.dart';
import 'package:food_app/core/auth/widgets/login_button.dart';
import 'package:provider/provider.dart';

class EmailAuthScreen extends StatefulWidget {
  static const routeName = '/emailAuth';

  @override
  _EmailAuthScreenState createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen>
    with SingleTickerProviderStateMixin {
  final SizeConfig _config = SizeConfig();

  final GlobalKey<FormState> _formKey = GlobalKey();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  String _email = '';
  bool _isValid = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _validate() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      // Invalid!
      setState(() => _isValid = true);
    }
  }

  void _clearField() {
    FocusScope.of(context).unfocus();
    _emailController.clear();
    _isValid = false;
  }

  void dismissFocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.LM_BACKGROUND_GREY1,
        appBar: null,
        body: Consumer<Auth>(
          builder: (context, loginStore, _) {
            return Observer(
              builder: (_) => Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: AppColor.LM_BACKGROUND_GREY1,
                  key: _scaffoldKey,
                  body: Form(
                    key: _formKey,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          bottom: 0,
                          right: 0,
                          // top: (MediaQuery.of(context).viewInsets.bottom > 0.0)
                          //     ? (_config.uiHeightPx * 0.0000).toDouble()
                          //     : (_config.uiHeightPx * 0.1).toDouble(),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: _config.sh(80).toDouble(),
                                  child:
                                      Image.asset('assets/images/bobtail.jpg')),
                              SizedBox(
                                  height: (MediaQuery.of(context)
                                              .viewInsets
                                              .bottom >
                                          0.0)
                                      ? (_config.uiHeightPx * 0.001).toDouble()
                                      : (_config.uiHeightPx * 0.10).toDouble()),
                              Card(
                                elevation: 0,
                                color: AppColor.LM_BACKGROUND_GREY1,
                                child: SizedBox(
                                  width: SizeConfig.screenWidthDp,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SizedBox(
                                            height: _config.sh(70).toDouble(),
                                            width: SizeConfig.screenWidthDp! *
                                                0.94,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0, bottom: 10),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                                textDirection:
                                                    TextDirection.ltr,
                                                textAlign: TextAlign.center,
                                                textAlignVertical:
                                                    TextAlignVertical.bottom,
                                                controller: _emailController,
                                                cursorColor: AppColor
                                                    .LM_BUTTON_NORMAL_BLUE_6,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColor
                                                            .LM_BUTTON_NORMAL_BLUE_6,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColor
                                                            .LM_BUTTON_NORMAL_BLUE_6,
                                                      ),
                                                    ),
                                                    fillColor: AppColor
                                                        .LM_BACKGROUND_GREY1,
                                                    filled: true,
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    helperText: ' ',
                                                    // border:
                                                    //     UnderlineInputBorder(
                                                    //   borderSide:
                                                    //       BorderSide.none,
                                                    //   borderRadius:
                                                    //       BorderRadius.circular(
                                                    //           8),
                                                    // ),
                                                    hintText: 'username',
                                                    hintStyle: const TextStyle(
                                                        fontFamily: "Roboto",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor
                                                            .LM_FONT_DISABLE_GREY5)),
                                                onSaved: (value) {
                                                  _authData['email'] = value!;
                                                },
                                                validator: (val) {
                                                  if (val!.isEmpty ||
                                                      !val.contains('@')) {
                                                    return 'Please Provide valid email address';
                                                  }
                                                },
                                              ),
                                            )),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SizedBox(
                                            height: _config.sh(70).toDouble(),
                                            width: SizeConfig.screenWidthDp! *
                                                0.94,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0, bottom: 10),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                                textDirection:
                                                    TextDirection.ltr,
                                                textAlign: TextAlign.center,
                                                textAlignVertical:
                                                    TextAlignVertical.bottom,
                                                controller: _passwordController,
                                                cursorColor: AppColor
                                                    .LM_BUTTON_NORMAL_BLUE_6,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColor
                                                            .LM_BUTTON_NORMAL_BLUE_6,
                                                      ),
                                                    ),
                                                    fillColor: AppColor
                                                        .LM_BACKGROUND_GREY1,
                                                    filled: true,
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    helperText: ' ',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColor
                                                            .LM_BUTTON_NORMAL_BLUE_6,
                                                      ),
                                                    ),
                                                    hintText: 'password',
                                                    hintStyle: const TextStyle(
                                                        fontFamily: "Roboto",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor
                                                            .LM_FONT_DISABLE_GREY5)),
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return 'Please Provide valid email address';
                                                  }
                                                },
                                                onSaved: (value) {
                                                  _authData['password'] = value ??
                                                      ''; // saving user data in authData
                                                },
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: _config.sh(10).toDouble(),
                                      ),
                                      SizedBox(
                                          width:
                                              SizeConfig.screenWidthDp! * 0.40,
                                          child: LoginButton(
                                            text: loginStore.isEmailLoading
                                                ? 'Waiting'
                                                : 'Log In',
                                            color: loginStore.isEmailLoading
                                                ? AppColor
                                                    .LM_BUTTON_DISABLE_GREY5
                                                : null,
                                            onPress: () {
                                              _validate();
                                              if (_isValid == true) {
                                                print(_authData['password']
                                                    .toString());
                                                print(_authData['email']
                                                    .toString());
                                                loginStore.emailLogin(
                                                  context,
                                                  _authData['email']!
                                                      .toString(),
                                                  _authData['password']!
                                                      .toString(),
                                                );
                                              }
                                              if (loginStore.isEmailDone ==
                                                  true) {
                                                _clearField();
                                              }
                                            },
                                          )),
                                      // SizedBox(
                                      //     height: (MediaQuery.of(context)
                                      //                 .viewInsets
                                      //                 .bottom >
                                      //             0.0)
                                      //         ? (_config.uiHeightPx * 0.5)
                                      //             .toDouble()
                                      //         : (_config.uiHeightPx * 0.35)
                                      //             .toDouble()),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  //height: _config.uiHeightPx * 0.25),

                                  height: (MediaQuery.of(context)
                                              .viewInsets
                                              .bottom >
                                          0.0)
                                      ? (_config.uiHeightPx * 0.0005).toDouble()
                                      : (_config.uiHeightPx * 0.25).toDouble()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          },
        ));
  }
}

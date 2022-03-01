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

// for focusing on fields

  FocusNode? input1FocusNode = FocusNode();

  FocusNode? input2FocusNode = FocusNode();

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
        backgroundColor: AppColor.LM_BACKGROUND_BASIC,
        appBar: null,
        body: Consumer<Auth>(
          builder: (context, loginStore, _) {
            return Observer(
              builder: (_) => Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: AppColor.LM_BACKGROUND_BASIC,
                  key: _scaffoldKey,
                  body: Form(
                    key: _formKey,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          bottom: 0,
                          right: 0,
                          child: Column(
                            children: [
                              SizedBox(
                                  height: _config.sh(100).toDouble(),
                                  child:
                                      Image.asset('assets/images/bobtail.jpg')),
                              SizedBox(
                                  // checking when keyboard opens , adjusting height
                                  height: (MediaQuery.of(context)
                                              .viewInsets
                                              .bottom >
                                          0.0)
                                      ? (_config.uiHeightPx * 0.0001).toDouble()
                                      : (_config.uiHeightPx * 0.20).toDouble()),
                              Card(
                                elevation: 0,
                                color: AppColor.LM_BACKGROUND_BASIC,
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
                                              child: Container(
                                                key: const Key('email'),
                                                child: TextFormField(
                                                  autofocus: true,
                                                  // focusNode: input1FocusNode,
                                                  // for testing
                                                  key: GlobalKey(
                                                      debugLabel: "email"),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  textAlign: TextAlign.center,
                                                  textAlignVertical:
                                                      TextAlignVertical.bottom,
                                                  controller: _emailController,
                                                  cursorColor: AppColor
                                                      .LM_BORDER_ACTIVE_BLUE6,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: AppColor
                                                              .LM_BORDER_ACTIVE_BLUE6,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: AppColor
                                                              .LM_BORDER_ACTIVE_BLUE6,
                                                        ),
                                                      ),
                                                      fillColor: AppColor
                                                          .LM_BACKGROUND_BASIC,
                                                      filled: true,
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      helperText: ' ',
                                                      hintText: 'username',
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontFamily:
                                                                  "Roboto",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColor
                                                                  .grey7)),

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
                                                focusNode: input2FocusNode,
                                                key: const Key('password'),
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
                                                    .LM_BORDER_ACTIVE_BLUE6,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColor
                                                            .LM_BORDER_ACTIVE_BLUE6,
                                                      ),
                                                    ),
                                                    fillColor: AppColor
                                                        .LM_BACKGROUND_BASIC,
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
                                                            .LM_BORDER_ACTIVE_BLUE6,
                                                      ),
                                                    ),
                                                    hintText: 'password',
                                                    hintStyle: const TextStyle(
                                                        fontFamily: "Roboto",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor.grey7)),
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return 'Please Provide valid email address';
                                                  }
                                                },
                                                onTap: () => {
                                                  input2FocusNode!
                                                      .requestFocus()
                                                },
                                                onSaved: (value) {
                                                  _authData['password'] = value ??
                                                      ''; // saving user data in map: authData
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
                                                ? AppColor.grey7
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
                                      SizedBox(
                                          // adjusting height on keyboard opening
                                          height: (MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom >
                                                  0.0)
                                              ? (_config.uiHeightPx * 0.0025)
                                                  .toDouble()
                                              : (_config.uiHeightPx * 0.075)
                                                  .toDouble()),
                                    ],
                                  ),
                                ),
                              ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/desktop/view_login_desktop.dart';
import 'package:project_enade/web/ui/mobile/view_login_mobile.dart';
import 'package:project_enade/web/ui/widgets/responsive.dart';


class ViewLogin extends StatelessWidget {
  final titleLogin = "Acesse sua conta";
  final campoMatricula = "Matrícula";
  final campoSenha = "Senha";
  final campoEmail = "E-mail";
  final textEsqueciSenha = "Não possui conta?";
  final textEsqueciSenhaLink = "Cadastre-se";
  final campoEsqueciSenha = "Esqueci minha senha?";
  final textButtonLogin = "Entrar";

  @override
  Widget build(BuildContext context) {
    final screen = getFormFactor(context).toString();
    if(screen == "ScreenType.Phone"){
      return ViewLoginMobile();
    }else{
      return ViewLoginDesktop();
    }
  }
}

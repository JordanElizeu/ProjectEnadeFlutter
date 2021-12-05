import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/desktop/login_desktop/view_login_desktop.dart';
import 'package:project_enade/web/ui/mobile/login_mobile/view_login_mobile.dart';
import 'package:project_enade/web/ui/tablet/login_tablet/view_login_tablet.dart';
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
    final width = MediaQuery.of(context).size.width;

    switch (screen){
      case 'ScreenType.Phone':
        return ViewLoginMobile();
        break;
      default:
        if (width * 0.40 < 320){
          return ViewLoginTablet();
        }else{
          return ViewLoginDesktop();
        }
        break;
    }
  }
}

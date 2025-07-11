# Flutter TopMind Tokio Test

Uma aplicação Flutter responsiva com autenticação Firebase, incluindo tela de login e home.

## Características

- ✅ Telas de login, home e webview
- ✅ Responsividade para mobile e web
- ✅ Autenticação Firebase

## Instalação e Execução

### Pré-requisitos

- Flutter SDK instalado
- Dart SDK instalado
- Firebase configurado

### Passos

1. Clone o repositório

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Execute a aplicação:

   ```bash
   # Para web
   flutter run -d chrome

   # Para Android
   flutter run -d android

   # Para iOS
   flutter run -d ios
   ```

## Estrutura do Projeto (atualizada)

```
lib/
  main.dart
  models/
  providers/
    user_provider.dart
    product_card_provider.dart
  screens/
    home_screen.dart
    login_screen.dart
  services/
    auth_service.dart
  widgets/
    custom_text_field.dart
    product_card.dart
    section_card.dart
    social_media_icons.dart
    drawer_item.dart
```

- **providers/**: Providers de estado global (ex: usuário, seleção de produto)
- **widgets/**: Componentes reutilizáveis e widgets customizados
- **screens/**: Telas principais do app
- **services/**: Serviços de autenticação, API, etc.
- **models/**: Modelos de dados (se houver)

O restante das instruções de configuração permanece igual.

## Funcionalidades

### Tela de Login

- Design responsivo que se adapta a diferentes tamanhos de tela
- Fundo dividido: gradiente verde-amarelo na parte superior, preto na inferior
- Formulário centralizado com validação
- Funcionalidade "Lembrar sempre" usando SharedPreferences
- Recuperação de senha via email
- Ícones de redes sociais ilustrativos

### Tela Home

- Header com nome do usuário e ícone
- Fundo em gradiente verde-amarelo
- Seção "Teste" com cards horizontais responsivos
- Duas seções informativas com cards verdes
- Botão de logout funcional

### Autenticação

- Login com email/CPF e senha
- Cadastro de novos usuários
- Recuperação de senha
- Persistência de sessão
- Logout

## Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento
- **Firebase Authentication**: Autenticação de usuários
- **SharedPreferences**: Armazenamento local de preferências
- **Material Design**: Design system

## Notas Importantes

- Para produção, configure adequadamente as regras de segurança do Firebase
- O CPF é tratado como email para demonstração (adicione validação real conforme necessário)
- Os ícones de redes sociais são apenas ilustrativos
- Configure o domínio autorizado no Firebase Console para web

## Suporte

Para dúvidas ou problemas, consulte a documentação do Flutter e Firebase, ou abra uma issue no repositório.

## Configuração do Firebase para Web

1. Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:

```
FIREBASE_API_KEY=...
FIREBASE_AUTH_DOMAIN=...
FIREBASE_PROJECT_ID=...
FIREBASE_STORAGE_BUCKET=...
FIREBASE_MESSAGING_SENDER_ID=...
FIREBASE_APP_ID=...
FIREBASE_MEASUREMENT_ID=...
```

2. Execute o comando abaixo para gerar o arquivo de configuração:

```
node scripts/generate-firebase-config.js
```

## Configuração do Firebase para Android

1. Adicione as seguintes variáveis ao seu arquivo `.env`:

```
FIREBASE_PROJECT_NUMBER=
FIREBASE_MOBILESDK_APP_ID=
FIREBASE_ANDROID_PACKAGE_NAME=
FIREBASE_CURRENT_KEY=
```

2. Execute o comando abaixo para gerar o arquivo de configuração:

```
node scripts/generate-google-services.js
```

> Os arquivos `assets/.env`, `web/firebase-config.js` e `android/app/google-services.json` estão no `.gitignore` e não devem ser versionados.

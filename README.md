# Wedding Page

## Getting Started

### Prerequisites

Requirements for the software and other tools to build, test and push
- [flutter](https://flutter.dev/)

You can install it easily with [asdf](https://asdf-vm.com/)

```bash
asdf plugin add flutter
asdf install
flutter doctor
```

### Installing

Get dependencies and generate some code

```bash
flutter pub get
flutter gen-l10n
flutter pub run build_runner build
```

Start the server and check the site in your browser

```bash
flutter run
```

## Deployment

Push code to master to start a new Github Action deploy.

News
--------
A simple news app written in Dart using Flutter framework.

## Compilation

To compile this app, simply clone the repo and run the following command:

```
flutter build <package-type> --split-per-abi
```

- Package types can be : `apk` or `aab`
- Platforms can be : As supported by Flutter `--target-platform` argument can be provided for e.g. `android-arm`, `android-arm64` etc. If no platform is specified, flutter will default to all platforms supported at the moment.
- If `--split-per-abi` argument is not provided, Flutter will generate a `fat` package which will be larger in size but will support all platforms.
- Don't provide both `--split-per-abi` & `--target-platform` argument togther

## Development

You can simply import this project into your Android Studio or VS Code. Follow [official instructions](https://flutter.dev/docs/get-started/install) to set up SDKs required for development if not done already.

# Base Riverpod

![git-repo-card](./media/git-repo-card.png)

[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/fredgrott)[![Xing](https://img.shields.io/badge/Xing-006567?style=for-the-badge&logo=xing&logoColor=white)](https://www.xing.com/profile/Fred_Grott/cv)[![keybase](https://img.shields.io/badge/Keybase-33A0FF?&style=for-the-badge&logo=keybase&logoColor=white)](https://keybase.io/fredgrott)[![github](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/fredgrott)[![medium](https://img.shields.io/badge/medium-%2312100E.svg?&style=for-the-badge&logo=medium&logoColor=white)](https://fredgrott.medium.com)[![linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/fredgrottstartupfluttermobileappdesigner/)![dart](https://img.shields.io/badge/dart-%230175C2.svg?&style=for-the-badge&logo=dart&logoColor=white)![flutter](https://img.shields.io/badge/Flutter%20-%2302569B.svg?&style=for-the-badge&logo=Flutter&logoColor=white)![vscode](https://img.shields.io/badge/VSCode-007ACC?&style=for-the-badge&logo=visual-studio-code&logoColor=white)![android studio](https://img.shields.io/badge/Android_Studio-3DDC84?&style=for-the-badge&logo=android-studio&logoColor=white)![markdown](https://img.shields.io/badge/Markdown-000000?&style=for-the-badge&logo=markdown&logoColor=white)![bsdlicense](https://img.shields.io/badge/-BSD_License-61DAFB?&logoColor=white&style=for-the-badge)

[![HitCount](http://hits.dwyl.com/fredgrott/base_riverpod.svg)](http://hits.dwyl.com/fredgrott/base_riverpod)![Maintainer](https://img.shields.io/badge/maintainer-theMaintainer-blue)[![GitHub forks](https://img.shields.io/github/forks/fredgrott/base_riverpod.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/fredgrott/base_riverpod/network/)[![GitHub stars](https://img.shields.io/github/stars/fredgrott/base_riverpod.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/fredgrott/base_riverpod/stargazers/)[![GitHub followers](https://img.shields.io/github/followers/fredgrott.svg?style=social&label=Follow&maxAge=2592000)](https://github.com/fredgrott?tab=followers)[![GitHub contributors](https://img.shields.io/github/contributors/fredgrott/base_riverpod.svg)](https://github.com/fredgrott/base_riverpod/graphs/contributors/)[![GitHub issues](https://img.shields.io/github/issues/fredgrott/base_riverpod.svg)](https://github.com/fredgrott/base_riverpod/issues/)[![GitHub issues-closed](https://img.shields.io/github/issues-closed/fredgrott/base_riverpod.svg)](https://GitHub.com/fredgrott/base_riverpod/issues?q=is%3Aissue+is%3Aclosed)

This is a base flutter project that is already set-up with:

-Integration Testing

-Debug logging

-Provider Widget Injection

-GetIT Service Locator Injection

-Widget Testing

-Workflow automation using Derry scripting

-App Architecture set-up as Domain Driven Architecture

It is my belief that enough deliberate practice with the right feed-back building full flutter apps will get you to transform to flutter expert in 1000 hours.

## TODO NOTE

As of 4-4-21, the support for integration_test screenshots on iOS and android has been merged per:

[screenshot issues](https://github.com/flutter/flutter/issues/51890)

Once it shows up in the sdk, I will enable that in the integration-test implementation. It's needed as all the plugins rely upon the old integration-test implementation which is no longer in the flutter sdk.

## Reasoning

The reasoning for doing it the skeleton-app way of learning Flutter-state-management:

- Any state management based on ChangeNotifier is O*N^2 which is terrible performance due to use of plain list instead of Linked-List

- The best performance state management library is the one that has the best decoupling with the best small memory foot-print.
  
- It's easier to teach reactive if we modify the Flutter SDK Reactive training wheels

- It's easier to pick-up Flutter self-learning wise if you use testing feed-back all the time from the beginning in using this skeleton app to build a bunch of flutter apps

This project is part of the Flutter-Deep-Dive series of developer articles and developer books with the main repo found here:

-[Flutter Deep Dive repo](https://github.com/fredgrott/flutterdeepdive)

## Framework Prerequisites

Install these prerequisites before using the Flutter SDK:

-[Git](https://git-scm.com/)

At least one SDK target. In March 2021, the Flutter SDK requires at least one mobile SDK installed:

-[Android SDK, can be auto-installed via the Android Studio Install](https://developer.android.com/studio)

-[iOS SDK can be auto-installed via installing Xcode Studio](https://developer.apple.com/xcode/)

## Project Prerequisites

These are the Dart Binaries that you need to install for my flutter projects:

-[Derry](https://pub.dev/packages/derry)

-[DCDG, UML generation](https://pub.dev/packages/dcdg)

-[junitreport](https://pub.dev/packages/junitreport)

-[DartDoc](https://pub.dev/packages/dartdoc)

-[Dhttpd, it's optional if you want to view API docs generated correctly](https://pub.dev/packages/dhttpd)

The prerequisites for these dart binaries are:

-[PlantUML, UML Generation](https://plantuml.com/)

-[GENHTML, which is part of LCOV I am showing the windows port](https://chocolatey.org/packages/lcov)

-[GENHTML, LCOV on Unix-Linux systems](http://ltp.sourceforge.net/coverage/lcov.php)

## Usage

To use this project, you can clone it via the terminal with:

```bash
git clone https://github.com/fredgrott/base_riverpod.git
```

And then modify for your use.

## License

Note, I no longer use any GNU(FSF) for my code due to FSF not banning RSM form the board for his support of Epstein. And that rule will be for the rest of my life.

BSD 2-clause license

## Acknowledgements

## Contributing

Not taking contributions at this time.

## Trademark Notice

Google LLC owns the following trademarks; Dart, Flutter, Android, Roboto, Noto. Apple Inc owns the trademarks iOS, MacOSX, Swift, and Objective-C. Apple Inc owns the trademarks to their fonts of SF Pro, Sf Compact, SF mono, and New York. JetBeans Inc owns the trademarks to JetBeans, IntelliJ, and Kotlin. Oracle Inc owns the Java trademark. Microsoft Inc owns the trademarks of MS Windows OS and Powershell. Gradle is a trademark of Gradle Inc. The Git Project owns the trademark to Git. Linux Foundation owns the trademark of Linux. Smartphone OEM's trademarks to their mobile phone product names. To the best of my ability, I follow the brand and usage guidelines with the above-mentioned trademarks.

## About Fred Grott

I'm the crazy one that is starting to teach Flutter App development during the COVID-pandemic. The first Flutter App development book in my Flutter-Deep-Dive series is being published in the fall of 2021. My Flutter Development articles are published at:

[My medium blog](https://fredgrott.medium.com)

Personal Keybase site is:

-[My Keybase Site](https://fredgrott.keybase.pub)

And, I can be DM'ed on Keybase at:

-[My Keybase Profile](https://keybase.io/fredgrott)

## Resources

-[Riverpod repo](https://github.com/rrousselGit/river_pod)

-[Riverpod @pub.dev](https://pub.dev/packages/riverpod)

-[Catcher @pub.dev](https://pub.dev/packages/catcher)

-[Catcher @github.com](https://github.com/jhomlala/catcher)

-[Fimber@pub.dev](https://pub.dev/packages/fimber)

-[Fimber@github.com](https://github.com/magillus/flutter-fimber)

-[Logging@pub.dev](https://pub.dev/packages/logging)

-[Logging@github.com](https://github.com/dart-lang/logging)

-[Logging Appenders@pub.dev](https://pub.dev/packages/logging_appenders)

-[Logging Appenders@github.com](https://github.com/hpoul/dart_logging_appenders)

-[Flutter Platform Widgets@pub.dev](https://pub.dev/packages/flutter_platform_widgets)

-[Flutter Platform Widgets@github.com](https://github.com/stryder-dev/flutter_platform_widgets)

-[Flutter State Management Benchmarks](https://github.com/jonataslaw/flutter_state_managers)

-[ChangeNotifier Benchmark, note that this includes the benchmark of the proposed but not in sdk changenotifier mod](https://github.com/knaeckeKami/changenotifier_benchmark)

Flutter Community Resources:

-[Flutter Codelabs](https://flutter.dev/docs/codelabs)

-[Flutter Community, where to ask individual questions](https://flutter.dev/community)

-[Flutter Docs](https://flutter.dev/docs)

-[Dart Language Tour](https://dart.dev/guides/language/language-tour)

-[Dart Docs](https://dart.dev/guides)

-[Deep Dive into the Pubspec](https://medium.com/flutter-community/deep-dive-into-the-pubspec-yaml-file-fb56ac8683b9)

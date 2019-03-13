# SimpleCAGraphics

Easy access to Core Animation grahpics

## Features

- Method chaining for Layer's properties and methods
- Call methods without 'CG-' type variables

## Requirements

- iOS 10.0+
- Xcode 10.1+
- Swift 4.2+

## Installation

### Carthage

Cartfile

```text
github "KinkumaDesign/SimpleCAGraphics"
```

Install Command

```text
carthage update --platform iOS
```

1. Drag and Drop `Carthage/Build/iOS/SimpleCAGraphics.framework` to `Linked Frameworks and Libraries`
1. In Build Phases, add `Run Script`
1. In script area

```text
/usr/local/bin/carthage copy-frameworks
```

4. Set `Input Files`

```
$(SRCROOT)/Carthage/Build/iOS/SimpleCAGraphics.framework
```



### CocoaPods

Podfile

```
pod 'SimpleCAGraphics', :git => 'https://github.com/KinkumaDesign/SimpleCAGraphics.git'
```

## License

[MIT license](/LICENSE)

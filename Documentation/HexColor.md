# HexColor

Hex color string utility

## UIColor from Hex String

```swift
let color = HexColor.createColor("#ffaabb")

// without #

let color2 = HexColor.createColor("ffaabb")
```

## UIColor to Hex String

```swift
let color:UIColor = .red
let str = HexColor.toHex(color)
print(str) // FF0000
```

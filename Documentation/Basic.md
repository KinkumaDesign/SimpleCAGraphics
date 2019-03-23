# Basic

## LayerController

`LayerController` is a controller for `CALayer` and its sub classes. The relationship between `LayerController` and `CALayer` is like `ViewController` and `View` relationship. You can access CALayer's graphics properties and methods trhough LayerController.

### Subclass of LayerController

- TextLayerController
- RectLayerController
- CircleLayerController
- GraphicsLayerController

## Method Chaining

`LayerController`'s method can chain other method.

```swift
layerController.setFrame(x: 0, y: 0, width: 100,height: 70)
    .translate(x: 100, y: 100)
    .setBackgroundColor(.red)
    .setOpacity(0.5)
```

If you prefer assignment style, you can do this.

```swift
layerController.frame = CGRect(x: 0, y: 0, width: 100,height: 70)
layerController.translate(x: 100, y: 100)
layerController.backgroundColor = .red
layerController.opacity = 0.5
```

## Without or With `CGFloat`

You can call methods with Swift's native value type `Double` or `Float`.

```swift
layerController.setFrame(x: 0, y: 0, width: 100, height: 80)
    .translate(x: 40, y: 30)
```

You can also call it with `CGFloat`. At this case, each method has `CG` suffix.

```swift
layerController.setFrameCG(x: 0, y: 0, width: 100, height: 80)
    .translateCG(x: 40, y: 30)
```

Although method name and arguments are different, the library does the same thing.



## Example

### Screenshot

![Basic](/Documentation/images/ex_basic.png)

### Method Chaining

```swift
let layerController = LayerController()
layerController.setFrame(x: 0, y: 0, width: 100, height: 80)
    .setBorderColor(.blue)
    .setBorderWidth(5)
    .setBackgroundColor(.red)
    .translate(x: 120, y: 30)
    .rotate(radian: .pi / 10)

canvasView.layer.addSublayer(layerController.layer)
```

### Assignment Style

```swift
let layerController = LayerController()
layerController.frame = CGRect(x: 0, y: 0, width: 100, height: 80)
layerController.backgroundColor = .blue
layerController.x = 120
layerController.y = 150
layerController.rotation = .pi / 10

canvasView.layer.addSublayer(layerController.layer)
```

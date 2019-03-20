# Basic

## LayerController

`LayerController` is a controller for `CALayer` and its sub classes. The relationship between `LayerController` and `CALayer` is like `ViewController` and `View` relationship. You can access CALayer's graphics properties and methods trhough LayerController.

### Subclass of LayerController

- TextLayerController
- RectlayerController
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

## Example

### Result Image

[Basic](/Documentation/images/simulator_basic.png)

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

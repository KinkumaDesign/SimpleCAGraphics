# RectLayerController

## Screenshot

![Basic](/Documentation/images/ex_rect_layer_controller.png)

## init

```swift
let rectLayerController = RectLayerController(x: 0, y: 0, width: 100, height: 80)
rectLayerController.setFillColor(.red)
    .setStrokeColor(.blue)
    .setLineWidth(5)
    .translate(x: 100, y: 80)
canvasView.layer.addSublayer(rectLayerController.layer)
```

## drawRect

```swift
let rectLayerController = RectLayerController()
rectLayerController.drawRect(x: 100, y: 240, width: 100, height: 80)
    .setFillColor(nil)
    .setLineWidth(5)
    .setStrokeColor(.purple)
canvasView.layer.addSublayer(rectLayerController.layer)
```


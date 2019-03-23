# CircleLayerController

## Screenshot

![Basic](/Documentation/images/ex_circle_layer_controller.png)

## init

```swift
let circleLayerController = CircleLayerController(x: 0, y: 0, radius: 50)
circleLayerController.setFillColor(.red)
    .setStrokeColor(.blue)
    .setLineWidth(5)
    .translate(x: 100, y: 80)
canvasView.layer.addSublayer(circleLayerController.layer)
```

## drawCircle

```swift
let circleLayerController = CircleLayerController()
circleLayerController.drawCircle(x: 0, y: 0, radius: 50)
    .setFillColor(nil)
    .setLineWidth(5)
    .setStrokeColor(.purple)
    .translate(x: 100, y: 240)
canvasView.layer.addSublayer(circleLayerController.layer)
```


import Cocoa
import FlutterMacOS

public class ColorPickerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "color_picker", binaryMessenger: registrar.messenger)
    let instance = ColorPickerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "pickColor": self.pickColor(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  func pickColor(result: @escaping FlutterResult) {
    Task {
      let color = await NSColorSampler().sample()
      if color == nil {
        result(nil)
        return
      }

      var red: CGFloat = 0
      var green: CGFloat = 0
      var blue: CGFloat = 0
      var alpha: CGFloat = 0

      let srgbColor = color!.usingColorSpace(.sRGB) ?? color!
      srgbColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

      let json: [String: CGFloat] = [
        "red": red,
        "green": green,
        "blue": blue,
        "alpha": alpha,
      ]
      result(json)
    }

  }
}

import Foundation
import SwiftUI



struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(Capsule()
                            .foregroundColor(configuration.isPressed ? Color(.sRGB, red:-0.0, green:0.259, blue:0.663, opacity:1.0) : Color.primary))
            .scaleEffect(configuration.isPressed ? CGFloat(1.35) : 1.0)
            .rotationEffect(.degrees(configuration.isPressed ? 0.0 : 0))
            .blur(radius: configuration.isPressed ? CGFloat(15.0) : 0)
            .animation(Animation.spring(response: 0.15000000000000002, dampingFraction: 0.95, blendDuration: 1), value: configuration.isPressed)
    }
}

extension Button {
    func myButtonStyle() -> some View {
        self.buttonStyle(MyButtonStyle())
    }
}


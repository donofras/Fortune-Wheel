//
//  FortuneWheel.swift
//  FortuneWheel
//
//  Created by Denis Onofras on 07.09.22.
//
import SwiftUI

public struct FortuneWheel: View {
    
    var text = "Hello, World!"
    
    var titles: [String], size: CGFloat, onSpinEnd: ((Int) -> ())?, strokeWidth: CGFloat, strokeColor: Color = Color(hex: "999999")
    var colors: [Color] = Color.spin_wheel_color, pointerColor: Color = Color(hex: "f44336")
    @StateObject var viewModel: FortuneWheelViewModel
    
    public init(titles: [String], size: CGFloat, onSpinEnd: ((Int) -> ())?, colors: [Color]? = nil, pointerColor: Color? = nil, strokeWidth: CGFloat = 15, strokeColor: Color? = nil, animDuration: Double = Double(1), animation: Animation? = nil) {
        
        self.titles = titles
        self.size = size
        self.strokeWidth = strokeWidth
        
        if let colors = colors { self.colors = colors }
        if let pointerColor = pointerColor { self.pointerColor = pointerColor }
        if let strokeColor = strokeColor { self.strokeColor = strokeColor }
        
        let timeCurveAnimation = Animation.timingCurve(0.51, 0.97, 0.56, 0.99, duration: animDuration)
        _viewModel = StateObject(wrappedValue: FortuneWheelViewModel(titles: titles, animDuration: animDuration, animation: animation ?? timeCurveAnimation, onSpinEnd: onSpinEnd))
    }
    
    public var body: some View {
        VStack {
            Group {
                ZStack(alignment: .top) {
                    ZStack(alignment: .center) {
                        SpinWheelView(data: (0..<titles.count).map { _ in Double(100/titles.count) },
                                      labels: titles, colors: colors)
                        .frame(width: size, height: size)
                        .overlay(
                            RoundedRectangle(cornerRadius: size/2).stroke(lineWidth: strokeWidth)
                                .foregroundColor(strokeColor)
                        )
                        .rotationEffect(.degrees(viewModel.degree))
                        SpinWheelBolt(size: 100)
                    }
                    SpinWheelPointer(pointerColor: pointerColor).offset(x: 0, y: -25)
                }
            }
            
            Button {
                viewModel.spinWheel()
            } label: {
                Text("SPIN")
                    .frame(width: 250, height: 46)
                    .font(.title2)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }.padding()
        }
    }
}

struct FortuneWheel_Previews: PreviewProvider {
    static var previews: some View {
        FortuneWheel(titles: ["1","2","3","4","5"], size: 350, onSpinEnd: { _ in
    
        })
    }
}

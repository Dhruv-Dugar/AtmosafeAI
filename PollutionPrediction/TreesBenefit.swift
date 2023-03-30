//
//  TreesBenefit.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 23/03/23.
//

import Foundation
import SwiftUI


struct TreesBenefit: View{
    
    @State var transY: CGFloat = 0
    var foreverAnimation =
    Animation.linear.speed(0.3)
                .repeatForever(autoreverses: true)
    
    @State var alpha: CGFloat = 1.0
    
    
    
    var body: some View{
        VStack {
          Image(systemName: "tree")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                .offset(x: 0, y: transY)
                  .onAppear {
                      withAnimation(foreverAnimation) {
                          transY = -25
                      }
                  }
          VStack{
          }.frame(width: 50, height: 10, alignment: .center)
              .background(Color.indigo)
              .cornerRadius(10.0)
              .opacity(alpha)
              .scaleEffect(x: alpha, y: 1.0, anchor: UnitPoint.center)
              .onAppear {
                  withAnimation(foreverAnimation) {
                      alpha = 0.4
                  }
              }
            (
            Text("Trees are a solution")
                .foregroundColor(.green)
            +
            Text("\nTrees have been scientifically found to reduce pollution.")
            +
            Text(" And planting trees at a large scale is a viable solution for reducing the impact.")
            
            
            )
                .multilineTextAlignment(.center)
                .lineLimit(5)
                .padding()
                .titleStyle()
            
            // make a button which clicking which a new view pops up, and that has the AR scene with the provided usdz file
            
            
            
//            struct GameScene : View {
//            var body: some View {
//              let scene = SceneView(scene: SCNScene(named: "BTL-S8_K-wing_assault_starfighter.usdz"), options: [.autoenablesDefaultLighting,.allowsCameraControl])
//              return scene
//            }
//          }
            
            
            
        }
    }
}


struct TreesBenefit_Preview: PreviewProvider{
    static var previews: some View{
        TreesBenefit()
    }
}

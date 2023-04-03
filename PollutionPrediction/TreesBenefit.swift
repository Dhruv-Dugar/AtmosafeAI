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
    Animation.easeIn.speed(0.1)
                .repeatForever(autoreverses: true)
    
    @State var alpha: CGFloat = 1.0
    
    
    
    var body: some View{
        VStack {
            
            Spacer()
            
            Image("tree")
                .resizable()
                .foregroundColor(.green)
                .aspectRatio(contentMode: .fit)
            
            
            Spacer()
            (
                Text("Trees in cities reduce pollution by absorbing harmful gases, purifying the air and providing shade. Planting more trees in urban areas can improve air quality and create a healthier environment for people.")
            )
            .multilineTextAlignment(.center)
            .lineLimit(5)
            .padding()
            .titleStyle()
            
            Spacer()
            
            Text("Green cities, clean air - plant a tree, show you care!")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.green)
                .titleStyle()
            
            Spacer()
        
        }
        
    }
    
}


struct TreesBenefit_Preview: PreviewProvider{
    static var previews: some View{
        TreesBenefit()
    }
}

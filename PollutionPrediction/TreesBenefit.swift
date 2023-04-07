//
//  TreesBenefit.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 23/03/23.
//

import Foundation
import SwiftUI


struct TreesBenefit: View{
    
    @State private var isShowing = false
    
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
            .foregroundColor(.orange)
            .multilineTextAlignment(.center)
            
            .lineLimit(5)
            .padding()
            .titleStyle()
            
            Spacer()
            
            Text("Green cities, clean air - plant a tree, show you care!")
                .font(.system(size: 37, weight: .semibold, design: .monospaced))
                .foregroundColor(.teal)
                .titleStyle()
            
            Spacer()
            
            Button{
                // open TreeRealityView in a opened view
            } label: {
                Text("Click here and see the clean and green cities, for a better tomororw!")
            }
        
        }
        .opacity(isShowing ? 1 : 0)
        .onAppear{
            withAnimation(.easeIn(duration: 1)) {
                isShowing = true
            }
        }
        
    }
    
}


struct TreesBenefit_Preview: PreviewProvider{
    static var previews: some View{
        TreesBenefit()
    }
}

//
//  TreesBenefit.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 23/03/23.
//

import Foundation
import SwiftUI
import SceneKit

struct TreesBenefit: View{
    
    @State private var isShowing = false
    @State private var isShowingRealityView = false
    
    
    
    var body: some View{
        NavigationView{
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
                
                
                NavigationLink(destination: TreeRealityView().toolbar(.hidden).navigationViewStyle(.stack), label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .foregroundColor(.blue)
                })
                
            
            }
            .opacity(isShowing ? 1 : 0)
            .onAppear{
                withAnimation(.easeInOut(duration: 1)) {
                    isShowing = true
                }
            }
        }.navigationBarHidden(true)
            .navigationViewStyle(.stack)
        
    }
    
}


struct TreesBenefit_Preview: PreviewProvider{
    static var previews: some View{
        TreesBenefit()
    }
}

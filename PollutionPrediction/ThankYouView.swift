//
//  ThankYouView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 09/04/23.
//

import Foundation
import SwiftUI

struct ThankYouView: View{
    @State private var counter = 0
    @State private var isShowing: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        VStack{
            Text("Pollution modelling is a highly complex task, as it requires the consideration of numerous parameters to accurately simulate the behavior and impact of pollutants in the environment.")
                .multilineTextAlignment(.center)
                .font(.system(size: 30, weight: .semibold))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("AtmosafeAI's ML Model was built in just a few days with a CoreML Tabular Regressor, something which has just a few parameters like SO\u{2082}, NO\u{2082}, O\u{2083} and PM10.")
                .multilineTextAlignment(.center)
                .font(.system(size: 24))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Right now, AtmosafeAI acts as an intermediary step with manual input to the Pollution Data.")
                .multilineTextAlignment(.center)
                .font(.system(size: 24))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("But not for long")
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .font(.system(size: 26, weight: .semibold))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("After the submission, I plan to integrate API access to the world's pollution data and notify users in real time whether they should wear a mask or not, helping save lives and extend lifespans to spend on a safer Earth")
                .multilineTextAlignment(.center)
                .font(.system(size: 24))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
//            SceneView(scene: SCNScene(named: "Pollution_Plant.usdz"), options: [.autoenablesDefaultLighting,.allowsCameraControl])
//                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 3)
            
            Image(colorScheme == .light ? "thankyou" : "thankyou_inverted")
                .frame(width: UIScreen.main.bounds.width*0.7)
                .padding(.top, 40)
                .titleStyle()
            
            Spacer()
            
            
            
            
            Text("~Dhruv Dugar")
                .font(.system(size: 20))
                .font(.callout)
                .foregroundColor(.secondary)
                .padding(.top, 20)
               
                
            
            
//            Spacer()
            
            
        }
        .opacity(isShowing ? 1 : 0)
        .onAppear{
            withAnimation(.easeIn(duration: 0.5)){
                isShowing = true
                updateCounter()
            }
        }
        .padding()
    }
    
    func updateCounter(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
            counter = 1
        }
    }
    
}

struct ThankYouView_Preview: PreviewProvider{
    static var previews: some View{
        ThankYouView()
    }
}

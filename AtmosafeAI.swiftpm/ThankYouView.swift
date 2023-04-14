//
//  ThankYouView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 09/04/23.
//

import Foundation
import SwiftUI

struct ThankYouView: View{
    
    @State private var isShowing: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @State private var isConfettiVisible: Bool = false
    
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
            
            Image(colorScheme == .light ? "thankyou" : "thankyou_inverted")
                .resizable()
                .aspectRatio(contentMode: .fit)
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
        .withConfetti(isVisible: $isConfettiVisible)
        .opacity(isShowing ? 1 : 0)
        .onAppear{
            withAnimation(.easeIn(duration: 0.5)){
                isShowing = true
                showConfetti()
                hideConfetti()
            }
        }
        .padding()
    }
    
    
    func showConfetti(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            isConfettiVisible = true
        }
    }
    
    func hideConfetti(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            isConfettiVisible = false
        }
    }
    
}

struct ThankYouView_Preview: PreviewProvider{
    static var previews: some View{
        ThankYouView()
    }
}

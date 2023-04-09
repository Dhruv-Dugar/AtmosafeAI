//
//  ThankYouView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 09/04/23.
//

import Foundation
import SwiftUI


struct ThankYouView: View{
    
    var body: some View{
        VStack{
            Text("Pollution modelling is a highly complex task, as it requires the consideration of numerous parameters to accurately simulate the behavior and impact of pollutants in the environment.")
                .multilineTextAlignment(.center)
                .font(.system(size: 30, weight: .semibold))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("PollutionPrediction's ML Model was built in just a few days with a CoreML Tabular Regressor, something which has just a few parameters like SO\u{2082}, NO\u{2082}, O\u{2083} and PM10.")
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Right now, PollutionPrediction acts as an intermediary step with manual input to the Pollution Data.")
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("But not for long")
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .semibold))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            Text("After the submission, I plan to integrate API access to the world's pollution data and notify users in real time whether they should wear a mask or not, helping save lives and extend lifespans to spend on a safer Earth")
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .padding()
                .fixedSize(horizontal: false, vertical: true)
            
            
            
            
            
            
        }
    }
    
}

struct ThankYouView_Preview: PreviewProvider{
    static var previews: some View{
        ThankYouView()
    }
}

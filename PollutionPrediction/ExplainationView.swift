//
//  ExplainationView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 26/02/23.
//

import SwiftUI
import Foundation


struct ExplainationView: View{
    
    var body: some View{
        VStack{
//            Spacer()
            HStack{
                Spacer()
                
                Image(systemName: "ipad")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                
                Spacer()
                
                Image(systemName: "iphone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                
                Spacer()
                
                Image(systemName: "ipad.homebutton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                
                Spacer()
                
                Image(systemName: "iphone.homebutton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75)
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(.bottom, 30)

            Text("PollutionPredictor has been optimised to work for all iPad and iPhone models.")
                .titleStyle()
                            
            Spacer()
            
            (
                Text("Pollution measurement is done in 6 key parameters, PM 2.5, PM 10, CO, NO_{2}, SO2 and O3.")
                
                +
                
                Text(" Out of these, ")
                
                +
                
                Text("PM 2.5 (fine particles)")
                    .foregroundColor(.red)
                
                +
                
                Text(" are the most harmful, and being the most difficult to measure and control.")
            )
            .font(.system(size: 22))
            .titleStyle()
            
            
            Text("PollutionPredictor tries to predict the PM 2.5 values, and recommend if you should wear a mask while heading outside or not, based on the conditions!").font(.system(size: 22))
                .titleStyle()
            
            Spacer()
            
            
            
        }
    }

}


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .font(.system(size: 30))
            .padding()
            .fixedSize(horizontal: false, vertical: true)
    }
}


extension View{
    func titleStyle() -> some View{
        modifier(Title())
    }
}


struct ExplainationView_previews: PreviewProvider {
    static var previews: some View {
        ExplainationView()
    }
}

//
//  ExplainationView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 26/02/23.
//

import SwiftUI
import Foundation


struct ExplanationView: View{
    
    @State private var isShowing = false
    
    var body: some View{
        NavigationView{
            VStack{
    //            Spacer()
                

                Spacer()
                
                
                SubSuperScriptText(inputString: "Pollution measurement is done in 6 key parameters, PM 2.5, PM 10, CO, NO_{2}, SO_{2} and O_{3}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                    .font(.system(size: 27))
                    .titleStyle()
                
                (
                    
                    
                    Text(" Out of these, ")
                    
                    +
                    
                    Text("PM 2.5 (fine particles)")
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                    
                    +
                    
                    Text(" are the most harmful, and being the most difficult to measure and control.")
                )
                .font(.system(size: 27))
                .titleStyle()
                
                
                Text("PollutionPredictor attemps to predict the PM 2.5 values, and recommend if you should wear a mask while heading outside or not, based on the prevailing present conditions!").font(.system(size: 27))
                    .titleStyle()
                
                (
                    Text("PollutionPredictor additionally uses the international pollution standards to calculate the ")
                    +
                    Text("Air Quality Index")
                        .foregroundColor(.orange)
                        .fontWeight(.semibold)
                    +
                    Text(" from the given data, and provides a simple overview over the present conditions.")
                    
                )
                    .font(.system(size: 27))
                        .titleStyle()
                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Image(systemName: "aqi.low")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.purple)
                            .frame(width: 75)
                        Text("Low AQI")
                            .titleStyle()
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "aqi.medium")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.purple)
                            .frame(width: 75)
                        Text("Medium AQI")
                            .titleStyle()
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "aqi.high")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.purple)
                            .frame(width: 75)
                        Text("High AQI")
                            .titleStyle()
                    }
                    Spacer()
                }
                .padding(.top, 35)
                .padding(.bottom, 30)
                .padding()
                
                Spacer()
                
                NavigationLink(destination: Home().toolbar(.hidden).navigationViewStyle(.stack), label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                })
                
                Spacer()
                
                
            }
        }
        .padding(.horizontal, 30)
        .opacity(isShowing ? 1 : 0)
        .onAppear{
            withAnimation(.easeIn(duration: 1)) {
                self.isShowing = true
            }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
    }

}




struct ExplainationView_previews: PreviewProvider {
    static var previews: some View {
        ExplanationView()
    }
}

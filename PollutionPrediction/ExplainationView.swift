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

                Spacer()

                
                Text("Pollution measurement is done in 6 key parameters, PM 2.5, PM 10, CO, NO\u{2082}, SO\u{2082} and O\u{2083} namely.")
                    .font(.system(size: 27))
                    .titleStyle()
                
                (
                    
                    
                    Text(" Out of these, ")
                    
                    +
                    
                    Text("PM 2.5 (fine particles)")
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                    
                    +
                    
                    Text(" are the most pesky, and being the most difficult to measure and control.")
                )
                .font(.system(size: 27))
                .titleStyle()
                
                Text("AtmosafeAI uses a custom ML model built with CoreML to predict the PM 2.5 levels in the city of Delhi, the data on which the model has been trained to work.")
                    .titleStyle()
                
                
                
                VStack{
                    
                    Text("With the same, an attempt is made to predict the PM 2.5 values, and recommend if you should wear a mask while heading outside or not, based on the prevailing present conditions to keep you safe!")
                        .font(.system(size: 27))
                        .titleStyle()
                    
                    Image("delhi")
                        .resizableImage()
                        .frame(width: 200, height: 200, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                }
                
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

struct ExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationView()
    }
}


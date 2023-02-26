//
//  ContentView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 25/02/23.
//

import SwiftUI


struct IntroView: View {
    
    var body: some View {
    
        NavigationView{
            VStack{
                Section{
                    Image("logo")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .padding(.top, 20)
//                    Spacer()
                    (
                        Text("Pollution is one of the largest issues in 2023.")
                        +
                        Text("\nIt is estimated that ")
                        +
                        Text("one in every three ")
                            .foregroundColor(.red)
                        +
                        Text("deaths from stroke, lung cancer and heart diseases are due to Air Pollution.")
                    )
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
    //
    //                Spacer()
                    (
                        Text("PollutionPredictor aims to use the capabilities of")
                        +
                        Text(" Machine Learning")
                            .foregroundColor(.cyan)
                        +
                        Text(" to help you decide to when to wear a mask, and alleviate the effects due to pollution, in a fun way.")
                    )
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                NavigationLink(destination: ExplainationView().toolbar(.hidden).navigationViewStyle(.stack), label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .foregroundColor(.blue)
                })
                
                Spacer()
                
                Text("Please note that this playground is designed to be run on an iPad with camera ")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .padding([.horizontal, .top])
                
                Text("Reference: Air Pollution and adverse health effects. (2023) https://www.who.int/news-room/spotlight/how-air-pollution-is-destroying-our-health")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
        
            }
        }.onAppear(perform: {
            
        })
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}


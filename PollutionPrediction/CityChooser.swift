//
//  CityChooser.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI


struct CityChooser: View{
    
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State private var isShowingDetails = false
    
    @State private var concentrationNO2 = 0.0
    @State private var concentrationCO = 0.0
    @State private var concentrationSO2 = 0.0
    @State private var concentrationO3 = 0.0
    @State private var concentrationPM10 = 0.0
    @State private var concentrationPM25 = 0.0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    
    var body: some View{
        NavigationView{
            VStack {
                
                    Button{
                        withAnimation{
                            isShowingDetails.toggle()
                        }
                    } label: {
                        withAnimation{
                            Image("jaipur")
                                .renderingMode(.original)
                                .resizableImage()
                                .scaleEffect(CGFloat(scaleXY))
                                .onAppear(){
                                    scaleXY = 1.45
                                }
                        }
                    }
                    
                    
                    if isShowingDetails{
                    Spacer()
                    
                        Form{
                            VStack(alignment: .leading){
                                Group {
                                    Text("Concentration of Carbon Monoxide")
                                    
                                    TextField("Concentration of CO", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
                                }
                                
                                Group {
                                    Text("Concentration of Nitrous Dioxide")
                                    
                                    TextField("Concentration of NO2", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
                                }
                                
                                Group {
                                    Text("Concentration of Sulfur Dioxide")
                                    
                                    TextField("Concentration of SO2", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
                                }
                                
                                Group {
                                    Text("Concentration of Ozone")
                                    
                                    TextField("Concentration of O3", value: $concentrationO3, format: .number).keyboardType(.decimalPad)
                                }
                                
                                Group {
                                    Text("Concentration of PM10")
                                    
                                    TextField("Concentration of PM10", value: $concentrationPM10, format: .number).keyboardType(.decimalPad)
                                }
                                
                                
                                
                                
                                
                            }.padding()
                        }
                }
            }
        }.onAppear(perform: {
            
        })
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
    }
}

extension Image{
    func resizableImage() -> some View{
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 350)
    }
}

struct CityChooser_Preview: PreviewProvider{
    static var previews: some View{
        CityChooser()
    }
}

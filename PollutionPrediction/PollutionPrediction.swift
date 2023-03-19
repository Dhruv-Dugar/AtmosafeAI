//
//  PollutionPrediction.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI
import ImageViewer
import CoreML


struct PollutionPrediction: View{
    
    enum Fields{
        case co
        case no2
        case so2
        case o3
        case pm10
    }
    @State private var concentrationNO2: Double?
    @State private var concentrationCO: Double?
    @State private var concentrationSO2: Double?
    @State private var concentrationO3: Double?
    @State private var concentrationPM10: Double?
    
    @State var image = Image("CO")
    @State var showImageViewer: Bool = false
    
    @Namespace var namespace
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @FocusState private var isActive: Fields?
    
    var body: some View{
        NavigationView{
            Form{
                VStack {
                    HStack{
                            Button{
                                withAnimation(.linear) {
                                    self.image = Image("CO")
                                    showImageViewer.toggle()
                                    isActive = .pm10
                                }
                            } label: {
                                VStack{
                                    Image("CO")
                                }
                            }.buttonStyle(.borderless)
                            
                            VStack{
                                Text("Concnetration of CO")
                                
                                TextField("CO concentration", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle())
                                    .focused($isActive, equals: .co)
                            }
                    }
                }
                
                VStack {
                    HStack{
                        
                        Button{
                            withAnimation(.linear) {
                                self.image = Image("NO2")
                                showImageViewer.toggle()
                            }
                        } label: {
                            Image("NO2")
                        }.buttonStyle(.borderless)
                        
                        VStack{
//                            Text("Concnetration of NO2")
                            
                            SubSuperScriptText(inputString: "Concentration of NO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                            
                            TextField("NO\u{2082} concentration", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .no2)
                        }
                    }
                }
                
                VStack {
                    HStack{
                        Button{
                            withAnimation(.linear) {
                                self.image = Image("SO2")
                                showImageViewer.toggle()
                            }
                        } label: {
                            Image("SO2")
                        }.buttonStyle(.borderless)
                        
                        VStack{
//                            Text("Concnetration of SO2")
                            SubSuperScriptText(inputString: "Concentration of SO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                            TextField("SO\u{2082} concentration", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .so2)
                        }
                    }
                }
                
                
                VStack{
                    HStack{
                        Button{
                            withAnimation(.linear){
                                self.image = Image("O3")
                                showImageViewer.toggle()
                            }
                        } label: {
                            Image("O3")
                        }.buttonStyle(.borderless)
                        
                        VStack{
//                            Text("Concentration of O3")
                            SubSuperScriptText(inputString: "Concentration of O_{3}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                            TextField("O\u{2083} concentration", value: $concentrationO3, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .o3)
                        }
                    }
                }
                
                VStack{
                    HStack{
                        Button{
                            withAnimation(.linear){
                                self.image = Image("PM10")
                                showImageViewer.toggle()
                            }
                        } label: {
                            Image("PM10")
                        }.buttonStyle(.borderless)
                        
                        VStack{
                            Text("Concentration of PM10")
                            
                            TextField("PM10 concentration", value: $concentrationPM10, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .pm10)
                        }
                    }
                }
                
                
                Button("Calculate", action: predictPM25)
                    .alert(alertTitle, isPresented: $showingAlert){
                        Button("OK"){ }
                    } message: {
                        Text(alertMessage)
                    }
            }.overlay(ImageViewer(image: self.$image, viewerShown: self.$showImageViewer))
                .onSubmit {
                    switch isActive{
                    case .co:
                        isActive = .none
                    case .no2:
                        isActive = .none
                    case .so2:
                        isActive = .none
                    case .o3:
                        isActive = .none
                    case .pm10:
                        print("done ig")
                    case .none:
                        print("idk why")
                    }
                }
        }.navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
    
    func predictPM25(){
        do{
            let config = MLModelConfiguration()
            let model = try Delhi_Pollution_Model(configuration: config)
            
            let prediction = try model.prediction(NO2: concentrationNO2 ?? 0, CO: concentrationCO ?? 0, SO2: concentrationSO2 ?? 0, O3: concentrationO3 ?? 0, PM10: concentrationPM10 ?? 0)
            
            let concentrationPM25 = prediction.PM2_5.truncate(places: 2)
            
            alertTitle = "Predicted value of PM2.5 is \(concentrationPM25)"
            
            if concentrationPM25 < 50{
                alertMessage = "Expected PM 2.5 concentration is good. No need to wear a mask"
            } else if concentrationPM25 < 100{
                alertMessage = "PM 2.5 concentration is moderate. Wear a mask if you have respiratory conditions"
            }else if concentrationPM25 < 150{
                alertMessage = "PM 2.5 concentration is unhealthy for sensetive groups. Wear a mask in the case of having respiratory issues"
            }else{
                alertMessage = "Severely high PM 2.5 values, wearing a mask is recommenede for everyone"
            }
        } catch{
            print("Fatal Error")
            alertTitle = "Fatal Error"
            alertMessage = "Sorry there was a problem in predicting PM 2.5 values"
        }
        
        showingAlert = true
    }
    
}

struct PollutionPrediction_Preview: PreviewProvider{
    static var previews: some View{
        PollutionPrediction()
    }
}

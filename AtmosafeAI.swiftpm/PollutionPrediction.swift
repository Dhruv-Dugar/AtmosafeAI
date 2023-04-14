//
//  PollutionPrediction.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI
import CoreML
import Charts

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

    @State private var isShowingPage: Bool = false
    @State private var isShowingNextButton: Bool = false
//    Ip = index of pollutant p
//    Cp = truncated concentration of pollutant p
//    BPHi = concentration breakpoint i.e. greater than or equal to Cp
//    BPLo = concentration breakpoint i.e. less than or equal to Cp
//    IHi = AQI value corresponding to BPHi
//    ILo = AQI value corresponding to BPLo
    
    
    var predictedAQI: Double? {
        
        
        if predictedPM25! < 30 {
            let aqiPM25 = (50-0)/(30-0)*(30-predictedPM25!)
            return aqiPM25
        } else if predictedPM25! < 60 {
            let aqiPM25 = (100-51)/(60-31)*(60-predictedPM25!) + 31
            return aqiPM25
        } else if predictedPM25! < 90 {
            let aqiPM25 = (200-101)/(90-61)*(90-predictedPM25!) + 61
            return aqiPM25
        } else if predictedPM25! < 120 {
            let aqiPM25 = (300-201)/(120-91)*(120-predictedPM25!) + 91
            return aqiPM25
        } else if predictedPM25! < 250 {
            let aqiPM25 = (400-301)/(250-121)*(250-predictedPM25!) + 121
            return aqiPM25
        }
        
        return nil
        
        
    }
    
    let data = loadCSV(from: "data")
    
    
    @Namespace var namespace
    @FocusState private var isActive: Fields?
    
    var predictedPM25: Double? {
        do{
            let config = MLModelConfiguration()
            let model = try Delhi_Pollution_Model(configuration: config)
            
            let prediction = try model.prediction(NO2: concentrationNO2 ?? 0, CO: concentrationCO ?? 0, SO2: concentrationSO2 ?? 0, O3: concentrationO3 ?? 0, PM10: concentrationPM10 ?? 0)
            
            let concentrationPM25 = prediction.PM2_5.truncate(places: 2)
            
            return concentrationPM25
        } catch{
            print("Fatal Error")
        }
        return 89.08
    }
    
    
    var body: some View{
        NavigationView{
            ScrollView{
                VStack{
                    Text("Enter Pollution Details") // TODO: NEED TO CHANGE THIS TEXT TO SOMETHING BETTER
                        .titleStyle()
                    
                    HStack{
                        chartCarbonMonoxideView()
                        VStack(alignment: .leading){
                            Text("Concentration of CO")
                            if concentrationCO != 0{
                                TextField("0 ppm", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle())
                                    .focused($isActive, equals: .co)
                            } else{
                                TextField("0 ppm", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle())
                                    .focused($isActive, equals: .co)
                            }
                        
                        }
                    }
                    
                    
                    HStack{
                        chartNitrogenDioxideView()
                        VStack(alignment: .leading){
                            Text("Concentration of NO\u{2082}")
                            TextField("0 ppm", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .no2)
                        }
                    }
                    
                    //
                    HStack{
                        chartSulfurDioxideView()
                        VStack(alignment: .leading){
                            Text("Concentration of SO\u{2082}")
                            
                            TextField("0 ppm", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .so2)
                        }
                    }
                    
                    
                    HStack{
                        chartOzoneView()
                        VStack(alignment: .leading){
                            Text("Concentration of O\u{2083}")
                            TextField("0 ppm", value: $concentrationO3, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .o3)
                        }
                    }
                    
                    
                    HStack{
                        chartPM10View()
                        VStack(alignment: .leading){
                            Text("Concentration of PM10")
                            TextField("0 μg/m\u{00B3}", value: $concentrationPM10, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .pm10)
                        }
                    }
                    
                    
                    
                    VStack{
                        Label("Predicted concentration of PM2.5", systemImage: predictedPM25! > 50 ? predictedPM25! > 100 ? "aqi.high" : "aqi.medium" : "aqi.low")
                            .font(.system(size: 20))
                        
                        
                        (
                            Text(predictedPM25!.formatted())
                            
                            +
                            Text(" μg/m\u{00B3}")
                            
                            
                        )
                        .foregroundColor(predictedPM25! > 60 ? .red : .mint)
                        .font(.title.weight(.semibold))
                        
                        
                        Spacer()
                        
                        
                        (
                            Text("\nPredicted AQI levels are ")
                             
                            +
                            
                            Text("\(predictedAQI!.truncate(places: 2).formatted())")
                                .foregroundColor(predictedAQI! > 100 ? .red : .mint)
                                .fontWeight(.semibold)
                        )
                            .titleStyle()
                        
                        Text(predictedPM25! > 50 ? predictedPM25! > 100 ? predictedPM25! > 150 ? "\nSeverely high PM 2.5 values, wearing a mask is recommenede for everyone" : "\nPM 2.5 concentration is unhealthy. Wear a mask in the case of having respiratory issues." : "\nPM 2.5 concentration is moderate. Wear a mask if you have respiratory conditions or belong in sensetive groups." : "\nExpected PM 2.5 concentration is good. No need to wear a mask")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20))
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                       
                        NavigationLink(destination: TreesBenefit().toolbar(.hidden).navigationViewStyle(.stack), label: {
                                
                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .padding(.top, 20)
                                
                        })
                        
                        
                        Spacer()
                        
                        
                    }.padding()
                    
                }
                .padding(.horizontal)
                .opacity(isShowingPage ? 1 : 0)
                .onAppear{
                    
                    withAnimation(.easeInOut(duration: 1)) {
                        displayNextButton()
                        self.isShowingPage = true
                    }
                }
            }
        }.navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
    
    
    
    func displayNextButton(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            isShowingNextButton = true
        }
    }
    
    
    
}

struct PollutionPrediction_Preview: PreviewProvider{
    static var previews: some View{
        PollutionPrediction()
    }
}

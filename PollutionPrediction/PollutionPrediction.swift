//
//  PollutionPrediction.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI

struct OutlinedTextFieldStyle: TextFieldStyle {
    @State var icon: Image?
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            if icon != nil {
                icon
                    .foregroundColor(Color(UIColor.systemGray4))
            }
            configuration
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color(UIColor.systemGray4), lineWidth: 2)
        }
    }
}

struct PolluutionPrediction: View{
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
        Spacer()
        Form{
            VStack(alignment: .leading){
                Section {
                    HStack{
                        VStack{
                            Image("CO")
                                .resizable()
                        }
                        
                        VStack{
                            Text("Concentration of Carbon Monoxide")
                            
                            TextField("Concentration of CO", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                        }
                    }
                }
                
                Section {
                    HStack {
                        VStack {
                            Image("CO")
                                .resizable()
                        }
                        VStack {
                            Text("Concentration of Nitrous Dioxide")
                            TextField("Concentration of NO2", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                        }.padding()
                    }.padding()
                }
                
                Section {
                    HStack {
                        VStack{
                            Image("CO")
                                .resizable()
                        }
                        VStack{
                            Text("Concentration of Sulfur Dioxide")
                            TextField("Concentration of SO2", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                        }
                    }
                    
                    
                }
                
                Section {
                    HStack{
                        VStack{
                            Image("CO")
                                .resizable()
                        }
                        VStack{
                            Text("Concentration of Ozone")
                            
                            TextField("Concentration of O3", value: $concentrationO3, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                        }
                    }
                }
                
                Section {
                    HStack{
                        VStack{
                            Image("CO")
                                .resizable()
                        }
                        VStack{
                            Text("Concentration of PM10")
                            
                            TextField("Concentration of PM10", value: $concentrationPM10, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                        }
                    }
                }
            }.padding()
        }
    }
}

struct Previews_PollutionPrediction_Previews: PreviewProvider {
    static var previews: some View {
        PolluutionPrediction()
    }
}

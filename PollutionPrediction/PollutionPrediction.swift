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
    
    @Namespace var namespace
    
    @State var show = false
    
    @FocusState var isActive: Bool
    
    var body: some View{
        NavigationView{
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
                                    .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                                    .focused($isActive)
                                    .toolbar{
                                        ToolbarItemGroup(placement: .keyboard){
                                            Spacer()
                                            
                                            Button("Done"){
                                                isActive = false
                                            }
                                        }
                                    }
                            }
                        }
                    }
                    
                    Section {
                        HStack {
                            VStack {
                                Image("NO2")
                                    .resizable()
                            }
                            VStack {
                                Text("Concentration of Nitrous Dioxide")
                                TextField("Concentration of NO2", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                                    .focused($isActive)
                            }.padding()
                        }.padding()
                    }
                    
                    Section {
                        HStack {
                            ZStack{
                                if !show{
                                    Image("SO2")
                                        .resizable()
                                        .matchedGeometryEffect(id: "so2", in: namespace)
                                } else {
                                    Image("SO2")
                                        .resizable()
                                        .matchedGeometryEffect(id: "shape", in: namespace)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            }.onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    show.toggle()
                                }
                            }
                            VStack{
                                Text("Concentration of Sulfur Dioxide")
                                TextField("Concentration of SO2", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                                    .focused($isActive)
                            }
                        }
                        
                        
                    }
                    
                    Section {
                        HStack{
                            VStack{
                                Image("O3")
                                    .resizable()
                            }
                            VStack{
                                Text("Concentration of Ozone")
                                
                                TextField("Concentration of O3", value: $concentrationO3, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                                    .focused($isActive)
                            }
                        }
                    }
                    
                    Section {
                        HStack{
                            VStack{
                                Image("PM10")
                                    .resizable()
                            }
                            VStack{
                                Text("Concentration of PM10")
                                
                                TextField("Concentration of PM10", value: $concentrationPM10, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                                    .focused($isActive)
                            }
                        }
                    }
                }.padding()
            }
        }.navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
}

struct PollutionPrediction_Preview: PreviewProvider{
    static var previews: some View{
        PolluutionPrediction()
    }
}

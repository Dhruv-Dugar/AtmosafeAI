//
//  CityChooser.swift
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


struct ImageOverlay: View{
    var body: some View{
        ZStack{
            Text("Testing...")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }
        .background(Color.gray)
        .opacity(0.7)
        .cornerRadius(10.0)
        .padding(6)
    }
}

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
                                    scaleXY = 1.25
                                }
                        }
                    }
                    
                    
                    if isShowingDetails{
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
        }.onAppear(perform: {
            scaleXY = 0.9
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

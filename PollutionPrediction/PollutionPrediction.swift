//
//  PollutionPrediction.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI
import ImageViewer

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


struct COView: View{
    var body: some View{
        Image("CO")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct PollutionPrediction: View{
    @State private var concentrationNO2 = 0.0
    @State private var concentrationCO = 0.0
    @State private var concentrationSO2 = 0.0
    @State private var concentrationO3 = 0.0
    @State private var concentrationPM10 = 0.0
    
    @State var image = Image("CO")
    @State var showImageViewer: Bool = false
    
    @Namespace var namespace
    @State var showCO = true
    @State var showNO2 = true
    @State var showSO2 = true
    @State var showO3 = true
    @State var showPM10 = true
    
    @FocusState var isActive: Bool
    
    var body: some View{
        NavigationView{
            Form{
                VStack {
                    HStack{
                            Button{
                                withAnimation(.linear) {
                                    self.image = Image("CO")
                                    showImageViewer.toggle()
                                }
                            } label: {
                                VStack{
                                    Image("CO")
                                }
                            }.buttonStyle(.borderless)
                            
                            VStack{
                                Text("Concnetration of CO")
                                
                                TextField("CO concentration", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                                    .focused($isActive)
                                    .toolbar{
                                        ToolbarItemGroup(placement: .keyboard) {
                                            Spacer()
                                            
                                            Button("Done") {
                                                isActive = false
                                            }
                                        }
                                    }
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
                            Text("Concnetration of NO2")
                            
                            TextField("NO2 concentration", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                                .focused($isActive)
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
                            Text("Concnetration of SO2")
                            
                            TextField("SO2 concentration", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle(icon: Image(systemName: "lock")))
                                .focused($isActive)
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
                    }
                }
                
            }.overlay(ImageViewer(image: self.$image, viewerShown: self.$showImageViewer))
        }.navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
}

struct PollutionPrediction_Preview: PreviewProvider{
    static var previews: some View{
        PollutionPrediction()
    }
}

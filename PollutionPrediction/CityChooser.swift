//
//  CityChooser.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI


struct CityChooser: View{
    
    var body: some View{
        NavigationView{
            VStack {
                
                Text("Choose the city for the Pollution Prediction ")
                
                HStack {
                    NavigationLink(destination: PollutionPrediction().toolbar(.hidden).navigationViewStyle(.stack), label: {
                        Text("uh?")
                    })
                    
                    
                    Button{
                        //
                    } label: {
                        VStack{
                            NavigationLink(destination: PollutionPrediction().toolbar(.hidden).navigationViewStyle(.stack), label: {
                                VStack {
                                    Image("jaipur")
                                    Text("hi?")
                                }.padding()
                                
                            })
                        }
                    }
                }
                
                
                HStack {
                    Button{
                        //
                    } label: {
                        VStack{
                            NavigationLink(destination: PollutionPrediction().toolbar(.hidden).navigationViewStyle(.stack), label: {
                                VStack {
                                    Image("jaipur")
                                    Text("hi?")
                                }.padding()
                                
                            })
                        }
                    }
                    
                    Button{
                        //
                    } label: {
                        VStack{
                            NavigationLink(destination: PollutionPrediction().toolbar(.hidden).navigationViewStyle(.stack), label: {
                                VStack {
                                    Image("jaipur")
                                    Text("hi?")
                                }.padding()
                                
                            })
                        }
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

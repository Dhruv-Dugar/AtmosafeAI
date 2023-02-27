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
    
    var body: some View{
        NavigationView{
            VStack {
                HStack {
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
                    
                    }
                    if isShowingDetails{
                        Text("animation?")
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

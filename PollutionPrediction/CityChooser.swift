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
    @State var positionY = 0
    
    var body: some View{
        NavigationView{
            VStack {
                HStack {
                    NavigationLink(destination: PollutionPrediction(), label: {
                        Image("jaipur")
                            .renderingMode(.original)
                            .resizableImage()
                            .rotationEffect(.degrees(rotation))
                            .scaleEffect(CGFloat(scaleXY))
                            .offset(y: CGFloat(positionY))
                            .animation(Animation.easeInOut(duration: 3))
                            .onAppear() {
                                scaleXY = 1.35
                                positionY -= 250
                            }
                    })
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

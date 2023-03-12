//
//  CityChooser.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI




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

struct LogoView: View{
    
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State private var isShowingDetails = false
    
    var body: some View{
        NavigationView{
            VStack {
                
                NavigationLink(destination: PolluutionPrediction().toolbar(.hidden).navigationViewStyle(.stack), label: {
                    Image("jaipur")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .aspectRatio(contentMode: .fit)
                })
            }
        }.navigationBarHidden(true)
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

struct LogoView_Preview: PreviewProvider{
    static var previews: some View{
        LogoView()
    }
}

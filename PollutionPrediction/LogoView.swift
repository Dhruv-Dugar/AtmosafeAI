//
//  LogoView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI






struct LogoView: View{
    
    @State var rotation = 0.0
    @State var scaleXY = 1.0
    @State private var isShowingDetails = false
    
    var body: some View{
        NavigationView{
            VStack {
                
                NavigationLink(destination: PollutionPrediction().toolbar(.hidden).navigationViewStyle(.stack), label: {
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



struct LogoView_Preview: PreviewProvider{
    static var previews: some View{
        LogoView()
    }
}

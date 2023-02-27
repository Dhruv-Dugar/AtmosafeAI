//
//  PollutionPrediction.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI

struct PollutionPrediction: View{
    
    @State private var nameOfCity = userChoiceCity.cityNameChoosen
    
    var body: some View{
        NavigationView{
            Text(nameOfCity)
        }.onAppear(perform: {
            
        })
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
    }
}


struct PollutionPrediction_Previews: PreviewProvider{
    static var previews: some View{
        PollutionPrediction()
    }
}

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
        VStack {
            
            Text("Choose the city for the Pollution Prediction ")
            
            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .frame(width: 100, height: 100)
                
                
                
                Text("Jaipur")
            }
            HStack {
                Image("Delhi")
                    .resizableImage()
                Image("Delhi")
                    .resizableImage()
            }
        }
            
        
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

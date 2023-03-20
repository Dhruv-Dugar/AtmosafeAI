//
//  GraphConfiguration.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 20/03/23.
//

import Foundation
import SwiftUI

struct YellowGroupBoxStyle: GroupBoxStyle {

    func makeBody(configuration: Configuration) -> some View {

        
        VStack(alignment: .leading, spacing: 8) {
            configuration.label
                .foregroundColor(Color.white)
                .padding(.top, 8)
                .padding(.leading, 8)
            
            configuration.content
                .padding(.top, 30)
                .padding(20)
                .background(Color(hue: 0.1, saturation: 0.1, brightness: 0.98))
                .cornerRadius(20)
        }
        
//        configuration.content
//
//            .padding(.top, 30)
//
//            .padding(20)
//
//            .background(Color(hue: 0.10, saturation: 0.10, brightness: 0.98))
//
//            .cornerRadius(20)
//
//            .overlay(
//
//                configuration.label.padding(10),
//
//                alignment: .topLeading
//
//            )

    }

}

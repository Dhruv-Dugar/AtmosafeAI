//
//  GroupBoxConfiguration.swift
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
                        .foregroundColor(Color.black)
                        .padding(.top, 8)
                        .padding(.leading, 8)
                    configuration.content
                        .padding(8)
                }
        .background(Color(red: 220, green: 133, blue: 245, opacity: 0.1))
                .cornerRadius(8)
            }

}


struct DarkGroupBoxStyle: GroupBoxStyle {

    func makeBody(configuration: Configuration) -> some View {

        VStack(alignment: .leading, spacing: 8) {
                    configuration.label
                        .foregroundColor(Color.black)
                        .padding(.top, 8)
                        .padding(.leading, 8)
                    configuration.content
                        .padding(8)
                }
        .background(Color.white)
                .cornerRadius(8)
            }

}

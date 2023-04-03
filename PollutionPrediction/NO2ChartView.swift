//
//  File.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 03/04/23.
//

import Foundation
import SwiftUI
import Charts

struct chartNitrogenDioxideView: View{
    
    let data = loadCSV(from: "data")
    
    var body: some View{
        VStack {
            
            let prevColor = Color(hue: 0.69, saturation: 0.19, brightness: 0.79)
            let curColor = Color(hue: 0.33, saturation: 0.81, brightness: 0.76)
            let curGradient = LinearGradient(
                gradient: Gradient (
                    colors: [
                        curColor.opacity(0.5),
                        curColor.opacity(0.2),
                        curColor.opacity(0.05),
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            // Chart here
            VStack(alignment: .leading){
//                SubSuperScriptText(inputString: "Concentration of NO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                
                Chart{
                    ForEach(data) { datum in
                        LineMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.NO2)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(prevColor)
                        
                        AreaMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.NO2)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(curGradient)
                        
                        PointMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.NO2)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(Color.indigo)
                    }
                }
                .chartYAxis {
                   AxisMarks(position: .leading)
                }
                .chartPlotStyle { plotArea in
                    plotArea
                        .background(.pink.opacity(0.1))
                        .border(.mint, width: 0.7)
                }
                .chartYAxisLabel("Concentration of NO\u{2082}", position: .leading)
                .frame(width: 400)
            }
            .padding()
        }
    }
}

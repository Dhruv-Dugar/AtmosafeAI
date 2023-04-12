//
//  PM10ChartView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 03/04/23.
//

import Foundation
import SwiftUI
import Charts

struct chartPM10View: View{
    
    let dataPM10 = [81.05, 114.26, 142.74, 128.97, 105.41, 89.28, 82.04, 83.65, 81, 80.42, 76.69, 69.34, 74.26, 90.04, 117.52, 130.84, 135.96, 136.98,137.14]
    
    let serial = Array(1...19)
    
    var body: some View{
        
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
        
        
        VStack(alignment: .leading){
            //            Text("Concentration of PM10")
            Chart{
                ForEach(Array(zip(dataPM10, serial)), id: \.0){ item in
                    
                    LineMark(
                        x: .value("serial", item.1),
                        y: .value("pm10", item.0)
                    ).interpolationMethod(.catmullRom)
                        .foregroundStyle(prevColor)
                    
                    AreaMark(
                        x: .value("serial", item.1),
                        y: .value("pm10", item.0)
                    ).interpolationMethod(.catmullRom)
                        .foregroundStyle(curGradient)
                    
                    
                    
                    PointMark(
                        x: .value("serial", item.1),
                        y: .value("pm10", item.0)
                    ).interpolationMethod(.catmullRom)
                        .foregroundStyle(.indigo)
                    
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
            .chartYAxisLabel("Concentration of PM10", position: .leading)
            .frame(width: 400)
        }.groupBoxStyle(YellowGroupBoxStyle())
            .padding()
    }
}

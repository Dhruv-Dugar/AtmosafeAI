//
//  chartConcentrationView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 21/03/23.
//

import Foundation
import SwiftUI
import Charts


struct chartCarbonMonoxideView: View{
    
    let data = loadCSV(from: "data")
    
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
        
        VStack {
            // Chart here
            VStack(alignment: .leading){
                Text("Concentration of CO")
                Chart{
                    ForEach(data) { datum in
                        LineMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.CO)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(prevColor)
                        
                        AreaMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.CO)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(curGradient)
                        
                        
                        PointMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.CO)
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
                        .border(.orange, width: 0.3)
                }
                .frame(width: 400)
            }.groupBoxStyle(DarkGroupBoxStyle())
            .padding()
        }
    }
}


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
                SubSuperScriptText(inputString: "Concentration of NO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                
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
                        .border(.orange, width: 0.3)
                }
                .frame(width: 400)
            }
            .padding()
        }
    }
}


struct chartSulfurDioxideView: View{
    let data = loadCSV(from: "data")
    
    var body: some View{
        VStack {
            
            
            
            // Chart here
            VStack(alignment: .leading){
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
                
                
                SubSuperScriptText(inputString: "Concentration of SO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                Chart{
                    ForEach(data) { datum in
                        LineMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.SO2)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(prevColor)
                        
                        AreaMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.SO2)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(curGradient)
                        
                        PointMark(
                            x: .value("Data 1", datum.Serial),
                            y: .value("CO", datum.SO2)
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
                        .border(.orange, width: 0.3)
                }
                .frame(width: 400)
            }.groupBoxStyle(YellowGroupBoxStyle())
            .padding()
        }
    }
}

struct chartOzoneView: View{
    let data = loadCSV(from: "data")
    
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
            SubSuperScriptText(inputString: "Concentration of O_{3}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
            Chart{
                ForEach(data) { datum in
                    LineMark(
                        x: .value("Data 1", datum.Serial),
                        y: .value("CO", datum.O3)
                    )
                    .foregroundStyle(prevColor)
                    
                    AreaMark(
                        x: .value("Data 1", datum.Serial),
                        y: .value("CO", datum.O3)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(curGradient)
                    
                    PointMark(
                        x: .value("Data 1", datum.Serial),
                        y: .value("CO", datum.O3)
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
                    .border(.orange, width: 0.3)
            }
            .frame(width: 400)
        }.groupBoxStyle(YellowGroupBoxStyle())
        .padding()
    }
}



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
            Text("Concentration of PM10")
            Chart{
                ForEach(Array(zip(dataPM10, serial)), id: \.0){ item in
                    
                    LineMark(
                        x: .value("serial", item.1),
                        y: .value("pm10", item.0)
                    ).interpolationMethod(.catmullRom)
                        .foregroundStyle(prevColor)
                    
                    
                    
                    
                    PointMark(
                        x: .value("serial", item.1),
                        y: .value("pm10", item.0)
                    )
                    
                }
            
                
                
            }
            .chartYAxis {
               AxisMarks(position: .leading)
            }

            .chartPlotStyle { plotArea in

                plotArea
                    .background(.orange.opacity(0.1))
                    .border(.orange, width: 0.3)
            }
            .frame(width: 400)
        }.groupBoxStyle(YellowGroupBoxStyle())
        .padding()
    }
}

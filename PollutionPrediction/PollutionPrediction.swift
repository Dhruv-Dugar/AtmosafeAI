//
//  PollutionPrediction.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 27/02/23.
//

import Foundation
import SwiftUI
import CoreML
import Charts

struct PollutionPrediction: View{
    
    enum Fields{
        case co
        case no2
        case so2
        case o3
        case pm10
    }
	
    @State private var concentrationNO2: Double?
    @State private var concentrationCO: Double?
    @State private var concentrationSO2: Double?
    @State private var concentrationO3: Double?
    @State private var concentrationPM10: Double?
    
    let data = loadCSV(from: "data")
	
	let dataPM10 = [81.05, 114.26, 142.74, 128.97, 105.41, 89.28, 82.04, 83.65, 81, 80.42, 76.69, 69.34, 74.26, 90.04, 117.52, 130.84, 135.96, 136.98,137.14]
	
	let serial = Array(1...20)
	
    @Namespace var namespace
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @FocusState private var isActive: Fields?
    
    var body: some View{
        NavigationView{
            Form{
                VStack {
                    HStack{
                        VStack {
                            // Chart here
                            GroupBox(
								"Concentration of CO"
							){
                                Chart{
                                    ForEach(data) { datum in
                                        LineMark(
                                            x: .value("Data 1", datum.Serial),
                                            y: .value("CO", datum.CO)
                                        )
                                        .interpolationMethod(.catmullRom)
                                        
                                        PointMark(
                                            x: .value("Data 1", datum.Serial),
                                            y: .value("CO", datum.CO)
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
                            
                            VStack{
                                Text("Concentration of CO")
			
								
                                TextField("CO concentration", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
                                    .textFieldStyle(OutlinedTextFieldStyle())
                                    .focused($isActive, equals: .co)
                            }
                    }
                }
                
                VStack {
                    HStack{
						
						VStack {
							// Chart here
							GroupBox(
								"Concentration of NO\u{2082}"
							){
								Chart{
									ForEach(data) { datum in
										LineMark(
											x: .value("Data 1", datum.Serial),
											y: .value("CO", datum.NO2)
										)
										.interpolationMethod(.catmullRom)
										
										PointMark(
											x: .value("Data 1", datum.Serial),
											y: .value("CO", datum.NO2)
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
                        
                        VStack{
//                            Text("Concnetration of NO2")
                            
                            SubSuperScriptText(inputString: "Concentration of NO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                            
                            TextField("NO\u{2082} concentration", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .no2)
                        }
                    }
                }
                
                VStack {
                    HStack{
						VStack {
							// Chart here
							GroupBox(
								"Concentration of SO\u{2082}"
							){
								Chart{
									ForEach(data) { datum in
										LineMark(
											x: .value("Data 1", datum.Serial),
											y: .value("CO", datum.SO2)
										)
										.interpolationMethod(.catmullRom)
										
										PointMark(
											x: .value("Data 1", datum.Serial),
											y: .value("CO", datum.SO2)
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
                        VStack{
//                            Text("Concnetration of SO2")
                            SubSuperScriptText(inputString: "Concentration of SO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                            TextField("SO\u{2082} concentration", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .so2)
                        }
                    }
                }
                
                
                VStack{
                    HStack{
						VStack {
							// Chart here
							GroupBox(
								"Concentration of O\u{2083}"
							){
								Chart{
									ForEach(data) { datum in
										LineMark(
											x: .value("Data 1", datum.Serial),
											y: .value("CO", datum.O3)
										)
										.interpolationMethod(.catmullRom)
										
										PointMark(
											x: .value("Data 1", datum.Serial),
											y: .value("CO", datum.O3)
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
                        VStack{
//                            Text("Concentration of O3")
                            SubSuperScriptText(inputString: "Concentration of O_{3}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
                            TextField("O\u{2083} concentration", value: $concentrationO3, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .o3)
                        }
                    }
                }
                
                VStack{
                    HStack{
						VStack {
							// Chart here
							GroupBox(
								"Concentration of PM10"
							){
								Chart{
									ForEach(Array(zip(dataPM10, serial)), id: \.0){ item in
										
										LineMark(
											x: .value("serial", item.1),
											y: .value("pm10", item.0)
										).interpolationMethod(.catmullRom)
										
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
                        
                        VStack{
                            Text("Concentration of PM10")
                            
                            TextField("PM10 concentration", value: $concentrationPM10, format: .number).keyboardType(.decimalPad)
                                .textFieldStyle(OutlinedTextFieldStyle())
                                .focused($isActive, equals: .pm10)
                        }
                    }
                }
                
                
                Button("Calculate", action: predictPM25)
                    .alert(alertTitle, isPresented: $showingAlert){
                        Button("OK"){
							
						}
                    } message: {
                        Text(alertMessage)
                    }
				
				
				
            }
        }.navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
    
    func predictPM25(){
        do{
            let config = MLModelConfiguration()
            let model = try Delhi_Pollution_Model(configuration: config)
            
            let prediction = try model.prediction(NO2: concentrationNO2 ?? 0, CO: concentrationCO ?? 0, SO2: concentrationSO2 ?? 0, O3: concentrationO3 ?? 0, PM10: concentrationPM10 ?? 0)
            
            let concentrationPM25 = prediction.PM2_5.truncate(places: 2)
            
            alertTitle = "Predicted value of PM2.5 is \(concentrationPM25)"
            
            if concentrationPM25 < 50{
                alertMessage = "Expected PM 2.5 concentration is good. No need to wear a mask"
            } else if concentrationPM25 < 100{
                alertMessage = "PM 2.5 concentration is moderate. Wear a mask if you have respiratory conditions"
            }else if concentrationPM25 < 150{
                alertMessage = "PM 2.5 concentration is unhealthy for sensetive groups. Wear a mask in the case of having respiratory issues"
            }else{
                alertMessage = "Severely high PM 2.5 values, wearing a mask is recommenede for everyone"
            }
        } catch{
            print("Fatal Error")
            alertTitle = "Fatal Error"
            alertMessage = "Sorry there was a problem in predicting PM 2.5 values"
        }
        
        showingAlert = true
    }
    
}

struct PollutionPrediction_Preview: PreviewProvider{
    static var previews: some View{
        PollutionPrediction()
    }
}

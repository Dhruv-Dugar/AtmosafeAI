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
	
	let serial = Array(1...19)
	
	@Namespace var namespace
	//    @State private var alertMessage = ""
	//	@State private var alertTitle = ""
	//
	@FocusState private var isActive: Fields?
	
	var predictedPM25: Double? {
		do{
			let config = MLModelConfiguration()
			let model = try Delhi_Pollution_Model(configuration: config)
			
			let prediction = try model.prediction(NO2: concentrationNO2 ?? 0, CO: concentrationCO ?? 0, SO2: concentrationSO2 ?? 0, O3: concentrationO3 ?? 0, PM10: concentrationPM10 ?? 0)
			
			let concentrationPM25 = prediction.PM2_5.truncate(places: 2)
			
			return concentrationPM25
		} catch{
			print("Fatal Error")
		}
		
		return nil
	}
	
	
	
	
	
	
	
	
    var body: some View{
        NavigationView{
			ScrollView{
				VStack{
					HStack{
						chartCarbonMonoxideView()
						VStack(alignment: .leading){
							Text("Concentration of CO")
							TextField("", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .co)
						}
					}
					
					HStack{
						chartNitrogenDioxideView()
						VStack(alignment: .leading){
	//						Text("Concentration of NO2")
							SubSuperScriptText(inputString: "Concentration of NO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6)
							TextField("", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .no2)
						}
					}
					
					HStack{
						chartSulfurDioxideView()
						VStack(alignment: .leading){
	//						Text("Concentration of CO")
							SubSuperScriptText(inputString: "Concentration of SO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
							TextField("", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .so2)
						}
					}
					
					HStack{
						chartOzoneView()
						VStack(alignment: .leading){
	//						Text("Concentration of CO")
							SubSuperScriptText(inputString: "Concentration of O_{3}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
							TextField("", value: $concentrationO3, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .o3)
						}
					}
					
					HStack{
						chartPM10View()
						VStack(alignment: .leading){
							Text("Concentration of PM10")
							TextField("", value: $concentrationPM10, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .pm10)
						}
					}
				}
				.padding(20)
				
				Section{
						(
							Text("Predicted Concentration of PM2.5 is ")
								+
							Text(predictedPM25!.formatted())
								.font(.title.weight(.semibold))
								.foregroundColor(.red)
						)
						.multilineTextAlignment(.center)
						.font(.system(size: 20))
						.padding()
						.fixedSize(horizontal: false, vertical: true)
								
								
								
				}
				.listRowSeparator(.hidden)
				
			}
        }.navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
    

    
}

struct PollutionPrediction_Preview: PreviewProvider{
    static var previews: some View{
        PollutionPrediction()
    }
}

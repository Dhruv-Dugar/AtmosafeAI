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
	
	
	@Namespace var namespace
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
		// default value as 59.37 as model predicts that when everything is 0
		return 59.37
	}
	
	@State private var aqiPM25: Double?
	
	var AQI: Double?{
		
		// here we will calculate the AQI using the state values for all the variables
		
		
		
//		0-50: This range defines air quality as good as it shows minimal or no impact on health.
//
//		51-100: This is a satisfactory air quality range and it can show effects such as breathing difficulty in sensitive groups.
//
//		101-200: The range shows moderate air quality with impacts such as breathing discomfort for children and elderly people, and people already suffering from lung disorders and heart disease.
//
//		201-300: AQI falling in this range communicates that the air quality is poor and shows health effects on people when exposed for the long term. People already suffering from heart diseases can experience discomfort from short exposure.
//
//		301-400: This range shows very poor air quality and causes respiratory illness for a longer duration of exposure.
//
//		401-500: This is the severe range of AQI causing health impacts to normal and diseased people. It also causes severe health impacts on sensitive groups.
		
//		Ip = [IHi – ILo / BPHi – BPLo] (Cp – BPLo) + ILo
//
//		Where,
//
//		Ip = index of pollutant p
//		Cp = truncated concentration of pollutant p
//		BPHi = concentration breakpoint i.e. greater than or equal to Cp
//		BPLo = concentration breakpoint i.e. less than or equal to Cp
//		IHi = AQI value corresponding to BPHi
//		ILo = AQI value corresponding to BPLo
		
		// for PM2.5
		
		if predictedPM25! < 30{
			aqiPM25 = (50 - 0)/(30-0) * (predictedPM25 - 0) + 0
		} else if predictedPM25! < 60{
			aqiPM25 = (100-51)/(60-31) * (predictedPM25 - 51) + 51
		} else if predictedPM25! < 90{
			aqiPM25 = (200-101)/(90-61) * (predictedPM25 - 101) + 101
		} else if predictedPM25! < 120{
			aqiPM25 = (300-201)/(120-91) * (predictedPM25 - 201) + 201
		} else if predictedPM25! < 250{
			aqiPM25 = (400-301)/(250-121) * (predictedPM25 - 301) + 301
		} else{
			return nil
		}
		
		
		return aqiPM25
	}
	
	
	
	
	
	
	var body: some View{
		NavigationView{
			ScrollView{
				VStack{
					Text("Enter Pollution Details") // TODO: NEED TO CHANGE THIS TEXT TO SOMETHING BETTER
						.titleStyle()
					
					HStack{
						chartCarbonMonoxideView()
						VStack(alignment: .leading){
							Text("Concentration of CO")
							TextField("ppm", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .co)
						}
					}
					
					HStack{
						chartNitrogenDioxideView()
						VStack(alignment: .leading){
	//						Text("Concentration of NO2")
							SubSuperScriptText(inputString: "Concentration of NO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6)
							TextField("ppm", value: $concentrationNO2, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .no2)
						}
					}
					
					HStack{
						chartSulfurDioxideView()
						VStack(alignment: .leading){
	//						Text("Concentration of CO")
							SubSuperScriptText(inputString: "Concentration of SO_{2}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
							TextField("ppm", value: $concentrationSO2, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .so2)
						}
					}
					
					HStack{
						chartOzoneView()
						VStack(alignment: .leading){
	//						Text("Concentration of CO")
							SubSuperScriptText(inputString: "Concentration of O_{3}", bodyFont: .callout, subScriptFont: .caption, baseLine: 6.0)
							TextField("ppm", value: $concentrationO3, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .o3)
						}
					}
					
					HStack{
						chartPM10View()
						VStack(alignment: .leading){
							Text("Concentration of PM10")
							TextField("μg/m\u{00B3}", value: $concentrationPM10, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .pm10)
						}
					}
					
					
					VStack{
						Label("Predicted concentration of PM2.5", systemImage: predictedPM25! > 50 ? predictedPM25! > 100 ? "aqi.high" : "aqi.medium" : "aqi.low")
							.font(.system(size: 20))
					
					
						(
							Text(predictedPM25!.formatted())
							+
							Text(" μg/m\u{00B3}")
						
							
						)
							.font(.title.weight(.semibold))
							.foregroundColor(predictedPM25! > 150 ? .red : .mint)
					
					
					
						
						Text(predictedPM25! > 50 ? predictedPM25! > 100 ? predictedPM25! > 150 ? "\nSeverely high PM 2.5 values, wearing a mask is recommenede for everyone" : "\nPM 2.5 concentration is unhealthy for sensetive groups. Wear a mask in the case of having respiratory issues" : "\nPM 2.5 concentration is moderate. Wear a mask if you have respiratory conditions" : "\nExpected PM 2.5 concentration is good. No need to wear a mask")
								.multilineTextAlignment(.center)
								.font(.system(size: 20))
								.fixedSize(horizontal: false, vertical: true)
					
					
						
						Text("hi")
					}
									
						
						

					NavigationLink(destination: TreesBenefit().toolbar(.hidden).navigationViewStyle(.stack), label: {
						Image(systemName: "arrow.right.circle.fill")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 50)
							.foregroundColor(.blue)
					})
				}
				.padding(.horizontal)
				
				
				
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

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
	
	@State private var graph1Visible: Bool = false
	@State private var graph2Visible: Bool = false
	@State private var graph3Visible: Bool = false
	@State private var graph4Visible: Bool = false
	@State private var graph5Visible: Bool = false
	@State private var viewVisible: Bool = false
	@State private var isShowingTitle: Bool = false
	
	
	
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
	
	var body: some View{
		NavigationView{
			ScrollView{
				VStack{
					Text("Enter Pollution Details") // TODO: NEED TO CHANGE THIS TEXT TO SOMETHING BETTER
						.titleStyle()
						.opacity(isShowingTitle ? 1 : 0)
						.onAppear{
							withAnimation(.easeOut(duration: 1)){
								isShowingTitle = true
							}
						}
					
					HStack{
						chartCarbonMonoxideView()
						VStack(alignment: .leading){
							Text("Concentration of CO")
							TextField("ppm", value: $concentrationCO, format: .number).keyboardType(.decimalPad)
								.textFieldStyle(OutlinedTextFieldStyle())
								.focused($isActive, equals: .co)
						}
					}
					.opacity(graph1Visible ? 1 : 0)
					.onAppear{
						withAnimation(.easeIn(duration: 1.2)){
							graph1Visible = true
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
					}.opacity(graph2Visible ? 1 : 0)
						.onAppear{
						 withAnimation(.easeIn(duration: 1.3)){
							 graph2Visible = true
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
					.opacity(graph3Visible ? 1 : 0)
					.onAppear{
						withAnimation(.easeIn(duration: 1.4)){
							graph3Visible = true
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
					.opacity(graph4Visible ? 1 : 0)
					.onAppear{
						withAnimation(.easeIn(duration: 1.4)){
							graph4Visible = true
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
					}.opacity(graph5Visible ? 1 : 0)
						.onAppear{
						 withAnimation(.easeIn(duration: 1.5)){
							 graph5Visible = true
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
						
						
						NavigationLink(destination: TreesBenefit().toolbar(.hidden).navigationViewStyle(.stack), label: {
							Image(systemName: "arrow.right.circle.fill")
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: 50)
								.foregroundColor(.blue)
						})
					
					}.padding()
						.opacity(viewVisible ? 1 : 0)
						.onAppear{
							withAnimation(.easeIn(duration: 1.8)){
								viewVisible = true
							}
						}
									
						
						

					
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

//
//  DataFactory.swift
//  playingwithcharts
//
//  Created by Dhurv Dugar on 19/03/23.
//

import Foundation



struct PollutionData: Identifiable{
    var Serial: Int
    var City: String = ""
    var Datetime: String = ""
    var NO2: Double
    var CO: Double
    var SO2: Double
    var O3: Double
    var PM10: Double
    var id = UUID()
    
    init(raw: [String]) {
        Serial = Int(raw[0]) ?? 1
        City = raw[1]
        Datetime = raw[2]
        NO2 = Double(raw[3]) ?? 0
        CO = Double(raw[4]) ?? 0
        SO2 = Double(raw[5]) ?? 0
        O3 = Double(raw[6]) ?? 0
        PM10 = Double(raw[7]) ?? 0
    }
    
}


func loadCSV(from csvName: String) -> [PollutionData] {
    var csvToStruct = [PollutionData]()
    
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else{
        return []
    }
    
    var data = ""
    
    do {
        data = try String(contentsOfFile: filePath)
    } catch{
        print(error)
        return []
    }
    
    var rows = data.components(separatedBy: "\n")
    
    let columnCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    
    for row in rows{
        let csvColumn = row.components(separatedBy: ",")
        if csvColumn.count == columnCount {
            let pollutionDataStruct = PollutionData.init(raw: csvColumn)
            csvToStruct.append(pollutionDataStruct)
        }
    }
    
    
    return csvToStruct
}

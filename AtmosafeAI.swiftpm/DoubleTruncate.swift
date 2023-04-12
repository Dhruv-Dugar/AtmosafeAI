//
//  DoubleTruncation.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 03/04/23.
//

import Foundation
import SwiftUI

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

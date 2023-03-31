//
//  TreeRealityView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 30/03/23.
//

import Foundation
import SwiftUI
import SceneKit


struct TreeRealityView : View {
  var body: some View {
    let scene = SceneView(scene: SCNScene(named: "Low_Poly_Trees_new.usdz"), options: [.autoenablesDefaultLighting,.allowsCameraControl])
      
      
    
    return scene
  }
}


struct TreeRealityView_Preview: PreviewProvider {
  static var previews: some View {
    TreeRealityView()
  }
}


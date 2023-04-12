//
//  TreeRealityView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 30/03/23.
//

import Foundation
import SwiftUI
import SceneKit



struct Home : View {
    
    @State var models = [
        
        Model(id: 0, name: "Polluting Factories", modelName: "Pollution_Plant.usdz", details: "Factories and cars are significant contributors to the rise of PM 2.5 levels and emissions of harmful gases like CO, NOx, and SOx. The combustion of fossil fuels in these sources releases these pollutants into the air, leading to respiratory problems and other health issues. Reducing emissions from factories and vehicles is essential for improving air quality and protecting public health."),
        
        Model(id: 1, name: "Greener Communities", modelName: "Forest_House_lowpoly.usdz", details: "Green communities can help reduce pollution levels and improve air quality by increasing the number of trees and plants. These green spaces absorb pollutants such as PM 2.5, leading to healthier living environments. Creating more green spaces is a simple yet effective way to make a positive impact on the environment and our health."),
        
        

    ]

    @State var index = 0
    
    @State private var isNextPageButtonShowing: Bool = false
    @State private var isShowingPage: Bool = false

    var body: some View{
        
        NavigationView{
            
            VStack{
                
                SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
                
                ZStack{
                    
                    HStack{
                        
                        Button(action: {
                            
                            withAnimation{
                                
                                if index > 0{
                                    
                                    index -= 1
                                }
                            }
                            
                        }, label: {
                            
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundColor(.orange)
                                .font(.system(size: 35, weight: .bold))
                                .opacity(index == 0 ? 0.3 : 1)
                        })
                        .disabled(index == 0 ? true : false)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                            withAnimation{
                                
                                if index < models.count{
                                    
                                    index += 1
                                }
                            }
                            
                        }, label: {
                            
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.orange)
                                .font(.system(size: 35, weight: .bold))
                            // disabling button when no other data ....
                                .opacity(index == models.count - 1 ? 0.3 : 1)
                        })
                        .disabled(index == models.count - 1 ? true : false)
                    }
                    
                    Text(models[index].name)
                        .foregroundColor(.primary)
                        .font(.system(size: 45, weight: .bold))
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.vertical,30)
                
                
                VStack(spacing: 15, content: {
                    

                    
                    
                    GroupBox{
                        Text("About")
                            .font(.title2)
                            .fontWeight(.bold)

                        Text(models[index].details)
                            .font(.system(size: 22))
                            .font(.caption)
                            .multilineTextAlignment(.center)



                        Spacer()

                        if index == 1
                        {
                            VStack(alignment: .listRowSeparatorLeading){
                                NavigationLink(destination: LogoView().toolbar(.hidden).navigationViewStyle(.stack), label: {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80)
                                        .foregroundColor(.blue)
                                })
                            }
                            .opacity(isNextPageButtonShowing ? 1 : 0)
                            .onAppear{
                                withAnimation(.easeInOut(duration: 1)){
                                    self.isNextPageButtonShowing = true
                                }
                            }
                        }
                    }
                    
                    
                })
                .padding()
                
                
                Spacer(minLength: 0)
            }.opacity(isShowingPage ? 1 : 0)
                .onAppear{
                    withAnimation(.easeInOut(duration: 1)){
                        isShowingPage = true
                    }
                }
            
            
        }.navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
}

// Data Model...

struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}


struct Home_preview: PreviewProvider{
    static var previews: some View{
        Home()
    }
}

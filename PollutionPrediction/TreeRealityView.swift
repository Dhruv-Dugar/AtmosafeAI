//
//  TreeRealityView.swift
//  PollutionPrediction
//
//  Created by Dhurv Dugar on 30/03/23.
//

import Foundation
import SwiftUI
import SceneKit

// Home View...

struct Home : View {
    
    @State var models = [
        
        Model(id: 0, name: "Earth", modelName: "Forest_House_lowpoly.usdz", details: "Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating estimation and other evidence, Earth formed over 4.5 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, which is Earth's only natural satellite. Earth orbits around the Sun in 365.256 solar days."),
        
        Model(id: 1, name: "Earth", modelName: "Forest_House.usdz", details: "Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating estimation and other evidence, Earth formed over 4.5 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, which is Earth's only natural satellite. Earth orbits around the Sun in 365.256 solar days."),

    ]

    @State var index = 0
    
    @State private var isNextPageButtonShowing: Bool = false
    @State private var isShowingPage: Bool = false

    var body: some View{
        
        NavigationView{
            
            VStack{
                
                // Going to use SceneKit Scene View....
                
                // default is first object ie: Earth...
                
                // Scene View Has a default Camera View...
                // if you nedd custom means add there...
                
                SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                // for user action...
                // setting custom frame...
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
                
                ZStack{
                    
                    // Forward and backward buttons...
                    
                    HStack{
                        
                        Button(action: {
                            
                            withAnimation{
                                
                                if index > 0{
                                    
                                    index -= 1
                                }
                            }
                            
                        }, label: {
                            
                            Image(systemName: "arrow.left.circle.fill")
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
                                .font(.system(size: 35, weight: .bold))
                            // disabling button when no other data ....
                                .opacity(index == models.count - 1 ? 0.3 : 1)
                        })
                        .disabled(index == models.count - 1 ? true : false)
                    }
                    
                    Text(models[index].name)
                        .font(.system(size: 45, weight: .bold))
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.vertical,30)
                
                // Details....
                
                VStack(spacing: 15, content: {
                    
                    Text("About")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(models[index].details)
                    
                    
                    Spacer()
                    
                    if index == 1
                    {
                        VStack(alignment: .listRowSeparatorLeading){
                            NavigationLink(destination: ExplanationView().toolbar(.hidden).navigationViewStyle(.stack), label: {
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
                                self.isNextPageButtonShowing.toggle()
                            }
                        }
                    }
                    
                    
                })
                .padding()
                .opacity(isShowingPage ? 1 : 0)
                .onAppear{
                    withAnimation(.easeInOut(duration: 1)){
                        isShowingPage = true
                    }
                }
                
                Spacer(minLength: 0)
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

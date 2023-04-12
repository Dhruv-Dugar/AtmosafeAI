import SwiftUI


struct IntroView: View {
    
    @State private var isShowingPage = false
    
    var body: some View {
        
        VStack{
            NavigationView{
                ScrollView{
                    VStack(alignment: .center){
                        Section{
                            Image("logo")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 350, height: 350)
                                .padding()
                                .padding(.top, 20)
                            Spacer()
                            (
                                Text("Pollution is one of the largest issues in 2023.")
                                +
                                Text("\nIt is estimated that ")
                                +
                                Text("one in every three deaths")
                                    .foregroundColor(.red)
                                +
                                Text(" from stroke, lung cancer and heart diseases are due to Air Pollution.")
                            )
                            .multilineTextAlignment(.center)
                            .font(.system(size: 30))
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                            //
                            //                Spacer()
                            (
                                Text("AtmosafeAI aims to use the capabilities of")
                                +
                                Text(" Machine Learning")
                                    .foregroundColor(.cyan)
                                +
                                Text(" to help you decide to when to wear a mask, and alleviate the effects due to pollution, in a fun way.")
                            )
                            .multilineTextAlignment(.center)
                            .font(.system(size: 30))
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                        NavigationLink(destination: ExplanationView().toolbar(.hidden).navigationViewStyle(.stack), label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                            
                        })
                        
                        Spacer()
                        
                        (
                            Text("Reference: Air Pollution and adverse health effects \n")
                                .font(.caption)
                            
                            +
                            
                            Text("https://www.who.int/news-room/spotlight/how-air-pollution-is-destroying-our-health")
                                .font(.caption)
                        )
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding()
                        
                        Spacer()
                        
                    }
                }
                
            }
            .navigationBarHidden(true)
            .navigationViewStyle(.stack)
            
            
        }
        .opacity(isShowingPage ? 1 : 0)
        .onAppear{
            withAnimation(.easeIn(duration: 1)) {
                self.isShowingPage = true
            }
        }
        
        
        
        
    }
    
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}


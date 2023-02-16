//
//  MainView.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 05/02/2023.
//
import SwiftUI
struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}
private let onBoardingStep = [
    OnBoardingStep(image: "ON1", title: "Place an order with people nearby.", description: "Order with nearby family, friends and other people"),
    OnBoardingStep(image: "ON2", title: "Sharing price delivery.", description: "Share the cost of your order's delivery")
    ]
struct MainView: View {
    @State private var currentStep = 0
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    self.currentStep = onBoardingStep.count - 1
                }){
                    Text("Skip")
                        .padding(10)
                        .foregroundColor(.gray)
                }
                }
                //            }
                //        }
                TabView(selection: $currentStep) {
                    ForEach(0..<onBoardingStep.count) { it in
                        
                        VStack{
                            Image(onBoardingStep[it].image)
                                .resizable()
                                .frame(width: 250, height: 250)
                            
                            
                            Text(onBoardingStep[it].title)
                                .font(.title3)
                                .bold()
                                .padding(15)
                            Text(onBoardingStep[it].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                HStack{
                    ForEach(0..<onBoardingStep.count) { it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.purple)
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.bottom,24)
                Button(action:{
                    if self.currentStep < onBoardingStep.count - 1{
                        self.currentStep += 1
                        
                    } else {
                        // GET STARTED LOGIC
                    }
                }) {
                    
                    Text(currentStep < onBoardingStep.count - 1 ? "Next" : "Get Started")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(16)
                        .padding(.horizontal,16)
                        .foregroundColor(.white)
                    
                }
                .buttonStyle(PlainButtonStyle())
            
            
            
        }
    }
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}

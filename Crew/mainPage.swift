//
//  mainPage.swift
//  Crew
//
//  Created by Alaa Alabdullah on 06/02/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct mainPage: View {
    @State private var isPresentedFullScreenCover = false
    @State var orders: [Order]
    
    //    @State var orderID = ""
    //
    //    @State var RName = ""
    //    @State var Dfee = ""
    //    @State var payment = ""
    //    @State var appName = ""
    var body: some View {
        NavigationView {
            VStack {
                headerView()
                VStack(alignment: .leading) {
                    Text("My Orders")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    if orders.count > 0 {
                        
                            //                    emptyOrderCard
                            //                            myOrderCardView(orders: <#T##[Order]#>, orderID: <#T##arg#>, RName: <#T##arg#>, Dfee: <#T##arg#>, payment: <#T##arg#>, appName: <#T##arg#>)
                        
                            
                        myOrderCardView(orders: [])
                        
                        
                    } else {
                        emptyOrderCard
                    }
                    
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        VStack(alignment: .leading) {
                            Text("Active Orders Near You")
                                .font(.title2)
                                .bold()
                                .padding(.leading)
                            HStack{
                                if orders.count > 0 {
                                   
                                    ForEach(orders, id: \.id) { thisOrder in
                                        orderCardView(orders: [], RName: thisOrder.RName, Dfee: thisOrder.Dfee, payment: thisOrder.payment, appName: thisOrder.appName)
                                        
                                        
                                    }
                                } else {
                                    Text("No Orders")
                                }
                            }
                            
                            
                            .padding(.leading)
                            .padding(.bottom, 30)
                            Spacer()
                        }
                        Spacer()
                        Spacer()
                    }
                    Spacer()
                }
            }.onAppear {
                print("")
                Firestore.firestore().collection("Order")
                    .whereField("uid", isNotEqualTo: "afnan")
                    .addSnapshotListener { querySnapshot, error in
                        guard let documents = querySnapshot?.documents else {
                            print("error fetching documents \(error!)")
                            return
                        }
                        let RNames = documents.map { $0["RName"]! }
                        let Dfees = documents.map { $0["Dfee"]!}
                        let payment = documents.map { $0["payment"]! }
                        let appName = documents.map { $0["appName"]! }
                        let usid = documents.map { $0["uid"] }

    //                            print(documents)
                        self.orders.removeAll()
                        for i in 0..<RNames.count {
                            orders.append(Order(id: UUID(uuidString: documents[i].documentID) ?? UUID(),
                                   RName: RNames[i] as? String ?? "failed to get r name",
                                   Dfee: Dfees[i] as? String ?? "failed to get fee price",
                                   payment: payment[i] as? String ?? "failed to get fee price",
                                    appName: appName[i] as? String ?? "failed to get fee price",
                                 usid: usid[i] as? String ?? "failed to get uid "
                                  ))
                        }
                    }
            }
        }
    }
        var emptyOrderCard : some View {
            VStack {
                
                VStack{
                    HStack{
                        
                        //                        }
                        Text("You Have No Order Yet")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .bold()
                            .padding(.horizontal, 50.0)
                        
                        
                    }
                    
                    
                    
                    NavigationLink(destination: FORM()) {
                        Text("Create Your Order")
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color("ouryellow"))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }.navigationBarBackButtonHidden(true)
                    
                }
                //.padding()
                .frame(width: UIScreen.main.bounds.width - 20, height: 200)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color("shadow"), radius: 25, x: 0, y: 0)
                .padding(12)
                //  .padding(5)
                
            }
        }
    
}

struct mainPage_Previews: PreviewProvider {
    static var previews: some View {
        mainPage(orders: [])
    }
}

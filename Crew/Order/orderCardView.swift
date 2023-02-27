//
//  orderCard.swift
//  Crew
//
//  Created by Alaa Alabdullah on 06/02/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct orderCardView: View {
    @EnvironmentObject var userAuth: UserAuth
    @State var showChat: Bool = false
    @State var orders: [Order]
    
    @State var orderID = ""
    
    @State var RName = ""
    @State var Dfee = ""
    @State var payment = ""
    @State var appName = ""
    var body: some View {
        
        VStack {
            VStack{
                
                        HStack{
                            Text(RName)
                                .bold()
                            Spacer()
                            Image(systemName: "timer")
                            Text("4 min")
                                .font(.caption)
                            
                        }
                        .padding(.bottom, 5)
                        HStack{
                            Image(systemName: "car")
                            Text(Dfee) // add sar
                                .font(.caption)
                            Spacer()
                            Image(systemName: "dollarsign")
                            Text("6 per one")
                                .font(.caption)
                            
                        }
                        .padding(.bottom, 5)
                        HStack{
                            Image(systemName: "creditcard")
                            Text(payment) // could be more than 1 - needs editing
                                .font(.caption)
                            Spacer()
                            Image(systemName: "location")
                            Text("6.2")
                                .font(.caption)
                            
                        }
                        .padding(.bottom, 5)
                        HStack{
                            Image(systemName: "arrow.up.forward.app")
                            Text(appName)
                                .font(.caption)
                            Spacer()
                            Image(systemName: "person.3.sequence")
                            Text("3-4")
                                .font(.caption)
                            
                        }
                        .padding(.bottom)
                        
                        
                        Button {
                            //                        if !userAuth.isLoggedin {
                            //                        MainView()
                            //                    } else {
                            //                        mainPage()
                            //                    }
                            //
                            showChat = true
                        } label: {
                            
                            Text("Join")
                                .bold()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .background(Color("ouryellow"))
                                .cornerRadius(10)
                        }
                        
                        
                        //                    Button {
                        //
                        //                    } label: {
                        //
                        //
                        //                    }
                        
//                    }
//                } else {
//                    Text("No Orders")
//                }
            
                
            }
            
                .padding()
                .frame(width: 250, height: 215)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color("shadow"), radius: 25, x: 0, y: 0)
                .padding(5)
            
        }
        .onAppear {
            print("")
            Firestore.firestore().collection("Order")
                .whereField("uid", isNotEqualTo: "Alaa")
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

struct orderCardView_Previews: PreviewProvider {
    static var previews: some View {
        orderCardView(orders: [])
    }
}

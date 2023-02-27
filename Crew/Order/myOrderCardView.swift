//
//  myOrderCard.swift
//  Crew
//
//  Created by Alaa Alabdullah on 07/02/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore



struct myOrderCardView: View {
    @State var orders: [Order]
    
    @State var orderID = ""
    
    @State var RName = ""
    @State var Dfee = ""
    @State var payment = ""
    @State var appName = ""
    
    
    var body: some View {
        VStack {
            VStack{
                if orders.count > 0 {
                    ForEach(orders, id: \.id) { thisOrder in
                        
                        
                        HStack{
                            Text(thisOrder.RName)
                                .bold()
                            Spacer()
                            Image(systemName: "timer")
                            Text("4 min")
                                .font(.caption)
                            
                        }
                        .padding(.bottom, 5)
                        HStack{
                            Image(systemName: "car")
                            Text(thisOrder.Dfee) // add sar
                                .font(.caption)
                            Spacer()
                            Image(systemName: "dollarsign")
                            Text("6 per person")
                                .font(.caption)
                            
                        }
                        .padding(.bottom, 5)
                        HStack{
                            Image(systemName: "creditcard")
                            Text(thisOrder.payment) // could be more than 1 - needs editing
                                .font(.caption)
                            Spacer()
                            Image(systemName: "person.3.sequence")
                            Text("3-4")
                                .font(.caption)
                            
                        }
                        .padding(.bottom, 5)
                        HStack{
                            Image(systemName: "arrow.up.forward.app")
                            Text(thisOrder.appName)
                                .font(.caption)
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Chat")
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: 200)
                                    .frame(height: 40)
                                    .background(Color("ouryellow"))
                                    .cornerRadius(10)
                                
                            }
                            
                        }
                                       
                    }
//                    .padding()
                } else {
//                    emptyOrderCard
                    Text("Add an Order")
                }
                   
            }
                .padding(30)
                .frame(width: 360, height: 150)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color("shadow"), radius: 25, x: 0, y: 0)
                .padding([.trailing, .leading])
            Spacer()
        }
       
        .onAppear {
            print("")
            Firestore.firestore().collection("Order")
                .whereField("uid", isEqualTo: "afnan")
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

struct myOrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        myOrderCardView(orders: [])
    }
}

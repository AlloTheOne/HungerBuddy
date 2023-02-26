//
//  HomeView.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct orders: Identifiable {
    var id = UUID()
    var name: String
    var fee: String
    var usid: String
}


struct HomeView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
//    @ObservableObject var regServices: RegistrationDetails
//    @Published var userDetails: RegistrationDetails
//    @EnvironmentObject var regiServ: RegistrationViewModelImpl
    @State var orderID = ""
    
    @State var restaurantName = ""
    @State var deliveryFee = ""
    
    
    @State var restuFee: [orders]
    
    @State var showSheet = false
    @State var showActionSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            VStack(alignment: .leading, spacing: 16.0) {
                Text(" Name: \(sessionService.userDetails?.name ?? "N/A")")
            }
            VStack {
                TextField("Restaurant Name", text: $restaurantName)
                TextField("Delivery Fee", text: $deliveryFee)
                    .keyboardType(.numberPad)
                // Add new order
                Button { // use username instead
                    if let uid = sessionService.userDetails?.name {
                        let orderDictionary = [
                            "uid":uid,
                            "name":self.restaurantName,
                            "fee":self.deliveryFee
                        ]
                        let docRef = Firestore.firestore().document("order/\(UUID().uuidString)")
                        print("setting data")
                        docRef.setData(orderDictionary) { (error) in
                            if let error = error {
                                print("error = \(error)")
                            } else {
                                print("data uploaded successfully")
                                self.restaurantName = ""
                                self.deliveryFee = ""
                            }
                        }
                    } else {
                        print("error connecting ")
                    }
                    
                   
                } label: {
                    Text("order now")
                }
                
                // click on a previus order that is now a button/sheet
//                VStack {
                
                    if restuFee.count > 0 {
        
            ForEach(restuFee, id: \.id) { thisFee in
//                            if let uid = sessionService.userDetails?.name {
                    Button {
                        self.orderID = thisFee.id.uuidString
                        self.restaurantName = thisFee.name
                        self.deliveryFee = thisFee.fee
                        self.showSheet = true
                    
                    } label: {
                        HStack{
                            
                            Text("\(thisFee.name) \(thisFee.fee)")
                        }
                    
                }//here add new order
                    .sheet(isPresented: self.$showSheet) {
                        VStack {
                            Text("update your \(restaurantName) order ")
                                .font(.headline)
                            TextField("Restaurant Name", text: self.$restaurantName)
                            TextField("Delivery Fee", text: self.$deliveryFee)
                                .keyboardType(.numberPad)
                            HStack {
                                Button {
                                    if let uid = sessionService.userDetails?.name {
                                    let orderDictionary = [
                                        "uid":uid,
                                        "name":self.restaurantName,
                                        "fee":self.deliveryFee
                                    ]
                                    let docRef = Firestore.firestore().document("order/\(self.orderID)")
                                    print("setting data")
                                    docRef.setData(orderDictionary, merge: true) { (error) in
                                        if let error = error {
                                            print("error = \(error)")
                                        } else {
                                            print("data uploaded successfully")
                                            self.restaurantName = ""
                                            self.deliveryFee = ""
                                        }
                                    }
                                    } else {
                                        print("error connecting ")
                                    }
                                    self.showSheet = false
                                    // update - action sheet
                                } label: {
                                    Text("update order")
                                } .padding()
                                Button {
                                    showActionSheet = true
                                } label: {
                                    Text("Delete")
                                }
                                .padding()
                                .actionSheet(isPresented: self.$showActionSheet) {
                                    ActionSheet(title: Text("Delete"), message: Text("Sure Bruh?"), buttons: [.default( Text("Yes B!"), action: {
                                        
                                        Firestore.firestore().collection("order").document("\(self.orderID)")
                                            .delete() { err in
                                                if let err = err {
                                                    print("error removing doc: \(err)")
                                                } else {
                                                    print("success deleting file")
                                                    self.showSheet = false
                                                }
                                            }
                                        
                                    }),
                                              .cancel()
                                     ])
                                }
                            }
                        
                    }
                }
                        }
                        } else {
                            Text("add an order")
                        }
                    
                }
            .onAppear {
//                if let usid =  sessionService.userDetails?.name {
//                    print(usid)
//                    print("here")
//                    print("\(usid)")
                    Firestore.firestore().collection("order").whereField("uid", isEqualTo: "test5")
                    
                    //                print("\(usid)")
                        .addSnapshotListener { querySnapshot, error in
                            guard let documents = querySnapshot?.documents else {
                                print("error fetching documents \(error!)")
                                return
                            }
                            let names = documents.map { $0["name"]! }
                            let fees = documents.map { $0["fee"]!}
                            let usid = documents.map { $0["uid"]! }
                            print(names)
                            print(fees)
                            //                        print(uid)
                            self.restuFee.removeAll()
                            for i in 0..<names.count {
                                restuFee.append(orders(id: UUID(uuidString: documents[i].documentID) ?? UUID(),
                                                       name: names[i] as? String ?? "failed to get r name",
                                                       fee: fees[i] as? String ?? "failed to get fee price",
                                                     usid: usid[i] as? String ?? "failed to get uid "
                                                      ))
                            }
                        }
//                }
            }
            
            ButtonView(title: "Logout") {
                sessionService.logout()
            }
            
        }
        .padding(.horizontal, 16)
        .navigationTitle("Main ContentView")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(restuFee: [])
                .environmentObject(SessionServiceImpl())
        }
    }
}

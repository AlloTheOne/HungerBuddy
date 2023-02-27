//
//  FORM.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 09/02/2023.
//


import SwiftUI
import Firebase
import FirebaseFirestore

struct FORM: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var sessionService: SessionServiceImpl
    @StateObject var pinkFish = Whatever(someText: "")
    @State private var checked = true
    
    
    @State var RName: String = ""
    @State var appName: String = ""
    @State var Dfee: String = ""
    @State var payment: String = ""
    @State var notes: String = ""
    var body: some View {
        VStack(spacing: 0){
            FormHeaderView()
            
         // r name
            CustomInputView(placeholder: "Restaurant Name", text: $RName)

            // app name
            VStack(alignment: .leading) {
                        Text("What App Are You Ordering From?")
                            .font(.headline)
                            .padding(.leading)
                CustomInputView(placeholder: "App Name", text: $appName)
                    }
                
          
            // d fee
            CustomInputView(placeholder: "Delivery Fee", text: $Dfee)
            
            
            
            // payment + checkbox
            VStack(alignment: .leading){
                Text("How Can People Pay You?")
                    .font(.headline)
                    .padding(.leading)
                CustomInputView(placeholder: "Payment Method", text: $payment)
                
                HStack {
                    CheckBoxView(checked: $checked)
                    
                    Text("Save For Next Order")
                }
                
                .padding(.leading)
            }
            
            // notes
            CustomInputView(placeholder: "Notes And Comments", text: $notes)

            Spacer()
            VStack{
                // button - make it bigger - SEND
                Button {
                    if let uid = sessionService.userDetails?.usid {
                        let orderDictionary = [
                            "uid":uid,
                            "RName":self.RName,
                            "Dfee":self.Dfee,
                            "appName":self.appName,
                            "payment":self.payment
                        ]
                        let docRef = Firestore.firestore().document("Order/\(UUID().uuidString)")
                        print("setting data")
                        docRef.setData(orderDictionary) { (error) in
                            if let error = error {
                                print("error = \(error)")
                            } else {
                                print("data uploaded successfully")
                                self.RName = ""
                                self.Dfee = ""
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    } else {
                        print("error connecting ")
                    }
                    
                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color("ouryellow"))
                        .cornerRadius(10)
                }
            }
            
                .padding()
                }
        
              }
    
        }

    
    struct FORM_Previews: PreviewProvider {
        static var previews: some View {
           FORM()
        }
    }




struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

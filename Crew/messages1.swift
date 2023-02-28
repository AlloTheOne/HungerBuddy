//
//  messages1.swift
//  Crew
//
//  Created by asma abdilkreem on 04/08/1444 AH.
//

import SwiftUI

struct messages1: View {
    @State var RName: String = ""
    @State var message = ""
    @StateObject var allMessages = Messages()
    var body: some View{
        VStack{
            ZStack{
                
                HStack{
                    
//                    Button(action: {}, label: {
//                        Image (systemName: "chevron.left")
//                            .font (.system(size: 24))
//                            .foregroundColor(.white)
//                    })
//                    Spacer ()
                }
                Text(RName)
                    .font(.title).foregroundColor(.white)
                    .fontWeight(.bold)
                
                    .foregroundColor(.black)
            }
            
            
            
//            .padding(.all)
            
            VStack{
                ScrollView(.vertical, showsIndicators: false, content: {
                    ScrollViewReader{reader in
                        VStack(spacing: 40){
                            ForEach (allMessages .messages) {msg in
                        ChatBubble (msg: msg)
                            }
                        }
                        .padding(.all)
                    }
                })
                
                HStack(spacing: 15){
                    HStack(spacing: 15){
                        TextField("Message...", text: self.$message)
                        Button(action: {
                            
                            //                            imagePicker.toggle()
                            
                        }, label: {
                            Image(systemName:"photo")
                            
                            
                                .font(.system(size: 24))
                                .foregroundColor(.gray)
                        })
                    }
                    .padding (.vertical, 12)
                    .padding (.horizontal)
                    .background (Color.gray.opacity (0.06))
                    .clipShape (Capsule ())
                    
                    if message != ""{
                        Button(action: {
                            
                                                        allMessages.messages.append (Message (id: Date(),
                                                                                              message: message, myMsg: true, profilePic: "chat1", photo: nil))
                            
                            message = ""
                        }, label: {
                            Image (systemName: "paperplane.fill")
                                .font (.system(size: 22))
                            
                                .rotationEffect(.init(degrees: 45))
                                .padding (.vertical,12)
                                .padding (.leading,12)
                                .padding (.trailing,17)
                                .background (Color.black.opacity (0.07))
                                .clipShape (Circle())
                            
                        })
                    }
                }
                .padding(.top)
//                .padding(.bottom, 30)
            }
           .padding (.bottom)
//            , UIApplication.shared UIWindowScene.windows.first?.safeAreaInsets .bottom)
            .background (Color.white)
        }
//        .edgesIgnoringSafeArea(.bottom)
        .background (Color("Color") .edgesIgnoringSafeArea(.top))
//        .navigationBarBackButtonHidden(true)
        //        .fullScreenCover(isPresented:self.$imagePicker, onDismiss:{
        
        //            if self.imgData.count != 0{
        //                allMessages.writeMessage(id: Date(), msg: "", photo: self.imgData, myMsg: true, profilePic: "chat1")
        //            }
        //        }){
        //            ImagePicker(imagePicker: self.$imagePicker, imgData: self.$imgData)
        //        }
    }
        struct ChatBubble : View {
            var msg : Message
            var body: some View{
                HStack{
                    if msg.myMsg{
                        
                        
                        Spacer (minLength: 25)
                        Text (msg .message)
                           .padding (.all)
                .background (Color.black.opacity (0.06))
            .cornerRadius (15)
                        Image (msg.profilePic)
                            .resizable()
                            . frame (width: 30, height: 30)
                            .clipShape(Circle())
                    }
                        else{
                            Image (msg.profilePic)
                                .resizable()
                                . frame (width: 30, height: 30)
                                .clipShape(Circle())
                    Text (msg .message)
                    .padding (.all)
                    .background (Color.black.opacity (0.06))
                     .cornerRadius (15)
        
                        Spacer (minLength: 25)
                    }
                }
            }
        }
    }
        struct Message: Identifiable {
            var id : Date
            var message : String
            var myMsg : Bool
            var profilePic : String
            var photo: Data?
            
        }
        class Messages : ObservableObject{
            @Published var messages : [Message] = []
            func writeMessage(id: Date, msg: String, photo: Data?, myMsg: Bool, profilePic:
                              String){
                messages.append (Message(id: id, message: msg, myMsg: myMsg, profilePic:
                                            profilePic, photo: photo))
            }
        }
        
        struct messages1_Previews: PreviewProvider {
            static var previews: some View {
                let manegar = Messages()
                messages1().environmentObject(manegar)
            }
        }
//        struct ImagePicker : UIViewControllerRepresentable {
//            func makeCoordinator() -> Coordinator {
//        return ImagePicker.Coordinator(parent1: self)
//            }
//            @Binding var imagePicker : Bool
//            @Binding var imgData : Data
//
//            func makeUIViewController (context: Context) ->  UIImagePickerController{
//
//                let picker = UIImagePickerController()
//                picker.sourceType = .photoLibrary
//                picker.delegate = context.coordinator
//                return picker
//            }
//            func updateUIViewController(_ uiViewController: UIImagePickerController,
//                                        context: Context) {
//            }
//            class Coordinator :
//                NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
//                var parent : ImagePicker
//                init (parent1 : ImagePicker) {
//                    parent = parent1
//                }
//                func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//
//                    parent.imagePicker.toggle()
//                }
//                func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//                    let image = info[.originalImage] as! UIImage
//                    parent.imgData = image.jpegData(compressionQuality: 0.5)!
//                    parent.imagePicker.toggle()
//
//                }
//
//            }
//        }
    


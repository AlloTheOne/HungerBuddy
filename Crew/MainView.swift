//
//  MainView.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 05/02/2023.
//
import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth


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
    @EnvironmentObject var userAuth: UserAuth
    @State var currentNonce: String?
    @State private var currentStep = 0
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }

        
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
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
          
            
            SignInWithAppleButton(
                onRequest: { request in
                    let nonce = randomNonceString()
                                        currentNonce = nonce
                                        
                                        
                                        request.requestedScopes = [.fullName, .email]
                                        request.nonce = sha256(nonce)
                },
                onCompletion: { result in
                    switch result {
                            case .success(let authResults):
                                switch authResults.credential {
                                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                    
                                    guard let nonce = currentNonce else {
                                        fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                    }
                                    guard let appleIDToken = appleIDCredential.identityToken else {
                                        fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                    }
                                    guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                        return
                                    }
                                    
                                    let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                    Auth.auth().signIn(with: credential) { (authResult, error) in
                                        if (error != nil) {
                                            // Error. If error.code == .MissingOrInvalidNonce, make sure
                                            // you're sending the SHA256-hashed nonce as a hex string with
                                            // your request to Apple.
                                            print(error?.localizedDescription as Any)
                                            return
                                        }
                                        print("signed in")
                                        self.userAuth.login()
                                    }
                                    
                                    print("\(String(describing: Auth.auth().currentUser?.uid))")
                                default:
                                    break
                                    
                                }
                            default:
                                break
                            }
                    }
                )
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 60)
                .cornerRadius(10)
                .padding()
            
            
        }
    }
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}



//if !userAuth.isLoggedin {
//                MainView()
//            } else {
//                mainPage()
//            }

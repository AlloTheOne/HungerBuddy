//
//  RegistrationService.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import Combine
import Foundation
import Firebase
import FirebaseDatabase

enum RegistrationKey: String {
    case name
    case username
}

protocol RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImpl: RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth()
                    .createUser(withEmail: details.email,
                                 password: details.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            
                            if let uid = res?.user.uid {
                                
                                let values = [RegistrationKey.name.rawValue: details.name,
                                              RegistrationKey.username.rawValue: details.usid] as [String : Any]
                                
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }
                                
                                
                            } else {
                                promise(.failure(NSError(domain: "invalid user id", code: 0, userInfo: nil)))
                            }
                            
                        }
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

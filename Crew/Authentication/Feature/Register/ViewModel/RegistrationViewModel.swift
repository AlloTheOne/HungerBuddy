//
//  RegistrationViewModel.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import Foundation
import Combine


enum RegistrationState {
    case successfull
    case failed(error: Error)
    case na
}


protocol RegistrationViewModel {
    func register()
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationDetails { get }
    var hasError: Bool { get }
    
    init(service: RegistrationService)
}



final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    @Published var hasError: Bool = false
    @Published var state: RegistrationState = .na
    @Published var userDetails: RegistrationDetails = RegistrationDetails.new
    
    
    let service: RegistrationService
    
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubsriptions()
    }
    
    func register() {
        
        
        service
            .register(with: userDetails)
            .sink { [weak self] res in
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)

        
    }
}

private extension RegistrationViewModelImpl {
    
    func setupErrorSubsriptions() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfull,
                        .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}

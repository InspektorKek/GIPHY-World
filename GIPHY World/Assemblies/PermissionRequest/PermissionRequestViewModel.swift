//
//  PermissionRequestViewModel.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 29/11/22.
//

import Combine

final class PermissionRequestViewModel: ObservableObject {
    @Published private(set) var state: ChannelDetailFlow.ViewState = .idle
    
    weak var delegate: PermissionRequestSceneDelegate?
    
    private let eventSubject = PassthroughSubject<ChannelDetailFlow.Event, Never>()
    private let stateValueSubject = CurrentValueSubject<ChannelDetailFlow.ViewState, Never>(.idle)
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        bindInput()
        bindOutput()
    }
    
    deinit {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }

    func send(_ event: ChannelDetailFlow.Event) {
        eventSubject.send(event)
    }
    
    private func bindInput() {
        eventSubject
            .sink { [weak self] event in
                switch event {
                case .onAppear:
                    break
                case .onAskTapped:
                    self?.checkPermissions()
                }
            }
            .store(in: &subscriptions)
    }
    
    private func bindOutput() {
        stateValueSubject
            .assign(to: \.state, on: self)
            .store(in: &subscriptions)
    }
    
    private func checkPermissions() {
        let permissionType = Permission.cameraUsage
        PermissionsManager.shared.requestAccess(for: permissionType) { [weak self] isGranted in
            if isGranted {
                self?.delegate?.openMainFlow()
            } else {
                self?.delegate?.openSettingsAlert(message: permissionType.errorMessage)
            }
        }
    }
}

extension PermissionRequestViewModel: PermissionRequestContainerDelegate {
    
}

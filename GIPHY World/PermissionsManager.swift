//
//  PermissionsManager.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 19/12/22.
//

import AVFoundation
import Photos
import UIKit

enum Permission {
    private enum Constants {
        static let PHOTO_LIBRARY_PERMISSION: String = "Require access to Photo library to proceed. Would you like to open settings and grant permission to photo library?"
        static let CAMERA_USAGE_PERMISSION: String = "Require access to Camera to proceed. Would you like to open settings and grant permission to camera?"
        static let MICROPHONE_USAGE_ALERT: String = "Require access to microphone to proceed. Would you like to open Settings and grant permissiont to Microphone?"
    }
    
    case cameraUsage
    case photoLibraryUsage
    case microphoneUsage
    
    var errorMessage: String {
        switch self {
        case .cameraUsage:
            return Constants.CAMERA_USAGE_PERMISSION
        case .photoLibraryUsage:
            return Constants.PHOTO_LIBRARY_PERMISSION
        case .microphoneUsage:
            return Constants.MICROPHONE_USAGE_ALERT
        }
    }
}

protocol CameraPermissionProtocol {
    func requestAccess(for: Permission, completionHandler: @escaping (_ accessGranted: Bool) -> Void)
}

final class PermissionsManager: CameraPermissionProtocol {
    private init() { }
    
    static let shared = PermissionsManager()
    
    func requestAccess(for permission: Permission, completionHandler: @escaping (Bool) -> Void) {
        switch permission {
        case .cameraUsage:
            checkCameraAccessStatus(completionHandler: completionHandler)
        case .photoLibraryUsage:
            checkPhotoLibraryStatus(completionHandler: completionHandler)
        case .microphoneUsage:
            checkMicrophoneAccessStatus(completionHandler: completionHandler)
        }
    }
    
    private func checkPhotoLibraryStatus(completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized, .limited:
            completionHandler(true)
        case .denied:
            completionHandler(false)
        case .restricted, .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                completionHandler(status == .authorized)
            }
        @unknown default:
            fatalError()
        }
    }
    
    private func checkCameraAccessStatus(completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            completionHandler(true)
        case .denied:
            completionHandler(false)
        case .restricted, .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                completionHandler(granted)
            }
        @unknown default:
            fatalError()
        }
    }
    
    private func checkMicrophoneAccessStatus(completionHandler: @escaping (Bool) -> Void) {
        switch AVAudioSession.sharedInstance().recordPermission {
        case .granted:
            completionHandler(true)
        case .denied:
            completionHandler(false)
        case .undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                completionHandler(granted)
            }
        @unknown default:
            fatalError()
        }
    }
}


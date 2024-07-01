//
//  ScannerView.swift
//  Barcode Scanner
//
//  Created by Balogun Kayode on 27/06/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    @Binding var alertItem:AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView  = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            print (barcode)
        }
        
        func didSurFace(error: CameraError) {
            switch error {
            case.invalidDeviceInput: scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue: scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
    
}

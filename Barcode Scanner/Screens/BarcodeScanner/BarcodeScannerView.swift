//
//  ContentView.swift
//  Barcode Scanner
//
//  Created by Balogun Kayode on 26/06/2024.
//

import SwiftUI

struct BarcodeScannerView: View {
//    @State private var scannedCode = ""
//    @State private var alertItem: AlertItem?
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode:
                                $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                                
            }.navigationTitle("Barcode Scanner")
                .alert(item: $viewModel.alertItem ) {
                    alertItem in
                    Alert(title: Text(alertItem.title),
                          message: Text(alertItem.message),
                          dismissButton: alertItem.dismissButton
                    )
                }
        }
    }
}

#Preview {
    BarcodeScannerView()
}

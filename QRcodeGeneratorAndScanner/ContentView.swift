//
//  ContentView.swift
//  QRcodeGeneratorAndScanner
//
//  Created by Denis Goloborodko on 6.07.22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @State var qrString = ""
    @State var isQRCodeScannerPresented: Bool = false

    @State var scannedCode: String = ""

    var body: some View {
        Group {
            Text("QR Encoder")
                .font(.title2)
                .padding()

            TextField("Please enter a string", text: $qrString)
                .font(.title3)
                .padding()
                .background(.gray)

            if let uiImage = UIImage.qrCode(from: qrString) {
                Image(uiImage: uiImage)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
            }
        }

        Spacer()

        Group {
            Text("QR Code scanner")
                .font(.title2)
                .padding()

            TextField("Nothing scanned yet", text: $scannedCode)
                .disabled(true)
                .font(.title2)
                .padding()
                .background(.gray)

            Button {
                isQRCodeScannerPresented = true
            } label: {
                Text("QR Code Scanner")
                    .font(.title2)
                    .padding()
            }
        }
        .sheet(isPresented: $isQRCodeScannerPresented) {
            QRCodeScannerView(scannedCode: $scannedCode)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
    
}

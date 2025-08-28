
//
//  PaymentView.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode on 22/08/25.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isProcessing = false
    @State private var showSuccess = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("💳 Payment")
                .font(.largeTitle)
                .bold()
            
            if isProcessing {
                ProgressView("Processing Payment...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .green))
                    .scaleEffect(1.2)
            } else {
                VStack(spacing: 20) {
                    Text("Choose Payment Method")
                        .font(.headline)
                    
                    Button(action: {
                        processPayment()
                    }) {
                        Text("Pay with UPI")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        processPayment()
                    }) {
                        Text("Pay with Card")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $showSuccess) {
            OrderSuccessView()
        }
    }
    
    private func processPayment() {
        isProcessing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isProcessing = false
            showSuccess = true
        }
    }
}

// MARK: - Success Screen
struct OrderSuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("✅ Order Placed Successfully!")
                .font(.title)
                .bold()
                .foregroundColor(.green)
            
            Text("Thank you for your purchase.")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back to Home")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    PaymentView()
}

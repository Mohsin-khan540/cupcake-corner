//
//  AddressView.swift
//  CupcakeCorner.
//
//  Created by Mohsin khan on 11/09/2025.
//

import SwiftUI

struct AddressView: View {
   @Bindable var order : Order
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    // full name
                    TextField("Full Name", text: $order.name)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue , lineWidth: order.city.isEmpty ? 0 :2)
                            )
                        .padding(.horizontal)
                    // street info
                    TextField("Street Address", text: $order.streetAddress)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue , lineWidth: order.streetAddress.isEmpty ? 0:2)
                        )
                        .padding(.horizontal)
                    // city
                    TextField("City", text: $order.city)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue, lineWidth: order.city.isEmpty ? 0 : 2)
                        )
                        .padding(.horizontal)
                    // zip code
                    TextField("Zip Code", text: $order.zip)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue , lineWidth: order.zip.isEmpty ? 0:2)
                        )
                        .padding(.horizontal)
                   }
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Proceed to Checkout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(order.hasValidAddress ? Color.blue : Color.gray)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .disabled(order.hasValidAddress == false)
                .padding(.horizontal)
            }

            .scrollContentBackground(.hidden)

            .navigationTitle("Delievery details")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    AddressView(order: Order())
}

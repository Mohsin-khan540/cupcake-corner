//
//  CheckoutView.swift
//  CupcakeCorner.
//
//  Created by Mohsin khan on 11/09/2025.
//

import SwiftUI

struct CheckoutView: View {
    var order : Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    var body: some View {
            ScrollView{
                VStack{
                    AsyncImage(url: URL(string:"https://hws.dev/img/cupcakes@3x.jpg") , scale: 3){image in
                        image
                            .resizable()
                            .scaledToFit()
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    Text("your total is \(order.cost , format: .currency(code: "USD"))")
                        .font(.title)
                    
                    Button("place order"){
                        Task{
                            await placeOrder()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                        .padding()
                }
            }
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
            .alert("thanks you!" , isPresented: $showingConfirmation){
                Button("OK"){
                    order.name = ""
                    order.city = ""
                    order.streetAddress = ""
                    order.zip = ""
                    order.type = 0
                    order.quantity = 3
                    order.specialRequestEnabled = false
                }
            }message: {
                Text(confirmationMessage)
            }
    }
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print( "failed to encode order")
            return
        }
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            
            confirmationMessage = "Your order of \(decodedOrder.quantity)  \(Order.types[decodedOrder.type]) cupcakes has been placed."
            showingConfirmation = true

            showingConfirmation = true
        }catch{
            confirmationMessage = "fail to place order : \(error.localizedDescription)"
            showingConfirmation = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}

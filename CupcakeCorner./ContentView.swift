//
//  ContentView.swift
//  CupcakeCorner.
//
//  Created by Mohsin khan on 09/09/2025.
//

//import SwiftUI
//
//struct ContentView : View {
//    @State private var order = Order()
//    var body: some View {
//        NavigationStack{
//            List{
//            Section{
//                Text("Select favourite cake")
//            Picker("Select your cake type" , selection: $order.type){
//            ForEach(Order.types.indices , id: \.self){
//                Text(Order.types[$0])
//                        }
//                    }
//            .pickerStyle(.segmented)
//                Stepper("Number of cakes \(order.quantity)" , value: $order.quantity , in : 3...20)
//                }
//                Section{
//                    Toggle("is any special request?" , isOn: $order.specialRequestEnabled.animation())
//                    
//                    if order.specialRequestEnabled {
//                        Toggle("Add extra froasting" , isOn: $order.extraFrosting)
//                        Toggle("Add extra sprinkles" , isOn: $order.addSprinkles)
//                    }
//                }
//                Section{
//                    NavigationLink("Delivery details"){
//                        AddressView(order: order)
//                    }
//                }
//            }
//            .navigationTitle("Cupcake Corner")
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

// scroll

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 28) {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Select Your Favorite Cake")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        Picker("Select your cake type", selection: $order.type) {
                            ForEach(Order.types.indices, id: \.self) {
                                Text(Order.types[$0])
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        
                        Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                            .padding(.horizontal)
                    }
                    .padding(.vertical, 20)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Special Requests")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Toggle("Any special request?", isOn: $order.specialRequestEnabled.animation())
                            .padding(.horizontal)
                        
                        if order.specialRequestEnabled {
                            VStack{
                                Toggle("Add extra frosting", isOn: $order.extraFrosting)
                                    .padding(.horizontal)
                                Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                                    .padding(.horizontal)
                            }
                            .animation(.easeInOut(duration: 2) , value: order.specialRequestEnabled)
                        }
                            
                    }
                    .padding(.vertical, 20)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                    .padding(.horizontal)
                    
                    
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(16)
                            .shadow(color: .purple.opacity(0.3), radius: 10, x: 0, y: 4)
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.vertical)
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}

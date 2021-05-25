//
//  CheckOutView.swift
//  iDien
//
//  Created by Azizul Islam on 25/4/21.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    @State private var paymentType = "Cache"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    let paymentTypes = ["Cache","Credit card","iDian poits"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency

            let total = Double(order.total)
            let tipValue = total / 100 * Double(tipAmount)

            return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
        }
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?",selection: $paymentType){
                    ForEach(paymentTypes, id:\.self){
                        Text($0)
                    }

                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                                }
            }
            
            Section(header: Text("Add a tip?")) {
                            Picker("Percentage:", selection: $tipAmount) {
                                ForEach(tipAmounts, id: \.self) {
                                    Text("\($0)%")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
            
            Section(header:Text("TOTAL: \(totalPrice)")) {
                            Button("Confirm order") {
                                showingPaymentAlert.toggle()
                            }
                        }

            
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
                   Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
               }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView()
            .environmentObject(Order())
    }
}

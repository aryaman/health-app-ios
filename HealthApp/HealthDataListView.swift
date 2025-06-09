//
//  HealthDataListView.swift
//  HealthApp
//
//  Created by Aryaman Goel on 2025-06-08.
//

import SwiftUI

struct HealthDataListView: View {
    
    var category: HealthCategory
    @State private var isShowingAddData = false
    @State private var addDate: Date = .now
    
    var body: some View {
        List {
            ForEach(0..<50) { _ in
                HStack {
                    Text(Date(), format: .dateTime.month().day().year())
                    
                    Spacer()
                    
                    Text(10000, format: .number.precision(.fractionLength(category.decimalPoints)))
                }
            }
        }
        .navigationTitle(category.title)
        .toolbar {
            Button("add data", systemImage: "plus") {
                isShowingAddData = true
            }
        }
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
    }
    
    var addDataView: some View {
        NavigationStack {
            Form {
                DatePicker("Date", selection: $addDate, displayedComponents: .date)
                HStack {
                    Text("Value")
                    Spacer()
                    TextField("Value", text: .constant(""))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 100)
                        .keyboardType(category.keyboardType)
                }
                
            }
            .navigationTitle(category.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Dismiss") {
                        isShowingAddData = false
                    }
                    .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataListView(category: .steps)
    }
}

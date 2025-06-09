//
//  ContentView.swift
//  HealthApp
//
//  Created by Aryaman Goel on 2025-06-07.
//

import SwiftUI
import Charts

enum HealthCategory: CaseIterable, Identifiable {
    var id: Self { self }
    
    case steps
    case weight
    
    var title: String {
        switch self {
        case .steps:
            return "Steps"
        case .weight:
            return "Weight"
        }
    }
    
    var colorTint: Color {
        switch self {
        case .steps:
            return .pink
        case .weight:
            return .indigo
        }
    }
    
    var decimalPoints: Int {
        switch self {
        case .steps:
            return 0
        case .weight:
            return 1
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .steps:
            return .numberPad
        case .weight:
            return .decimalPad
        }
    }
}

struct DashboardView: View {
    
    @State private var selectedCategory: HealthCategory = .steps
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    Picker("category", selection: $selectedCategory) {
                        ForEach(HealthCategory.allCases) { category in
                            Text(category.title)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    NavigationLink(value: selectedCategory) {
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Label(selectedCategory.title, systemImage: "figure.walk")
                                        .font(.headline)
                                        .foregroundStyle(selectedCategory.colorTint)
                                    Text("Avg: 10K Steps")
                                        .font(.caption)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .padding(.bottom, 12)
                            
                            Chart {
                                LineMark(x: .value("yo", 0), y: .value("yo", 1))
                                LineMark(x: .value("yo", 1), y: .value("yo", 3))
                                LineMark(x: .value("yo", 2), y: .value("yo", 2))
                                LineMark(x: .value("yo", 3), y: .value("yo", 4))
                            }
                            .frame(height: 150)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                    }
                    .foregroundStyle(.secondary)
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Label("Averages", systemImage: "calendar")
                                .font(.headline)
                                .foregroundStyle(selectedCategory.colorTint)
                            Text("Last 28 Days")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 240)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                }
            }
            .padding()
            .navigationTitle("Dashboard")
            .navigationDestination(for: HealthCategory.self) { category in
                HealthDataListView(category: selectedCategory)
            }
        }
        .tint(selectedCategory.colorTint)
    }
}

#Preview {
    DashboardView()
}

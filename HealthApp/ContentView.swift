//
//  ContentView.swift
//  HealthApp
//
//  Created by Aryaman Goel on 2025-06-07.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Label("Steps", systemImage: "figure.walk")
                                    .font(.headline)
                                    .foregroundStyle(.pink)
                                Text("Avg: 10K Steps")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 150)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Label("Averages", systemImage: "calendar")
                                .font(.headline)
                                .foregroundStyle(.pink)
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
        }
    }
}

#Preview {
    ContentView()
}

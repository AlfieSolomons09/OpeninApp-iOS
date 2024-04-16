//
//  LineChart.swift
//  Project
//
//  Created by Chetan Choudhary on 15/04/24.
//

import SwiftUI
import Charts

struct LineChart: View {
    
    var viewData: [ViewData] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), value: 25),
        .init(date: Date.from(year: 2023, month: 2, day: 1), value: 34),
        .init(date: Date.from(year: 2023, month: 3, day: 1), value: 59),
        .init(date: Date.from(year: 2023, month: 4, day: 1), value: 77),
        .init(date: Date.from(year: 2023, month: 5, day: 1), value: 75),
        .init(date: Date.from(year: 2023, month: 6, day: 1), value: 100),
        .init(date: Date.from(year: 2023, month: 7, day: 1), value: 50),
        .init(date: Date.from(year: 2023, month: 8, day: 1), value: 25),
        .init(date: Date.from(year: 2023, month: 9, day: 1), value: 100),
        .init(date: Date.from(year: 2023, month: 10, day: 1), value: 65),
        .init(date: Date.from(year: 2023, month: 11, day: 1), value: 43),
        .init(date: Date.from(year: 2023, month: 12, day: 1), value: 25),
    ]

    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color.white)
                .frame(width: 380, height: 270)
            VStack{
                HStack{
                    Text("Overview")
                        .foregroundStyle(Color(hex:"#999CA0"))
                        .padding()
                    Spacer()
                }
                Chart{
                    RuleMark(y: .value("Goal", 77))
                        .foregroundStyle(Color.red)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                        .annotation(alignment:.trailing) {
                            Text("Goal")
                                .font(.caption)
                                .foregroundColor(Color.secondary)
                        }
                    ForEach(viewData) { viewData in
                        LineMark(x: .value("Month", viewData.date, unit: .month), y: .value("Views", viewData.value))
                            .lineStyle(StrokeStyle(lineWidth: 3))
                            .shadow(color: Color.blue.opacity(0.7), radius: 5, x: 0, y: 0)
                    }
                }
                .frame(height: 180)
                .chartXAxis{
                    AxisMarks(values: viewData.map {$0.date}) { date in
                        AxisGridLine()
                        AxisValueLabel(format: .dateTime.month())
                    }
                }
                .chartYAxis{
                    AxisMarks(position: .leading)
                }
    //            .chartPlotStyle { plotContent in
    //                plotContent
    //                    .background(.mint.gradient.opacity(0.1))
    //            }
            }
            .padding()
//            .onAppear{
//                test()
//            }
        }
    }
}

struct ViewData: Identifiable{
    let id = UUID()
    let date: Date
    let value: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date{
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}

#Preview {
    LineChart()
}

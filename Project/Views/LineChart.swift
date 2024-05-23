import SwiftUI
import Charts

struct LineChart: View {
    @StateObject var networkManager = NetworkManager()
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.white)
                    .frame(width: 380, height: 270)
                
                if !networkManager.chartData.isEmpty {
                    VStack {
                        HStack {
                            Text("Overview")
                                .foregroundStyle(Color(hex: "#999CA0"))
                                .padding()
                            Spacer()
                        }
                        Chart {
                            RuleMark(y: .value("Goal", 10))
                                .foregroundStyle(Color.red)
                                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                                .annotation(alignment: .trailing) {
                                    Text("Goal")
                                        .font(.caption)
                                        .foregroundColor(Color.secondary)
                                }
                            ForEach(networkManager.chartData.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                if let time = DateFormatter.customTimeFormatter.date(from: key),
                                   let value = value as? Int {
                                    LineMark(x: .value("Time", time, unit: .hour), y: .value("Views", value))
                                        .lineStyle(StrokeStyle(lineWidth: 3))
                                        .shadow(color: Color.blue.opacity(0.7), radius: 5, x: 0, y: 0)
                                }
                            }
                            
                        }
                        .frame(height: 180)
                        .chartXAxis {
                            AxisMarks(values: networkManager.chartData.keys.sorted().compactMap { DateFormatter.customTimeFormatter.date(from: $0) }) { time in
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.hour(.twoDigits(amPM: .omitted)))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(position: .leading)
                        }
                    }
                    .padding()
                }
                else{
                    Text("Chart Loading")
                }
            }
        }
        .onAppear{
            networkManager.fetchDashboardData()
        }
    }
}

extension DateFormatter {
    static let customTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
}

#Preview {
    LineChart()
}

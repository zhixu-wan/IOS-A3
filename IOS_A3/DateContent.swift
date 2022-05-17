//
//  ContentView.swift
//  Shared
//
//  Created by ZhengYZe on 2022/5/17.
//

import SwiftUI

struct Datecontent: View {
    @State var dateSelected = Date();
    @State var time = Date();
    
    var dateFromatter:DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }
    var timeFromatter:DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .none
        df.timeStyle = .medium
        return df
    }
    let minDate = Calendar.current.date(byAdding: .day, value: 0 ,to: Date())!
    let maxDate = Calendar.current.date(byAdding: .day, value: 20 ,to: Date())!
    
    var body: some View{
        VStack{
            Text("Today is: ")
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.primary)
            DatePicker("", selection: $dateSelected, in:minDate...maxDate, displayedComponents: .date).labelsHidden()
                

            
            Text("Time selceted: \(time, formatter: timeFromatter)")
            Form{
                Section(header: Text("Date Picker")){
                    Text("Date picker in form")
                    DatePicker("Pick a date:", selection: $dateSelected, displayedComponents: .date)
                    DatePicker("Pick time:", selection: $time, displayedComponents: .hourAndMinute)
                    
                }
            }
            Spacer()
        }
    }
}
struct DateContent_Previews: PreviewProvider{
    static var previews: some View{
        Datecontent()
            .preferredColorScheme(.dark)
    }
}


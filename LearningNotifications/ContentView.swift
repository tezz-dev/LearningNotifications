//
//  ContentView.swift
//  LearningNotifications
//
//  Created by tezz on 26/11/20.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    var daysDict = [
        "Sun" : 1,
        "Mon" : 2,
        "Tue" : 3,
        "Wed" : 4,
        "Thu" : 5,
        "Fri" : 6,
        "Sat" : 7
    ]
    
    var body: some View {
        VStack {
            
            Button(action: {
                setNotification()
            }) {
                Text("Click")
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black, radius: 3, x: 0, y: 0)
        }
        
    }
    
    
    func setNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "The title"
        content.body = "The content"
        
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.weekday = 5
        dateComponents.hour = 20
        dateComponents.minute = 19
        
        print(Calendar.current.dateComponents([.weekday, .hour, .minute], from: Date()))
        print(dateComponents)
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error without description")
                print(error.debugDescription)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


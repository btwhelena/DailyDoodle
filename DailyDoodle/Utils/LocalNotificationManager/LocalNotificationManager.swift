//
//  LocalNotificationManager.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 03/12/22.
//

import Foundation
import NotificationCenter
import UserNotifications

@MainActor
class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isGrated = false

    override init() {
        super.init()
        notificationCenter.delegate = self
    }

    func scheduleNotification(scheduleDate: Date) async {
        try? await requestNotification()
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: scheduleDate)
        let notification = LocalNotification(identifier: UUID().uuidString, title: "Daily Doodle", body: self.getLocalizedMessage(), dateComponents: dateComponents, repeats: true)
        try? await schedule(localNotification: notification)
    }

    func getLocalizedMessage() -> String {


        if Locale.current.language.languageCode != nil {

            let deviceLanguage = Locale.current.language.languageCode!.identifier

            switch deviceLanguage {
            case "pt":
                return "Hora de desenhar! 🎨";
            case "es":
                return "¡Hora de dibujar! 🎨"
            case "fr":
                return "C'est l'heure de dessiner ! 🎨"
            case "it":
                return "È ora di disegnare! 🎨"
            default:
                return "Time to doodle! 🎨"
            }
        }
        return "Time to doodle! 🎨"

    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.sound, .badge, .alert]
    }

    func requestNotification() async throws{
        try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
        await getCurrentSettings()
    }

    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isGrated = (currentSettings.authorizationStatus == .authorized)
    }

    func deleteAllPendingNotifications() {
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }

    func schedule(localNotification: LocalNotification) async throws {
        let content = UNMutableNotificationContent()
        content.title = localNotification.title
        content.body = localNotification.body
        content.sound = .default


        guard let dateComponents = localNotification.dateComponents else { return }
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: localNotification.repeats)
        let request = UNNotificationRequest(identifier: localNotification.identifier, content: content, trigger: trigger)
        deleteAllPendingNotifications()
        try? await notificationCenter.add(request)
        print([request])
    }
}


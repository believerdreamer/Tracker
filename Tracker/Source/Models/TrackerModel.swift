//
//  TrackerModel.swift
//  Tracker
//
//  Created by Архип Семёнов on 19.06.2024.
//

import SwiftUI

struct Tracker {
    
    let id: Int
    let name: String
    let color: UIColor
    let emoji: String
    let shedule: Shedule
    
    struct Shedule {
        
        let mon: String
        let tue: String
        let wed: String
        let thu: String
        let fri: String
        let sat: String
        let sun: String
        
        init(
            mon: String,
            tue: String,
            wed: String,
            thu: String,
            fri: String,
            sat: String,
            sun: String
        ){
            self.mon = "Понедельник"
            self.tue = "Вторник"
            self.wed = "Среда"
            self.thu = "Четверг"
            self.fri = "Пятница"
            self.sat = "Суббота"
            self.sun = "Воскресенье"
        }
    }
}

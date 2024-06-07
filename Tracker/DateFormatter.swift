//
//  DateFormatter.swift
//  Tracker
//
//  Created by Архип Семёнов on 07.06.2024.
//

import Foundation

func formattedDate(from date: Date) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "dd.MM.yy"
       return dateFormatter.string(from: date)
   }

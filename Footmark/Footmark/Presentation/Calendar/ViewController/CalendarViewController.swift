//
//  CalendarViewController.swift
//  Footmark
//
//  Created by 문인호 on 10/31/23.
//

import UIKit

final class CalendarViewController: UIViewController {
    lazy var calendarView: CalendarView = {
        let view = CalendarView()
        return view
    }()
    
    var selectedDate: DateComponents? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(calendarView)
        calendarView.frame = view.bounds
        
        setCalendar()
        reloadDateView(date: Date())
    }

    fileprivate func setCalendar() {
        calendarView.dateView.delegate = self

        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.dateView.selectionBehavior = dateSelection
    }
    
    func reloadDateView(date: Date?) {
        if date == nil { return }
        let calendar = Calendar.current
        calendarView.reloadDateView(date: calendar.date(from: calendar.dateComponents([.day, .month, .year], from: date!)))
    }
}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    // UICalendarView
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        if let selectedDate = selectedDate, selectedDate == dateComponents {
            return .customView {
                let label = UILabel()
                label.text = "🐶"
                label.textAlignment = .center
                return label
            }
        }
        return nil
    }
    
    // 달력에서 날짜 선택했을 경우
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        selection.setSelected(dateComponents, animated: true)
        selectedDate = dateComponents
        reloadDateView(date: Calendar.current.date(from: dateComponents!))
    }
}


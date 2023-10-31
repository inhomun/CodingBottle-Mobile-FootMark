//
//  CalendarView.swift
//  Footmark
//
//  Created by 문인호 on 10/31/23.
//
import UIKit
import SnapKit

final class CalendarView: UIView {
    lazy var dateView = UICalendarView()
    lazy var retrospectListView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setLayout()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        dateView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.wantsDateDecorations = true
            }
        retrospectListView.do {_ in 
            
        }
    }
    private func setLayout() {
        addSubviews(dateView, retrospectListView)
        
        dateView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        retrospectListView.snp.makeConstraints { 
            $0.top.equalTo(dateView.snp.bottom).offset(10)
        }
    }
    
    func reloadDateView(date: Date?) {
        if date == nil { return }
        let calendar = Calendar.current
        dateView.reloadDecorations(forDateComponents: [calendar.dateComponents([.day, .month, .year], from: date!)], animated: true)
    }
}

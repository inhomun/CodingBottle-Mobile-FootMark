//
//  CalendarView.swift
//  Footmark
//
//  Created by 문인호 on 11/10/23.
//
import UIKit
import SnapKit

final class CalendarView: UIView {
    lazy var dateView = UICalendarView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUI() {
        dateView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.wantsDateDecorations = true
            }
    }
    private func setLayout() {
        addSubviews(dateView)
        
        dateView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
    }
}

//
//  CalendarViewController.swift
//  Footmark
//
//  Created by 문인호 on 10/31/23.
//
import UIKit

final class CalendarViewController: UIViewController {
    
    //MARK: - UI Components

    private let calendarView = UICalendarView()
    private lazy var retrospectTableView = UITableView()
    private let dummy = retrospectDataModel.dummy()
    var selectedDate: DateComponents? = nil
    var isGood: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setRegister()
        setDelegate()
//        addTarget()
        setCalendar()
        reloadDateView(date: Date())
    }
}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate, UITableViewDelegate,UITableViewDataSource {
    
    // MARK: - UI Components Property

    private func setUI() {
        
        calendarView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.wantsDateDecorations = true
            }
        retrospectTableView.do {
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .singleLine
        }
    }
    
    private func setLayout() {
        
        view.addSubviews(calendarView, retrospectTableView)

        calendarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        retrospectTableView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setDelegate() {
        retrospectTableView.delegate = self
        retrospectTableView.dataSource = self
        calendarView.delegate = self
    }
    
    fileprivate func setCalendar() {
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
    }
    
    func reloadDateView(date: Date?) {
        if date == nil { return }
        let calendar = Calendar.current
        calendarView.reloadDecorations(forDateComponents: [calendar.dateComponents([.day, .month, .year], from: date!)], animated: true)    }

    private func setRegister() {
        retrospectTableView.register(retrospectTableViewCell.self,
                           forCellReuseIdentifier:"retrospectTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: retrospectTableViewCell.identifier, for: indexPath) as? retrospectTableViewCell else { return UITableViewCell() }
                
                cell.configureCell(dummy[indexPath.row])
                
                return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        if let selectedDate = selectedDate, selectedDate == dateComponents {
            return .customView {
                let label = UILabel()
                label.text = self.isGood ? "🐶" : "🐷"
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

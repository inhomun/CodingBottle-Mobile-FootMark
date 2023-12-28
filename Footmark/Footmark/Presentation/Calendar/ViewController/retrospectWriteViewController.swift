//
//  retrospectWriteViewController.swift
//  Footmark
//
//  Created by 문인호 on 12/24/23.
//

import UIKit

class retrospectWriteViewController: UIViewController {

    
    private let calendarView = UICalendarView()
    private let titleTextView = UITextView()
    private let contentTextView = UITextView()
    private lazy var retrospectTableView = UITableView()
    private let dummy = retrospectDataModel.dummy()
    var selectedDate: DateComponents? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setNavigate()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
        titleTextView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = UIFont.boldSystemFont(ofSize: 24)

        }
        contentTextView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = UIFont.systemFont(ofSize: 18)
        }
    }
    private func setLayout() {
        
        view.addSubviews(titleTextView, contentTextView)

        titleTextView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(titleTextView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    private func setNavigate() {
            let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelTapped))
            navigationItem.leftBarButtonItem = cancelButton
            let saveButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveTapped))
            navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveTapped() {
        // 'Button 2'이 눌렸을 때의 동작을 여기에 작성합니다.
    }


}

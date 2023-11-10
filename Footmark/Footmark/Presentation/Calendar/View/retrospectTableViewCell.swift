//
//  retrospectTableViewCell.swift
//  Footmark
//
//  Created by 문인호 on 11/8/23.
//

import UIKit

import SnapKit
import Then

class retrospectTableViewCell: UITableViewCell {
    
    //MARK: - UI Components

    static let identifier = "retrospectTableViewCell"
    private let footPrintImage = UIImageView()
    private let retrospectTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UI Components Property
    
    private func setStyle() {
        separatorInset.left = 0
        selectionStyle = .none
        footPrintImage.do {
            $0.roundCorners(cornerRadius: 6, maskedCorners: .layerMaxXMaxYCorner)
        }
        retrospectTitleLabel.do {
            $0.font = UIFont.systemFont(ofSize: 20)
        }
    }
    private func setLayout() {
        addSubviews(footPrintImage, retrospectTitleLabel)
        
        footPrintImage.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        retrospectTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(footPrintImage.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()

        }
    }
    
    func configureCell(_ retrospect: retrospectDataModel) {
            
        footPrintImage.image = retrospect.feeling.image
        retrospectTitleLabel.text = retrospect.retrospectTitleLabel
        
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

//
//  CollectionViewCell.swift
//  Voice AI
//
//  Created by Dinmukhammed Begaly on 23.03.2024.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial Bold", size: 12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupConstraints()
    }

    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? UIColor(named: "MainColor") : .darkGray
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(_ text: String) {
        self.label.text = text
    }
    private func setupUI() {
        backgroundColor = .darkGray
        layer.cornerRadius = 20
        addSubview(label)
    }

    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

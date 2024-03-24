//
//  AIVoicesCollectionViewCell.swift
//  Voice AI
//
//  Created by Dinmukhammed Begaly on 24.03.2024.
//

import UIKit

class AIVoicesCollectionViewCell: UICollectionViewCell {
    
    private lazy var voiceIamge: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var voiceTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 14)
        title.textAlignment = .center

        return title
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

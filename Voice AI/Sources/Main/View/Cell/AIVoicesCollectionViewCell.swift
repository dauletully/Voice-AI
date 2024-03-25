//
//  AIVoicesCollectionViewCell.swift
//  Voice AI
//
//  Created by Dinmukhammed Begaly on 24.03.2024.
//

import UIKit
import SnapKit

final class AIVoicesCollectionViewCell: UICollectionViewCell {

    static let identifierVoices = "voiceCell"

    //MARK: - UI elemnts
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
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup
    private func setupUI() {
        addSubview(voiceIamge)
        addSubview(voiceTitle)
        self.clipsToBounds = true
    }
    private func setupConstraints() {
        voiceIamge.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.7)
            make.top.right.left.equalToSuperview()
        }

        voiceTitle.snp.makeConstraints { make in
            make.top.equalTo(voiceIamge.snp.bottom).offset(14)
            make.right.left.equalToSuperview()
        }
    }

    //MARK: - Configure cells
    public func configureCell(_ image: UIImage, _ title: String) {
        self.voiceIamge.image = image
        self.voiceTitle.text = title
    }
}

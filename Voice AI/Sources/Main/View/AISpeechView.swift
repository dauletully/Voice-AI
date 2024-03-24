//
//  AISpeechView.swift
//  Voice AI
//
//  Created by Dinmukhammed Begaly on 21.03.2024.
//

import UIKit
import SnapKit

protocol SelectCollectionDelegate: AnyObject {
    func showElementsCollection(nameCategory: String)
}

class AISpeechView: UIView {

    private let nameCategoriesArray = ["🔥 Hot", "🎤My Voices", "🍎Character", "🎹Music", "🎭Actor", "👔Political"]
    weak var delegate: SelectCollectionDelegate?

    //MARK: - View elements
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .darkGrey
        textField.attributedPlaceholder = NSAttributedString(
            string: "Write your text here and then select a voice from below...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textColor = .white
        textField.layer.cornerRadius = 15

        return textField
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Select AI Voice"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)

        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.minimumInteritemSpacing = 20
        categoryLayout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: categoryLayout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .none
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.selectItem(at: [0,0], animated: true, scrollPosition: [])


        return collectionView
    }()


//MARK: - Lifecycle App
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(textField)
        addSubview(label)
        addSubview(collectionView)
    }

//MARK: - Constraints
    private func constraintsUI() {
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }

        label.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(30)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }
}

//MARK: - Extensions
extension AISpeechView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameCategoriesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(nameCategoriesArray[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemText = nameCategoriesArray[indexPath.row]
        delegate?.showElementsCollection(nameCategory: itemText)
    }
}

extension AISpeechView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let categoryTextFont = UIFont(name: "Arial Bold", size: 12)
        let categoryAttributes = [NSAttributedString.Key.font : categoryTextFont as Any]
        let categoryWidth = nameCategoriesArray[indexPath.row].size(withAttributes: categoryAttributes).width + 20

        return CGSize(width: categoryWidth, height: collectionView.frame.height)
    }
}




import UIKit
import SnapKit

class QuestionsView: UIView {
   private var allQuestionsLabel = UILabel()
   private var totalQuestionsLabel = UILabel()
   private var gamesPlayedLabel = UILabel()
   private var playButton = CustomButton(title: "Play", font: AppFonts.inter14SemiBold)
  private var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.backgroundPrimaryColor
        setupViews()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuestionsView {
    func setupViews() {
        addSubview(allQuestionsLabel)
        addSubview(totalQuestionsLabel)
        addSubview(gamesPlayedLabel)
        addSubview(playButton)
        addSubview(collectionView)
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
    }
}

extension QuestionsView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as! TopicCollectionViewCell
        cell.configure(with: sections[indexPath.section].items[indexPath.item])
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.size.width - 40) / 2, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! HeaderView
            header.configure(with: sections[indexPath.section].title)
            return header
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.size.width, height: 40)
    }
    
}

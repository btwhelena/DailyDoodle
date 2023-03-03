// MARK: - CatPhasesModel

import Foundation

struct DescriptionModel: Codable {
    let descriptions: [ImageDescription]

    static func loadJson() -> [ImageDescription]? {
        guard let databaseInstance = Bundle.main.path(
            forResource: "ImagensDescription",
            ofType: "json"
        ) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: databaseInstance), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(DescriptionModel.self, from: data)
            return jsonData.descriptions
        } catch {
            print(error.localizedDescription)
        }

        return nil
    }
}

// MARK: - Phrase
struct ImageDescription: Codable {
    let name: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
    }
}

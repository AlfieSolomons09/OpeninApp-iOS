import Foundation

struct DashboardResponse: Codable {
    let appliedCampaign: Int
    let data: DashboardData
    let extraIncome: String
    let linksCreatedToday: Int
    let message: String
    let startTime: String
    let status: Int
    let statusCode: Int
    let supportWhatsappNumber: Int
    let todayClicks: Int
    let topLocation: String
    let topSource: String
    let totalClicks: Int
    let totalLinks: Int

    enum CodingKeys: String, CodingKey {
        case appliedCampaign = "applied_campaign"
        case data
        case extraIncome = "extra_income"
        case linksCreatedToday = "links_created_today"
        case message
        case startTime
        case status
        case statusCode
        case supportWhatsappNumber = "support_whatsapp_number"
        case todayClicks = "today_clicks"
        case topLocation = "top_location"
        case topSource = "top_source"
        case totalClicks = "total_clicks"
        case totalLinks = "total_links"
    }
}

struct DashboardData: Codable {
    let favouriteLinks: [FavouriteLink]
    let overallUrlChart: [String: Int]
    let recentLinks: [Link1]
    let topLinks: [Link1]

    enum CodingKeys: String, CodingKey {
        case favouriteLinks = "favourite_links"
        case overallUrlChart = "overall_url_chart"
        case recentLinks = "recent_links"
        case topLinks = "top_links"
    }
}

struct FavouriteLink: Codable {
    // Define properties if needed
}

struct Link1: Codable, Identifiable {
    let id: Int
    let app: String
    let createdAt: String
    let domainId: String
    let isFavourite: Int
    let originalImage: String
    let smartLink: String
    let thumbnail: String?
    let timesAgo: String
    let title: String
    let totalClicks: Int
    let urlPrefix: String?
    let urlSuffix: String
    let webLink: String

//    enum CodingKeys: String, CodingKey {
//        case id = "url_id"
//        case app
//        case createdAt = "created_at"
//        case domainId = "domain_id"
//        case isFavourite = "is_favourite"
//        case originalImage = "original_image"
//        case smartLink = "smart_link"
//        case thumbnail
//        case timesAgo = "times_ago"
//        case title
//        case totalClicks = "total_clicks"
//        case urlPrefix = "url_prefix"
//        case urlSuffix = "url_suffix"
//        case webLink = "web_link"
//    }
    
    init(dict: [String: Any]) {
            self.id = dict["url_id"] as? Int ?? 1
            self.app = dict["app"] as? String ?? ""
            self.createdAt = dict["created_at"] as? String ?? ""
            self.domainId = dict["domain_id"] as? String ?? ""
            self.isFavourite = dict["is_favourite"] as? Int ?? 0
            self.originalImage = dict["original_image"] as? String ?? ""
            self.smartLink = dict["smart_link"] as? String ?? ""
            self.thumbnail = dict["thumbnail"] as? String
            self.timesAgo = dict["times_ago"] as? String ?? ""
            self.title = dict["title"] as? String ?? ""
            self.totalClicks = dict["total_clicks"] as? Int ?? 0
            self.urlPrefix = dict["url_prefix"] as? String
            self.urlSuffix = dict["url_suffix"] as? String ?? ""
            self.webLink = dict["web_link"] as? String ?? ""
        }
}

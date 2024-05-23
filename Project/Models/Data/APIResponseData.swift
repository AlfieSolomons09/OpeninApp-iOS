import Foundation


struct ApiResponse: Codable {
    let appliedCampaign: Int
    let extraIncome: Double
    let totalClicks: Int
    let data: DataObject
    let totalLinks: Int
    let statusCode: Int
    let supportWhatsappNumber: Int
    let linksCreatedToday: Int
    let topLocation: String
    let message: String
    let startTime: String
    let status: Int
    let topSource: String
    let todayClicks: Int
    
    private enum CodingKeys: String, CodingKey {
        case appliedCampaign = "applied_campaign"
        case extraIncome = "extra_income"
        case totalClicks = "total_clicks"
        case data
        case totalLinks = "total_links"
        case statusCode
        case supportWhatsappNumber = "support_whatsapp_number"
        case linksCreatedToday = "links_created_today"
        case topLocation = "top_location"
        case message
        case startTime
        case status
        case topSource = "top_source"
        case todayClicks = "today_clicks"
    }
}

struct DataObject: Codable {
    let favouriteLinks: [String]
    let overallUrlChart: [String: Int]
    let recentLinks: [Link]
    let topLinks: [Link]
    
    private enum CodingKeys: String, CodingKey {
        case favouriteLinks = "favourite_links"
        case overallUrlChart = "overall_url_chart"
        case recentLinks = "recent_links"
        case topLinks = "top_links"
    }
}

struct Link: Codable {
    let app: String?
    let created_at: String?
    let domain_id: String?
    let is_favourite: Int?
    let original_image: String?
    let smart_link: String?
    let thumbnail: String?
    let times_ago: String?
    let title: String?
    let total_clicks: Int?
    let url_id: Int?
    let url_prefix: String?
    let url_suffix: String?
    let web_link: String?
}

module ApplicationHelper
  def restaurant_jsonld(restaurant)
    {
      "@context": "http://schema.org",
      "@type": "Restaurant",
      "name": restaurant.restaurant_name,
      "description": "Text",
      "image": "ImageObject",

      # Add others properties if needed
    }.to_json.html_safe
  end
end

module ApplicationHelper
  def restaurant_jsonld(restaurant)
    {
      "@context": "http://schema.org",
      "@type": "Restaurant",
      "name": restaurant.restaurant_name,
      "description": "Text",
      "hasMenu": "Menu",
      
      # Ajout d'autres propriétés ici selon les besoins
    }.to_json.html_safe
  end
end

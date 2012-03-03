require 'open-uri'
require 'json'

class Zappos

  @@api_key = "dafa6d39a387344ebf8582bb58806d535ce47dce"

  def self.get_response(path = "", query = {})

    query["key"] = @@api_key

    query_list = []
    query.each_pair{|k,v| query_list << "#{k}=#{v}"}

    query_string = URI.escape(query_list.join("&"))

    url = "http://api.zappos.com" + path + "?" + query_string
   
    JSON.parse(open(url).read)
    
  end

  def self.get_pants(search_term = "")
    
    num_pants = self.get_response("/Search", {"term" => "pants " + search_term})["totalResultCount"]
   
    num_pages = num_pants.to_i / 10
    page_to_get = rand(num_pages)

    pants = self.get_response("/Search", {"term" => "pants " + search_term, "page" => page_to_get})["results"] 

  end

  def self.get_random_pant(search_term = "")

    pant = self.get_pants(search_term).sample
    large_image_url = self.get_response("/Image", {"styleId" => pant["styleId"], "recipe" => "[\"DETAILED\"]"})[pant["styleId"]][0]["filename"]

    pant["largeImageUrl"] = large_image_url
    return pant

  end
end

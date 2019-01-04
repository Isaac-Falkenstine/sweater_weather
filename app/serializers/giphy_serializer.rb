class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attributes :summary,
             :time,
             :url
end

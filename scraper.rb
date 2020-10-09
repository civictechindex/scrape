require 'httparty'

accessToken = ENV['GITHUB_PAT']

@headers = { "Accept" => "application/vnd.github.mercy-preview+json", "Authorization" => "Bearer #{accessToken}"}

response = HTTParty.get('https://api.github.com/search/repositories', {
    :headers => @headers,
    :query => { 'q' => 'topic:civictechindex', 'sort' => 'updated', 'order' => 'asc', 'per_page' => 100}
})


json = JSON.parse(response.body)
json['items'].each do |i|
    i['languages'] = JSON.parse(HTTParty.get(i['languages_url'], {:headers => @headers}).body)
    i['issues'] = JSON.parse(HTTParty.get(i['issues_url'].split("{")[0], {:headers => @headers}).body)
end; nil;

File.open("output.json","w") do |f|
    f.write(json.to_json)
end
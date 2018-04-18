json.array! (1..@tables) do |table|
  json.id table
  json.name "Mesa #{table}"
end

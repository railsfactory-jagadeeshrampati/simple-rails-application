json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :days, :completion_date
  json.url project_url(project, format: :json)
end

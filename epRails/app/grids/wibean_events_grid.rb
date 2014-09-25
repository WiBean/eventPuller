class WibeanEventsGrid

  include Datagrid

  scope do
    WibeanEventV1
  end

  filter(:hexid, :string)
  filter(:name, :string)
  filter(:published_at, :date, :range => true)

  column(:hexid, :mandatory => true)
  column(:name, :mandatory => true)
  column(:data, :mandatory => true)
  #column(:published_at, :mandatory => true) do |pub|
  #  pub.to_date
  #end
  column(:published_at, :mandatory => true)
end

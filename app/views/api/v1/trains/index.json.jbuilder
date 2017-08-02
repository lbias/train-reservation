json.meta do
  json.current_page @trains.current_page
  json.total_pages @trains.total_pages
  json.per_page @trains.per_page
  json.total_entries @trains.total_entries

  if @trains.current_page == @trains.total_pages
    json.next_url nil # No next page on the last page
  else
    json.next_url api_v1_trains_url( :page => @trains.next_page )
  end

  if @trains.current_page == 1
    json.previous_url nil # No previous page on the first page
  else
    json.previous_url api_v1_trains_url( :page => @trains.previous_page )
  end
end

json.data do
  json.array! @trains, :partial => "item", :as => :train
end

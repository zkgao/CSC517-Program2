json.extract! inquiry, :house_id, :houseid, :userid, :subject, :msg, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)

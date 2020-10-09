json.extract! student, :id, :firstName, :lastName, :email, :uin, :gradYear, :major, :status, :created_at, :updated_at
json.url student_url(student, format: :json)

json.extract! student, :id, :firstName, :lastName, :email, :gradYear, :major, :status, :created_at, :updated_at
json.url student_url(student, format: :json)
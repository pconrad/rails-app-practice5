json.extract! student, :id, :id_number, :fname, :lname, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
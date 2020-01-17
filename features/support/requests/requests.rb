class Request
  def post_create(body)
    Http.post("/api/v1/create",
              :body => body)
  end

  def get_employee_id(id)
    Http.get("/api/v1/employee/#{id}")
  end

  def get_employees
    Http.get("/api/v1/employees")
  end

  def delete_employee_id(id)
    Http.delete("/api/v1/employee/#{id}")
  end
end

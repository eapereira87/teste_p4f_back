class Utils
  def utils_create_employee
    @name = Faker::Name.first_name
    @salary = Faker::Number.number(digits: 4)
    @age = Faker::Number.between(from: 18, to: 45)

    @response = Request.new.post_create(
      BodyCreate.new.body_post_create(
        @name,
        @salary,
        @age
      )
    )

    @id = @response.parsed_response["data"]["id"]
    return @id
  end
end

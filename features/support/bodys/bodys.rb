class BodyCreate
  def body_post_create(name, salary, age)
    $body = {
      "name": name,
      "salary": salary,
      "age": age,
    }.to_json
  end
end

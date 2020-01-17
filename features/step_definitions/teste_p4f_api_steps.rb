Dado("um novo empregado") do
  @name = Faker::Name.first_name
  @salary = Faker::Number.number(digits: 4)
  @age = Faker::Number.between(from: 18, to: 45)
end

Quando("faco uma solicitacao Post para o servico Create") do
  @response = Request.new.post_create(
    BodyCreate.new.body_post_create(
      @name,
      @salary,
      @age
    )
  )
end

Entao("o codigo de resposta HTTP deve ser igual a {int}") do |status_code|
  expect(@response.code).to eql status_code
end

Entao("o contrato deve ser valido {string}") do |schema|
  expect(JSON::Validator.validate!("#{$schema_root}#{schema}", @response.body)).to eql true
end

Dado("um empregado cadastrado") do
  @id = Utils.new.utils_create_employee
end

Dado("um empregado cadastrado {string}") do |id|
  @id = id
end

Quando("faco uma solicitacao Get para o servico Employee Id") do
  @response = Request.new.get_employee_id(@id)
end

# Entao("deve exibir os dados do empregado cadastro") do
#   # expect(@response.parsed_response).to have_key "status"
#   # expect(@response.parsed_response["data"]).to have_key "id"
#   # expect(@response.parsed_response["data"]).to have_key "employee_name"
#   # expect(@response.parsed_response["data"]).to have_key "employee_salary"
#   # expect(@response.parsed_response["data"]).to have_key "employee_age"
#   # expect(@response.parsed_response["data"]).to have_key "profile_image"
# end

Quando("faco uma solicitacao Get para o servico Employees") do
  @response = Request.new.get_employees
end

Entao("deve exibir os todos os empregados cadastrados") do
  expect(@response.parsed_response).to have_key "status"

  @response.parsed_response["data"].each do |data|
    expect(data).to have_key "id"
    expect(data).to have_key "employee_name"
    expect(data).to have_key "employee_salary"
    expect(data).to have_key "employee_age"
    expect(data).to have_key "profile_image"
  end
end

Quando("faco uma solicitacao DELETE para o servico Employee Id") do
  @response = Request.new.delete_employee_id(@id)
end

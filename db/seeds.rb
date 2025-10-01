# db/seeds.rb

puts "Criando Quartos Iniciais..."

Quarto.find_or_create_by!(numero: "01") do |q|
  q.tipo = "Standard"
  q.status = "Disponível"
end

Quarto.find_or_create_by!(numero: "02") do |q|
  q.tipo = "standard"
  q.status = "Disponível"
end

Quarto.find_or_create_by!(numero: "03") do |q|
  q.tipo = "standard"
  q.status = "Disponível"
end


Quarto.find_or_create_by!(numero: "04") do |q|
  q.tipo = "standard"
  q.status = "Disponível"
end


Quarto.find_or_create_by!(numero: "05") do |q|
  q.tipo = "standard"
  q.status = "Disponível"
end


Quarto.find_or_create_by!(numero: "06") do |q|
  q.tipo = "standard"
  q.status = "Disponível"
end


Quarto.find_or_create_by!(numero: "07") do |q|
  q.tipo = "standard"
  q.status = "Disponível"
end
# Adicione todos os outros quartos necessários aqui!

puts "Quartos criados com sucesso!"
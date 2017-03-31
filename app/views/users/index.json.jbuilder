json.usuarios do
  json.array! @users do |user|
    json.id user.id
    json.usuario user.usuario
    json.nombre user.nombre
    json.apellido user.apellido
    json.twitter user.twitter
  end
end
json.total @users.count

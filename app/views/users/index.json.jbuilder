json.usuarios do
  json.array! @users do |user|
    json.id user.id
    json.usuario user.username
    json.nombre user.first_name
    json.apellido user.last_name
    json.twitter user.twitter
  end
end

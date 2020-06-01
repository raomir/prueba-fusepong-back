# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Marca.create([
    { nombre: "Adidas", descripcion: "fnejhrfbwjhrb", slogan: "cwj erhbwjeh", ciudad: 'Neiva', 
      departamento: "Huila", pais: "Colombia", visible: true, color_principal: "rojo", color_secundario: "azul",
      email: "raomir@gmail.com", radio_de_cobertura: 4, social_media: "{[facebook: 'raomir', youtube:'raomir14']}", categorium_id: 2}, 
    
    { nombre: "Lacoste", descripcion: "fnejhrfbwjhrb", slogan: "cwj erhbwjeh", ciudad: 'Neiva', 
      departamento: "Huila", pais: "Colombia", visible: true, color_principal: "rojo", color_secundario: "azul",
      email: "raomir@gmail.com", radio_de_cobertura: 4, social_media: "{[facebook: 'raomir', youtube:'raomir14']}", categorium_id: 1}, 

    { nombre: "Samsung", descripcion: "fnejhrfbwjhrb", slogan: "cwj erhbwjeh", ciudad: 'Neiva', 
      departamento: "Huila", pais: "Colombia", visible: true, color_principal: "rojo", color_secundario: "azul",
      email: "raomir@gmail.com", radio_de_cobertura: 4, social_media: "{[facebook: 'raomir', youtube:'raomir14']}", categorium_id: 3}, 
    
    { nombre: "Lg", descripcion: "fnejhrfbwjhrb", slogan: "cwj erhbwjeh", ciudad: 'Neiva', 
      departamento: "Huila", pais: "Colombia", visible: true, color_principal: "rojo", color_secundario: "azul",
      email: "raomir@gmail.com", radio_de_cobertura: 4, social_media: "{[facebook: 'raomir', youtube:'raomir14']}", categorium_id: 4}, 

    { nombre: "Lacoste", descripcion: "fnejhrfbwjhrb", slogan: "cwj erhbwjeh", ciudad: 'Neiva', 
      departamento: "Huila", pais: "Colombia", visible: true, color_principal: "rojo", color_secundario: "azul",
      email: "raomir@gmail.com", radio_de_cobertura: 4, social_media: "{[facebook: 'raomir', youtube:'raomir14']}", categorium_id: 1} 
])

Categorium.create([
    { nombre: "Deportes"},
    { nombre: "Vehículos"},
    { nombre: "Tecnología"},
    { nombre: "Inmuebles"},
    { nombre: "Moda"}
])
